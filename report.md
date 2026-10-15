# Báo cáo đồ án cuối kỳ
**Trường:** Đại học Thủy Lợi
**Môn:** Cơ sở dữ liệu

**Đề tài:** Hệ thống quản lý khách sạn

**Nhóm 2:**
- Lê Đức Mình
- Đỗ Thái Linh
- Nguyễn Tuấn Nghĩa
- Vũ Đức Mạnh
- Nguyễn Chí Minh

**Giáo viên hướng dẫn:** Nguyễn Ngọc Quỳnh Châu

**Năm học:** 2025-2026

---

# Lời nói đầu

Nhóm em thực hiện đồ án “Hệ thống quản lý khách sạn” nhằm áp dụng các kiến thức đã học trong môn Cơ sở dữ liệu như phân tích bài toán, xác định thực thể, thuộc tính, mối quan hệ, chuyển mô hình ER sang mô hình quan hệ, chuẩn hóa dữ liệu, viết DDL/DML và khai thác dữ liệu bằng SQL Server. Đây là một đề tài rất gần gũi với đời sống thực tế, vì khách sạn luôn có nhu cầu quản lý khách hàng, phòng, đặt phòng, hóa đơn, dịch vụ và nhân viên theo một cách khoa học, rõ ràng và có tính toàn vẹn dữ liệu.

Mục tiêu của đồ án này là không chỉ làm một bài tập trên lý thuyết mà còn xây dựng cách tư duy thiết kế cơ sở dữ liệu đúng chuẩn. Nhóm em đã cố gắng mô tả rõ quy trình từ phân tích nghiệp vụ đến thiết kế mô hình dữ liệu, sau đó cài đặt bảng trên SQL Server và minh họa các thao tác dữ liệu thông qua SQL.

Trong báo cáo này, phần mô hình quan hệ và phần dữ liệu sẽ được trình bày có hệ thống, rõ ràng và phù hợp với yêu cầu của môn học. Phần 15 câu truy vấn SQL đã được tách riêng và lưu trong file riêng để phục vụ mục đích kiểm tra của nhóm, không đưa vào báo cáo chính theo yêu cầu đề bài.

---

# Mục lục
1. Chương 1: Giới thiệu bài toán
2. Chương 2: Phân tích và thiết kế cơ sở dữ liệu
   2.1 Mục đích hệ thống
   2.2 Đối tượng quản lý
   2.3 Các nghiệp vụ chính
   2.4 Các quy tắc nghiệp vụ
   2.5 Xác định thực thể và thuộc tính
   2.6 Mối liên kết giữa các thực thể
   2.7 Mô hình ER
   2.8 Chuyển đổi ER sang mô hình quan hệ
   2.9 Phụ thuộc hàm và kiểm tra chuẩn BCNF
3. Chương 3: Cài đặt và khai thác CSDL
   3.1 Tạo cơ sở dữ liệu
   3.2 Tạo các bảng và ràng buộc
   3.3 Nhập dữ liệu mẫu
   3.4 Thao tác DML minh họa ràng buộc
   3.5 Truy vấn SQL minh họa
4. Kết luận
5. Tài liệu tham khảo

---

# Chương 1. Giới thiệu bài toán

## 1.1 Bối cảnh và lý do chọn đề tài

Khách sạn là một đơn vị kinh doanh dịch vụ lưu trú, nghỉ dưỡng và chăm sóc khách hàng. Trong quá trình vận hành, khách sạn phải xử lý nhiều loại dữ liệu khác nhau như thông tin khách hàng, phòng, đặt phòng, hủy phòng, hóa đơn thanh toán, dịch vụ đi kèm, nhân viên và doanh thu. Nếu quản lý bằng cách thủ công, rất dễ gặp các vấn đề như:
- thiếu kiểm soát về phòng trống và phòng đã đặt;
- nhập nhầm thông tin khách hàng;
- sai số trong lập hóa đơn;
- không thống kê được doanh thu thực tế;
- khó kiểm tra các dịch vụ khách hàng đã sử dụng;
- không có ràng buộc dữ liệu nên dễ sai lệch và thiếu tính nhất quán.

