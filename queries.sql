-- File lưu 15 truy vấn SQL riêng theo yêu cầu (không đưa vào báo cáo chính)

USE KhachSanDB;
GO

-- 1. Hiển thị toàn bộ danh sách khách hàng
SELECT *
FROM KhachHang;

-- 2. Hiển thị phòng đang Available theo tầng
SELECT MaPhong, SoPhong, MaLoai, Tang, TrangThai
FROM Phong
WHERE TrangThai = 'Available'
ORDER BY Tang, SoPhong;

-- 3. Hiển thị loại phòng có giá > 1.000.000
SELECT *
FROM LoaiPhong
WHERE GiaTheoDem > 1000000
ORDER BY GiaTheoDem DESC;

-- 4. Cập nhật trạng thái phòng
UPDATE Phong
SET TrangThai = 'Occupied'
WHERE MaPhong = 'P001';

-- 5. Hiển thị các đặt phòng của khách hàng KH001
SELECT d.MaDat, d.NgayDat, d.NgayDen, d.NgayDi, d.TrangThai, d.SoNguoi
FROM DatPhong d
WHERE d.MaKH = 'KH001'
ORDER BY d.NgayDat DESC;

-- 6. Liệt kê chi tiết đặt phòng cho một mã đặt
SELECT c.MaDat, c.MaPhong, p.SoPhong, lp.TenLoai, c.GiaTheoDem, c.SoDem
FROM ChiTietDatPhong c
JOIN Phong p ON c.MaPhong = p.MaPhong
JOIN LoaiPhong lp ON p.MaLoai = lp.MaLoai
WHERE c.MaDat = 'DP001';

-- 7. Tìm phòng trống cho khoảng thời gian
DECLARE @NgayDen DATE = '2026-11-10';
DECLARE @NgayDi DATE = '2026-11-12';

SELECT p.MaPhong, p.SoPhong, p.MaLoai, p.Tang
FROM Phong p
WHERE p.TrangThai = 'Available'
  AND p.MaPhong NOT IN (
      SELECT c.MaPhong
      FROM ChiTietDatPhong c
      JOIN DatPhong d ON c.MaDat = d.MaDat
      WHERE NOT (d.NgayDi <= @NgayDen OR d.NgayDen >= @NgayDi)
  );

-- 8. Đếm số lượt đặt phòng theo khách hàng
SELECT k.MaKH, k.TenKH, COUNT(d.MaDat) AS SoLanDat
FROM KhachHang k
LEFT JOIN DatPhong d ON k.MaKH = d.MaKH
GROUP BY k.MaKH, k.TenKH
HAVING COUNT(d.MaDat) >= 1
ORDER BY SoLanDat DESC;

-- 9. Doanh thu theo tháng
SELECT YEAR(NgayLap) AS Nam, MONTH(NgayLap) AS Thang, SUM(TriGia) AS DoanhThu
FROM HoaDon
GROUP BY YEAR(NgayLap), MONTH(NgayLap)
ORDER BY Nam, Thang;

-- 10. 5 phòng được đặt nhiều nhất
SELECT p.MaPhong, p.SoPhong, COUNT(c.MaDat) AS SoLanDat
FROM Phong p
JOIN ChiTietDatPhong c ON p.MaPhong = c.MaPhong
GROUP BY p.MaPhong, p.SoPhong
ORDER BY SoLanDat DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- 11. Khách hàng tiêu tốn nhiều hơn mức trung bình
SELECT k.MaKH, k.TenKH, SUM(h.TriGia) AS TongChiTieu
FROM KhachHang k
JOIN DatPhong d ON k.MaKH = d.MaKH
JOIN HoaDon h ON d.MaDat = h.MaDat
GROUP BY k.MaKH, k.TenKH
HAVING SUM(h.TriGia) > (
  SELECT AVG(TotalPerCustomer)
  FROM (
      SELECT SUM(h2.TriGia) AS TotalPerCustomer
      FROM DatPhong d2
      JOIN HoaDon h2 ON d2.MaDat = h2.MaDat
      GROUP BY d2.MaKH
  ) t
);

-- 12. Xếp hạng khách theo tổng chi tiêu
SELECT MaKH, TenKH, TongChiTieu, RANK() OVER (ORDER BY TongChiTieu DESC) AS Hang
FROM (
  SELECT k.MaKH, k.TenKH, COALESCE(SUM(h.TriGia),0) AS TongChiTieu
  FROM KhachHang k
  LEFT JOIN DatPhong d ON k.MaKH = d.MaKH
  LEFT JOIN HoaDon h ON d.MaDat = h.MaDat
  GROUP BY k.MaKH, k.TenKH
) t;

-- 13. Doanh thu theo dịch vụ
SELECT dv.MaDV, dv.TenDV, SUM(sd.SoLuong) AS TongSoLuong, SUM(sd.ThanhTien) AS DoanhThu
FROM SuDungDV sd
JOIN DichVu dv ON sd.MaDV = dv.MaDV
GROUP BY dv.MaDV, dv.TenDV
ORDER BY DoanhThu DESC;

-- 14. Tìm phòng chưa từng được đặt
SELECT p.MaPhong, p.SoPhong
FROM Phong p
LEFT JOIN ChiTietDatPhong c ON p.MaPhong = c.MaPhong
WHERE c.MaPhong IS NULL;

-- 15. Phát hiện phòng bị double-booking
SELECT DISTINCT c1.MaPhong, d1.MaDat AS Dat1, d1.NgayDen AS D1_NgayDen, d1.NgayDi AS D1_NgayDi,
                d2.MaDat AS Dat2, d2.NgayDen AS D2_NgayDen, d2.NgayDi AS D2_NgayDi
FROM ChiTietDatPhong c1
JOIN DatPhong d1 ON c1.MaDat = d1.MaDat
JOIN ChiTietDatPhong c2 ON c1.MaPhong = c2.MaPhong
JOIN DatPhong d2 ON c2.MaDat = d2.MaDat
WHERE d1.MaDat < d2.MaDat
  AND NOT (d1.NgayDi <= d2.NgayDen OR d2.NgayDi <= d1.NgayDen);
