# BCNF Proof — Hệ thống quản lý khách sạn

Mục đích: chứng minh từng quan hệ trong lược đồ quan hệ đạt chuẩn BCNF theo các phụ thuộc hàm (FDs) đã xác định.

Hướng dẫn: với mỗi quan hệ liệt kê các FD không tầm thường, xác định khóa (primary key / candidate keys), và chứng minh rằng vế trái của mọi FD là superkey. Nếu tìm thấy FD mà vế trái không phải superkey thì đề xuất phân rã.

---

1) KhachHang(MaKH, TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi)
- FD chính: MaKH -> {TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi}
- Khóa: MaKH (PK). Có thể có ứng viên khóa bổ sung nếu Email được đảm bảo duy nhất.
- Kiểm tra BCNF: vế trái của FD (MaKH) là superkey → thoả BCNF.

2) LoaiPhong(MaLoai, TenLoai, GiaTheoDem, SucChua, MoTa)
- FD: MaLoai -> {TenLoai, GiaTheoDem, SucChua, MoTa}
- Khóa: MaLoai.
- Kiểm tra: vế trái là superkey → BCNF.

3) Phong(MaPhong, SoPhong, MaLoai, Tang, TrangThai)
- FD: MaPhong -> {SoPhong, MaLoai, Tang, TrangThai}
- Nếu đặt UNIQUE(SoPhong) thì SoPhong -> MaPhong cũng là FD (SoPhong là candidate key)
- Khóa: MaPhong (PK); SoPhong có thể là candidate key nếu UNIQUE
- Kiểm tra: mọi FD có vế trái là superkey → BCNF.

4) DatPhong(MaDat, MaKH, NgayDat, NgayDen, NgayDi, TrangThai, SoNguoi, GhiChu)
- FD: MaDat -> {MaKH, NgayDat, NgayDen, NgayDi, TrangThai, SoNguoi, GhiChu}
- Khóa: MaDat.
- Kiểm tra: vế trái là superkey → BCNF.

5) ChiTietDatPhong(MaDat, MaPhong, GiaTheoDem, SoDem)
- FD: (MaDat, MaPhong) -> {GiaTheoDem, SoDem}
- Khóa: (MaDat, MaPhong) (PK composite)
- Kiểm tra: vế trái là superkey → BCNF.

6) NhanVien(MaNV, TenNV, ChucVu, SDT, Luong)
- FD: MaNV -> {TenNV, ChucVu, SDT, Luong}
- Khóa: MaNV.
- Kiểm tra: vế trái là superkey → BCNF.

7) HoaDon(MaHD, MaDat, MaNV, NgayLap, TriGia, DaThanhToan)
- FD: MaHD -> {MaDat, MaNV, NgayLap, TriGia, DaThanhToan}
- Thiết kế bổ sung: MaDat là unique trong bảng HoaDon (một DatPhong chỉ có một HoaDon). Khi đó MaDat -> MaHD cũng là FD và MaDat là candidate key.
- Khóa: MaHD (PK). MaDat là candidate key nếu UNIQUE constraint tồn tại.
- Kiểm tra: mọi FD có vế trái là superkey (MaHD hoặc MaDat) → BCNF.
- Ghi chú: TriGia là thuộc tính dẫn xuất (tổng các chi phí) — nó phụ thuộc vào MaHD và không tạo ra FD phá BCNF.

8) DichVu(MaDV, TenDV, DonGia)
- FD: MaDV -> {TenDV, DonGia}
- Khóa: MaDV.
- Kiểm tra: vế trái là superkey → BCNF.

9) SuDungDV(MaSD, MaDat, MaDV, SoLuong, DonGia, ThanhTien)
- FD: MaSD -> {MaDat, MaDV, SoLuong, DonGia, ThanhTien}
- ThanhTien = SoLuong * DonGia (computed) — đây là thuộc tính dẫn xuất nhưng biểu diễn dưới dạng computed column.
- Khóa: MaSD.
- Kiểm tra: vế trái là superkey → BCNF.

---

Kết luận chung:
- Với các FD nêu trên và các ràng buộc thiết kế (UNIQUE MaDat trong HoaDon, UNIQUE SoPhong trong Phong), mỗi quan hệ hiện tại có mọi FD có vế trái là superkey. Vì vậy mô hình đạt BCNF theo các FD đã liệt kê.

Lưu ý bổ sung nếu cần mở rộng chứng minh:
- Nếu giáo viên yêu cầu, mình sẽ viết "BCNF_proof_full.md" gồm: (a) toàn bộ FD xuất phát từ mô tả nghiệp vụ (kể cả FD suy luận/inferred), (b) mỗi FD ghi rõ xem vế trái là superkey hay không, (c) nếu không, đưa ra phân rã tương ứng (decomposition) và trình bày schema sau phân rã. Gõ “Yêu cầu BCNF detail” để mình tạo file đầy đủ.