Do đó, việc xây dựng một hệ thống quản lý khách sạn theo hướng cơ sở dữ liệu là rất cần thiết và phù hợp với thực tế. Đây cũng là một trong những đề tài điển hình trong môn Cơ sở dữ liệu, vì nó chứa đầy đủ các khái niệm về thực thể, thuộc tính, quan hệ, khóa chính, khóa ngoại, ràng buộc toàn vẹn và chuẩn hóa dữ liệu.

## 1.2 Mục tiêu của hệ thống

Hệ thống quản lý khách sạn được thiết kế với mục tiêu chính là lưu trữ và quản lý dữ liệu một cách tập trung, khoa học và có tính nhất quán. Cụ thể, hệ thống có các mục tiêu sau:
- Quản lý thông tin khách hàng;
- Quản lý loại phòng và thông tin phòng;
- Quản lý đặt phòng và trạng thái phòng;
- Quản lý thanh toán và hóa đơn;
- Quản lý dịch vụ đi kèm trong thời gian lưu trú;
- Hỗ trợ báo cáo doanh thu và thống kê.

## 1.3 Đối tượng quản lý

Hệ thống quản lý các đối tượng sau:
- Khách hàng
- Loại phòng
- Phòng
- Đặt phòng
- Chi tiết đặt phòng
- Hóa đơn
- Dịch vụ
- Sử dụng dịch vụ
- Nhân viên

## 1.4 Các nghiệp vụ chính

Các nghiệp vụ chính của hệ thống khách sạn bao gồm:
1. Quản lý khách hàng
   - Thêm, sửa, xóa và tìm kiếm thông tin khách hàng.
   - Chỉ lưu trữ đúng thông tin cá nhân và liên hệ.
2. Quản lý phòng
   - Thêm, cập nhật loại phòng, thông tin tầng, số phòng và trạng thái phòng.
   - Theo dõi phòng trống, phòng đã đặt, phòng đang ở và phòng bảo trì.
3. Quản lý đặt phòng
   - Khách hàng đặt phòng theo ngày đến, ngày đi và số lượng người.
   - Một đơn đặt phòng có thể gắn với nhiều phòng.
   - Có thể hủy hoặc cập nhật trạng thái đặt phòng.
4. Quản lý hóa đơn
   - Khi khách trả phòng hoặc kết thúc lưu trú, lập hóa đơn.
   - Hóa đơn gồm tiền phòng và các dịch vụ khách sử dụng.
5. Quản lý dịch vụ
   - Khách sạn có nhiều loại dịch vụ: giặt ủi, ăn sáng, spa, đưa đón, bể bơi...
   - Dịch vụ có thể được ghi nhận trong hóa đơn.
6. Quản lý nhân viên
   - Quản lý thông tin nhân viên và người lập hóa đơn.
7. Báo cáo doanh thu
   - Thống kê doanh thu theo tháng, theo loại phòng, theo dịch vụ.

---

# Chương 2. Phân tích và thiết kế CSDL

## 2.1 Mục đích hệ thống

Hệ thống được xây dựng với mục đích tạo ra một cơ sở dữ liệu tập trung, giúp khách sạn lưu trữ, cập nhật và truy vấn thông tin ngày càng hiệu quả hơn. Thông tin cần được quản lý có tính chính xác và nhất quán để phục vụ cho nhiều chức năng khác nhau như tra cứu phòng, lập hóa đơn, tính doanh thu và kiểm tra dữ liệu lịch sử.

## 2.2 Đối tượng quản lý

### 2.2.1 Khách hàng
Khách hàng là người sử dụng dịch vụ lưu trú hoặc các dịch vụ phụ trợ của khách sạn. Một khách hàng có thể đặt nhiều phòng trong nhiều thời điểm khác nhau. Vì vậy khách hàng là đối tượng chủ chốt của hệ thống.

### 2.2.2 Loại phòng
Khách sạn có nhiều loại phòng như phòng tiêu chuẩn, phòng deluxe, phòng gia đình, phòng VIP... Mỗi loại phòng có giá theo đêm, sức chứa và đặc tính riêng. Loại phòng là căn cứ để tính tiền và xác định mức độ phục vụ.

### 2.2.3 Phòng
Phòng là tài sản vật lý của khách sạn. Mỗi phòng có số phòng, tầng, trạng thái và thuộc một loại phòng. Trạng thái phòng giúp quản lý tình trạng phòng rỗi, đã đặt, đang có khách hoặc đang bảo trì.

### 2.2.4 Đặt phòng
Đặt phòng là quá trình khách hàng yêu cầu lưu trú trong khoảng thời gian nhất định. Đặt phòng cần lưu thông tin về khách hàng, ngày đến, ngày đi, số lượng người, trạng thái đặt phòng, ghi chú bổ sung.

### 2.2.5 Chi tiết đặt phòng
Do một đặt phòng có thể gồm nhiều phòng, nên cần có bảng chi tiết đặt phòng để lưu khoảng cách giữa đặt phòng và phòng. Mỗi bản ghi trong bảng này biểu diễn sự gán giữa một đơn đặt phòng với một phòng cụ thể.

### 2.2.6 Hóa đơn
Hóa đơn được lập sau khi khách trả phòng hoặc khi kết thúc thời gian lưu trú. Hóa đơn thể hiện tổng số tiền khách phải thanh toán từ tiền phòng và các dịch vụ phát sinh.

### 2.2.7 Dịch vụ
Dịch vụ là các sản phẩm phụ được khách hàng sử dụng tại khách sạn như ăn sáng, giặt ủi, đưa đón sân bay, spa, hồ bơi, phòng gym,... Mỗi dịch vụ có đơn giá và được ghi nhận khi khách dùng.

### 2.2.8 Sử dụng dịch vụ
Bảng này ghi lại hoạt động khách hàng sử dụng những dịch vụ nào, số lượng, đơn giá và thành tiền. Đây là cơ sở để tính tổng hóa đơn.

### 2.2.9 Nhân viên
Nhân viên là người thực hiện các thao tác nghiệp vụ như lập hóa đơn, tiếp nhận khách, hỗ trợ quản lý phòng. Mỗi hóa đơn được gắn với một nhân viên lập hóa đơn cụ thể.

## 2.3 Các nghiệp vụ chính

Hệ thống khách sạn cần đảm bảo các nghiệp vụ sau:
1. Nghiệp vụ đăng ký khách hàng
2. Nghiệp vụ đặt phòng
3. Nghiệp vụ nhận phòng
4. Nghiệp vụ trả phòng
5. Nghiệp vụ dịch vụ đi kèm
6. Nghiệp vụ báo cáo và thống kê

## 2.4 Các quy tắc nghiệp vụ

- Một khách hàng có thể có nhiều đặt phòng.
- Một đặt phòng có thể gồm nhiều phòng.
- Mỗi phòng thuộc một loại phòng.
- Không cho phép đồng thời đặt cùng một phòng trong cùng thời gian.
- Trạng thái phòng và đặt phòng chỉ nhận các giá trị định nghĩa trước.
- Mỗi hóa đơn phải thuộc về một đặt phòng và một nhân viên lập hóa đơn.

## 2.5 Xác định các thực thể và thuộc tính

### Thực thể KhachHang
- MaKH
- TenKH
- NgaySinh
- GioiTinh
- SDT
- Email
- DiaChi

### Thực thể LoaiPhong
- MaLoai
- TenLoai
- GiaTheoDem
- SucChua
- MoTa

### Thực thể Phong
- MaPhong
- SoPhong
- MaLoai
- Tang
- TrangThai

### Thực thể DatPhong
- MaDat
- MaKH
- NgayDat
- NgayDen
- NgayDi
- TrangThai
- SoNguoi
- GhiChu

### Thực thể ChiTietDatPhong
- MaDat
- MaPhong
- GiaTheoDem
- SoDem

### Thực thể NhanVien
- MaNV
- TenNV
- ChucVu
- SDT
- Luong

### Thực thể HoaDon
- MaHD
- MaDat
- MaNV
- NgayLap
- TriGia
- DaThanhToan

### Thực thể DichVu
- MaDV
- TenDV
- DonGia

### Thực thể SuDungDV
- MaSD
- MaHD
- MaDV
- SoLuong
- DonGia
- ThanhTien

## 2.6 Xác định mối liên kết

- KhachHang 1—N DatPhong
- DatPhong M—N Phong thông qua ChiTietDatPhong
- Phong N—1 LoaiPhong
- DatPhong 1—1 HoaDon
- HoaDon 1—N SuDungDV
- HoaDon N—1 NhanVien

## 2.7 Mô hình ER

Mô hình ER của hệ thống khách sạn gồm các thực thể chính: KhachHang, DatPhong, ChiTietDatPhong, Phong, LoaiPhong, HoaDon, SuDungDV, DichVu, NhanVien. Các quan hệ này phản ánh đúng nghiệp vụ về đặt phòng, thanh toán và dịch vụ đi kèm.

ERD được lưu trong file `erd.md` và có thể xem trực tiếp như sơ đồ. Mô hình ER đáp ứng yêu cầu có ít nhất 8 thực thể và nhiều hơn 7 mối liên kết.

## 2.8 Chuyển mô hình ER sang mô hình quan hệ

- KhachHang(MaKH, TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi)
- LoaiPhong(MaLoai, TenLoai, GiaTheoDem, SucChua, MoTa)
- Phong(MaPhong, SoPhong, MaLoai, Tang, TrangThai)
- DatPhong(MaDat, MaKH, NgayDat, NgayDen, NgayDi, TrangThai, SoNguoi, GhiChu)
- ChiTietDatPhong(MaDat, MaPhong, GiaTheoDem, SoDem)
- NhanVien(MaNV, TenNV, ChucVu, SDT, Luong)
- HoaDon(MaHD, MaDat, MaNV, NgayLap, TriGia, DaThanhToan)
- DichVu(MaDV, TenDV, DonGia)
- SuDungDV(MaSD, MaHD, MaDV, SoLuong, DonGia, ThanhTien)

### Khóa chính và khóa ngoại
- KhachHang: MaKH là khóa chính.
- LoaiPhong: MaLoai là khóa chính.
- Phong: MaPhong là khóa chính; MaLoai là khóa ngoại.
- DatPhong: MaDat là khóa chính; MaKH là khóa ngoại.
- ChiTietDatPhong: (MaDat, MaPhong) là khóa chính; MaDat, MaPhong là khóa ngoại.
- NhanVien: MaNV là khóa chính.
- HoaDon: MaHD là khóa chính; MaDat, MaNV là khóa ngoại.
- DichVu: MaDV là khóa chính.
- SuDungDV: MaSD là khóa chính; MaHD, MaDV là khóa ngoại.

## 2.9 Phụ thuộc hàm và kiểm tra BCNF

### 2.9.1 Phụ thuộc hàm
- MaKH -> TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi
- MaLoai -> TenLoai, GiaTheoDem, SucChua, MoTa
- MaPhong -> SoPhong, MaLoai, Tang, TrangThai
- MaDat -> MaKH, NgayDat, NgayDen, NgayDi, TrangThai, SoNguoi, GhiChu
- (MaDat, MaPhong) -> GiaTheoDem, SoDem
- MaNV -> TenNV, ChucVu, SDT, Luong
- MaHD -> MaDat, MaNV, NgayLap, TriGia, DaThanhToan
- MaDV -> TenDV, DonGia
- MaSD -> MaHD, MaDV, SoLuong, DonGia, ThanhTien

### 2.9.2 Kiểm tra BCNF
Các quan hệ đều đáp ứng chuẩn BCNF vì mỗi thuộc tính không khóa đều phụ thuộc hoàn toàn vào khóa chính. Không có biến dạng phụ thuộc hàm cần phân rã thêm. Mô hình này là phù hợp với yêu cầu môn học.

---

# Chương 3. Cài đặt và khai thác CSDL

## 3.1 Tạo database

```sql
CREATE DATABASE KhachSanDB;
GO
USE KhachSanDB;
GO
```

## 3.2 Tạo bảng và ràng buộc

Lệnh tạo bảng đã được viết đầy đủ trong file `queries.sql` và có thể chạy trực tiếp trên SQL Server. Các bảng bao gồm:
- KhachHang
- LoaiPhong
- Phong
- DatPhong
- ChiTietDatPhong
- NhanVien
- HoaDon
- DichVu
- SuDungDV

Mỗi bảng đều có khóa chính, khóa ngoại và ràng buộc CHECK tương ứng.

## 3.3 Nhập dữ liệu mẫu

Dữ liệu mẫu được sinh với số lượng lớn hơn 20 bản ghi cho từng bảng, nhằm mục đích kiểm thử và tìm lỗi. Dữ liệu có các trạng thái bình thường và biên, như:
- phòng trống, phòng đã đặt, phòng đang ở;
- khách hàng có lịch sử đặt nhiều lần;
- dịch vụ có giá khác nhau;
- có dữ liệu trùng ở một số thuộc tính không khóa.

## 3.4 Thao tác DML minh họa

### Insert
```sql
INSERT INTO KhachHang(MaKH, TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi)
VALUES ('KH001', N'Nguyễn Văn A', '1998-05-12', 'M', '0901234567', 'a@gmail.com', N'Hà Nội');
```

### Update
```sql
UPDATE Phong
SET TrangThai = 'Occupied'
WHERE MaPhong = 'P001';
```

### Delete
```sql
DELETE FROM DichVu WHERE MaDV = 'DV01';
```

### Lỗi khóa chính trùng
```sql
INSERT INTO KhachHang(MaKH, TenKH) VALUES ('KH001', N'Test');
```

### Lỗi khóa ngoại không tồn tại
```sql
INSERT INTO DatPhong(MaDat, MaKH, NgayDen, NgayDi, TrangThai)
VALUES ('DP999', 'KH999', '2026-11-01', '2026-11-03', 'Booked');
```

### Lỗi CHECK
```sql
INSERT INTO LoaiPhong(MaLoai, TenLoai, GiaTheoDem, SucChua)
VALUES ('L99', N'Test', -100, 0);
```

Những ví dụ trên cho thấy ràng buộc toàn vẹn của hệ thống hoạt động đúng với dữ liệu không hợp lệ.

## 3.5 Truy vấn SQL minh họa

Phần này đã được tách riêng thành file `queries.sql` để đáp ứng yêu cầu của nhóm, không đưa vào báo cáo chính. Tập hợp truy vấn này bao gồm:
- truy vấn cơ bản;
- truy vấn nhiều bảng;
- truy vấn gom nhóm và thống kê;
- truy vấn lồng nhau;
- truy vấn kiểm tra chồng lịch đặt phòng.

---

# Kết luận

Qua đồ án này, nhóm em đã thực hiện đầy đủ các nội dung trọng tâm của môn Cơ sở dữ liệu: phân tích bài toán, xác định thực thể và thuộc tính, thiết kế mô hình ER, chuyển sang mô hình quan hệ, chuẩn hóa dữ liệu, cài đặt trên SQL Server và viết truy vấn SQL kiểm thử. Đề tài Quản lý khách sạn là một ví dụ thực tế rất phù hợp để ứng dụng lý thuyết vào thực hành.

Hệ thống đã đáp ứng các yêu cầu cơ bản của một ứng dụng quản lý khách sạn như lưu thông tin khách hàng, đặt phòng, lập hóa đơn, quản lý dịch vụ và báo cáo doanh thu. Nếu tiếp tục phát triển, hệ thống có thể mở rộng thêm các tính năng như quản lý thanh toán online, báo cáo BI, phân quyền người dùng và tích hợp với giao diện web hoặc mobile.

---

# Tài liệu tham khảo
- Giáo trình môn Cơ sở dữ liệu
- Microsoft SQL Server Documentation
- Tài liệu về mô hình ER, phụ thuộc hàm và BCNF
- Tài liệu tham khảo về thiết kế hệ thống quản lý khách sạn

---

# Phụ lục
- File ERD: `erd.md`
- File SQL riêng (15 truy vấn): `queries.sql`
- File báo cáo chính: `report.md`

Kết thúc báo cáo.
