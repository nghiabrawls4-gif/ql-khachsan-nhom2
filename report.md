# Hệ thống quản lý khách sạn

## Thông tin nhóm
- Nhóm 2
- Lê Đức Mình
- Đỗ Thái Linh
- Nguyễn Tuấn Nghĩa
- Vũ Đức Mạnh
- Nguyễn Chí Minh
- Giáo viên hướng dẫn: Nguyễn Ngọc Quỳnh Châu
- Năm học: 2025-2026

---

# BÁO CÁO ĐỒ ÁN CUỐI KỲ
# MÔN: CƠ SỞ DỮ LIỆU
# ĐỀ TÀI: HỆ THỐNG QUẢN LÝ KHÁCH SẠN

## Lời nói đầu
Nhóm em thực hiện đồ án “Hệ thống quản lý khách sạn” nhằm áp dụng những kiến thức đã học trong môn Cơ sở dữ liệu như phân tích nghiệp vụ, thiết kế mô hình ER, chuyển sang mô hình quan hệ, viết lệnh DDL/DML trên SQL Server và khai thác dữ liệu bằng truy vấn SQL. Báo cáo này trình bày đầy đủ các bước từ phân tích bài toán đến thiết kế mô hình dữ liệu và xây dựng cơ sở dữ liệu cho hệ thống quản lý khách sạn.

---

# Chương 1. Giới thiệu bài toán

## 1.1 Bối cảnh và lý do chọn đề tài
Khách sạn là nơi cung cấp dịch vụ lưu trú, nghỉ dưỡng và chăm sóc khách hàng. Trong thực tế, hoạt động của khách sạn thường phát sinh nhiều dữ liệu như thông tin khách hàng, phòng, đặt phòng, hóa đơn, dịch vụ đi kèm và nhân viên. Nếu quản lý thủ công, nhiều thao tác sẽ dễ sai sót, thiếu chính xác và gây khó khăn cho việc thống kê doanh thu, theo dõi phòng trống và kiểm soát dịch vụ.

Vì vậy, nhóm em chọn đề tài “Hệ thống quản lý khách sạn” để xây dựng một cơ sở dữ liệu giúp lưu trữ, quản lý và tra cứu dữ liệu hiệu quả hơn, đồng thời rèn luyện kỹ năng thiết kế CSDL và SQL.

## 1.2 Mục tiêu của hệ thống
Hệ thống quản lý khách sạn được xây dựng với các mục tiêu chính như sau:
- Quản lý thông tin khách hàng.
- Quản lý loại phòng và các phòng của khách sạn.
- Quản lý đặt phòng và trạng thái phòng.
- Quản lý dịch vụ và hóa đơn.
- Hỗ trợ báo cáo doanh thu và thống kê hoạt động.

## 1.3 Đối tượng quản lý
Hệ thống quản lý các đối tượng chính sau:
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
- Đăng ký thông tin khách hàng mới.
- Quản lý loại phòng và trạng thái phòng.
- Đặt phòng theo ngày đến, ngày đi và số lượng khách.
- Gán phòng cho mỗi đơn đặt phòng.
- Quản lý nhận phòng và trả phòng.
- Lập hóa đơn tiền phòng và dịch vụ.
- Theo dõi tiêu dùng dịch vụ của khách hàng.
- Thống kê doanh thu theo tháng, theo dịch vụ, theo phòng.

---

# Chương 2. Phân tích và thiết kế CSDL

## 2.1 Mục đích của hệ thống
Hệ thống được xây dựng nhằm quản lý các thông tin trong quá trình vận hành khách sạn, giảm thiểu sai sót trong quá trình đặt phòng, thanh toán và báo cáo, đồng thời hỗ trợ quản lý ra quyết định. Hệ thống giúp nhân viên lễ tân và quản lý theo dõi tình trạng phòng, khách hàng, hóa đơn và doanh thu một cách nhanh chóng, đúng thời điểm.

## 2.2 Đối tượng quản lý chi tiết
### 2.2.1 Khách hàng
Khách hàng là người đến thuê phòng hoặc sử dụng các dịch vụ của khách sạn. Mỗi khách hàng sẽ có thông tin: mã khách hàng, tên khách hàng, ngày sinh, giới tính, số điện thoại, email, địa chỉ.

### 2.2.2 Loại phòng
Loại phòng mô tả đặc tính và giá của từng loại phòng như tiêu chuẩn, cao cấp, gia đình... Mỗi loại phòng có: mã loại, tên loại, giá theo đêm, sức chứa, mô tả.

### 2.2.3 Phòng
Phòng là tài sản của khách sạn, mỗi phòng được định danh riêng và thuộc một loại phòng. Mỗi phòng có: mã phòng, số phòng, tầng, trạng thái phòng.

### 2.2.4 Đặt phòng
Đơn đặt phòng chứa thông tin thời gian, khách hàng đặt phòng và các điều kiện đặt. Một đặt phòng có: mã đặt phòng, mã khách hàng, ngày đặt, ngày đến, ngày đi, trạng thái, số người, ghi chú.

### 2.2.5 Chi tiết đặt phòng
Một đặt phòng có thể gồm nhiều phòng, nên phải lưu thông tin chi tiết đặt phòng: mã đặt phòng, mã phòng, giá theo đêm và số đêm.

### 2.2.6 Hóa đơn
Hóa đơn được lập khi khách hàng trả phòng hoặc kết thúc kỳ lưu trú. Hóa đơn gồm: mã hóa đơn, mã đặt phòng, mã nhân viên, ngày lập, tổng giá trị, trạng thái đã thanh toán hay chưa.

### 2.2.7 Dịch vụ
Khách sạn cung cấp nhiều dịch vụ như giặt ủi, ăn sáng, đưa đón, bể bơi, spa... Mỗi dịch vụ có: mã dịch vụ, tên dịch vụ, đơn giá.

### 2.2.8 Sử dụng dịch vụ
Bảng này lưu trữ các dịch vụ khách hàng sử dụng trong thời gian lưu trú. Có các thuộc tính: mã sử dụng dịch vụ, mã hóa đơn, mã dịch vụ, số lượng, đơn giá, thành tiền.

### 2.2.9 Nhân viên
Nhân viên là người lập hóa đơn hoặc quản lý khách sạn. Thông tin nhân viên gồm: mã nhân viên, tên, chức vụ, số điện thoại, lương.

## 2.3 Các quy tắc nghiệp vụ
- Một khách hàng có thể có nhiều đặt phòng.
- Một đặt phòng có thể gồm nhiều phòng.
- Mỗi phòng thuộc một loại phòng.
- Một đặt phòng được liên kết với một hóa đơn khi khách trả phòng.
- Một hóa đơn có thể có nhiều dịch vụ phát sinh.
- Không cho phép đồng thời đặt cùng một phòng trong cùng thời gian.
- Trạng thái phòng chỉ có các giá trị cho phép như Available, Booked, Occupied, Maintenance.
- Trạng thái đặt phòng chỉ được nhận các giá trị: Booked, CheckedIn, CheckedOut, Cancelled.

## 2.4 Xác định thực thể và thuộc tính
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

## 2.5 Xác định các mối liên kết
- KhachHang 1 – N DatPhong
- DatPhong M – N Phong thông qua ChiTietDatPhong
- Phong N – 1 LoaiPhong
- DatPhong 1 – 1 HoaDon
- HoaDon 1 – N SuDungDV
- HoaDon N – 1 NhanVien

## 2.6 Mô hình ER
### 2.6.1 Mô tả ER theo logic nghiệp vụ
- Một khách hàng có thể đặt nhiều phòng trong nhiều ngày khác nhau.
- Một đơn đặt phòng có thể chứa nhiều phòng của khách sạn.
- Mỗi phòng chỉ thuộc một loại phòng.
- Khi kết thúc lưu trú, hóa đơn được lập và gắn với một đặt phòng và một nhân viên lập hóa đơn.
- Dịch vụ khách sử dụng được lưu trong bảng SuDungDV để xác định thanh toán và chi phí phát sinh.

### 2.6.2 Mô hình ER rút gọn
ERD mô tả các thực thể và quan hệ chính như sau:
- KhachHang -> DatPhong
- DatPhong -> ChiTietDatPhong -> Phong
- LoaiPhong -> Phong
- DatPhong -> HoaDon
- HoaDon -> SuDungDV -> DichVu
- HoaDon -> NhanVien

Mô hình ER này phù hợp với yêu cầu bài toán và phản ánh đúng nghiệp vụ của khách sạn.

## 2.7 Chuyển mô hình ER sang mô hình quan hệ
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

## 2.8 Phụ thuộc hàm
### 2.8.1 KhachHang
- MaKH -> TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi

### 2.8.2 LoaiPhong
- MaLoai -> TenLoai, GiaTheoDem, SucChua, MoTa

### 2.8.3 Phong
- MaPhong -> SoPhong, MaLoai, Tang, TrangThai

### 2.8.4 DatPhong
- MaDat -> MaKH, NgayDat, NgayDen, NgayDi, TrangThai, SoNguoi, GhiChu

### 2.8.5 ChiTietDatPhong
- (MaDat, MaPhong) -> GiaTheoDem, SoDem

### 2.8.6 NhanVien
- MaNV -> TenNV, ChucVu, SDT, Luong

### 2.8.7 HoaDon
- MaHD -> MaDat, MaNV, NgayLap, TriGia, DaThanhToan

### 2.8.8 DichVu
- MaDV -> TenDV, DonGia

### 2.8.9 SuDungDV
- MaSD -> MaHD, MaDV, SoLuong, DonGia, ThanhTien

## 2.9 Kiểm tra chuẩn BCNF
Các quan hệ trong mô hình đều có khóa chính và các thuộc tính phụ thuộc hoàn toàn vào khóa chính. Không xuất hiện phụ thuộc hàm nào mà trái với nguyên tắc của BCNF.

- KhachHang đạt BCNF.
- LoaiPhong đạt BCNF.
- Phong đạt BCNF.
- DatPhong đạt BCNF.
- ChiTietDatPhong đạt BCNF.
- NhanVien đạt BCNF.
- HoaDon đạt BCNF.
- DichVu đạt BCNF.
- SuDungDV đạt BCNF.

Kết luận: mô hình quan hệ hiện tại có thể chấp nhận và thỏa chuẩn BCNF ở mức cơ bản.

---

# Chương 3. Cài đặt và khai thác CSDL

## 3.1 Tạo database trên SQL Server
Mã lệnh tạo CSDL như sau:
```sql
CREATE DATABASE KhachSanDB;
GO
USE KhachSanDB;
GO
```

## 3.2 DDL — tạo các bảng và ràng buộc
```sql
CREATE TABLE KhachHang (
  MaKH VARCHAR(10) PRIMARY KEY,
  TenKH NVARCHAR(100) NOT NULL,
  NgaySinh DATE NULL,
  GioiTinh CHAR(1) CHECK (GioiTinh IN ('M','F','O')) NULL,
  SDT VARCHAR(20),
  Email NVARCHAR(100),
  DiaChi NVARCHAR(200)
);

CREATE TABLE LoaiPhong (
  MaLoai VARCHAR(10) PRIMARY KEY,
  TenLoai NVARCHAR(50) NOT NULL,
  GiaTheoDem DECIMAL(18,2) NOT NULL CHECK (GiaTheoDem >= 0),
  SucChua INT NOT NULL CHECK (SucChua > 0),
  MoTa NVARCHAR(200)
);

CREATE TABLE Phong (
  MaPhong VARCHAR(10) PRIMARY KEY,
  SoPhong NVARCHAR(20) NOT NULL,
  MaLoai VARCHAR(10) NOT NULL,
  Tang INT,
  TrangThai NVARCHAR(20) NOT NULL CHECK (TrangThai IN ('Available','Booked','Occupied','Maintenance')),
  CONSTRAINT FK_Phong_LoaiPhong FOREIGN KEY (MaLoai) REFERENCES LoaiPhong(MaLoai)
);

CREATE TABLE DatPhong (
  MaDat VARCHAR(12) PRIMARY KEY,
  MaKH VARCHAR(10) NOT NULL,
  NgayDat DATETIME NOT NULL DEFAULT GETDATE(),
  NgayDen DATE NOT NULL,
  NgayDi DATE NOT NULL,
  TrangThai NVARCHAR(20) NOT NULL CHECK (TrangThai IN ('Booked','CheckedIn','CheckedOut','Cancelled')),
  SoNguoi INT,
  GhiChu NVARCHAR(200),
  CONSTRAINT FK_DatPhong_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

CREATE TABLE ChiTietDatPhong (
  MaDat VARCHAR(12) NOT NULL,
  MaPhong VARCHAR(10) NOT NULL,
  GiaTheoDem DECIMAL(18,2) NOT NULL,
  SoDem INT NOT NULL CHECK (SoDem > 0),
  PRIMARY KEY (MaDat, MaPhong),
  CONSTRAINT FK_CTD_DatPhong FOREIGN KEY (MaDat) REFERENCES DatPhong(MaDat),
  CONSTRAINT FK_CTD_Phong FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong)
);

CREATE TABLE NhanVien (
  MaNV VARCHAR(10) PRIMARY KEY,
  TenNV NVARCHAR(100) NOT NULL,
  ChucVu NVARCHAR(50),
  SDT VARCHAR(20),
  Luong DECIMAL(18,2) CHECK (Luong >= 0)
);

CREATE TABLE HoaDon (
  MaHD VARCHAR(12) PRIMARY KEY,
  MaDat VARCHAR(12) NOT NULL,
  MaNV VARCHAR(10) NULL,
  NgayLap DATETIME NOT NULL DEFAULT GETDATE(),
  TriGia DECIMAL(18,2) NOT NULL CHECK (TriGia >= 0),
  DaThanhToan BIT DEFAULT 0,
  CONSTRAINT FK_HoaDon_DatPhong FOREIGN KEY (MaDat) REFERENCES DatPhong(MaDat),
  CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

CREATE TABLE DichVu (
  MaDV VARCHAR(10) PRIMARY KEY,
  TenDV NVARCHAR(100) NOT NULL,
  DonGia DECIMAL(18,2) NOT NULL CHECK (DonGia >= 0)
);

CREATE TABLE SuDungDV (
  MaSD VARCHAR(12) PRIMARY KEY,
  MaHD VARCHAR(12) NOT NULL,
  MaDV VARCHAR(10) NOT NULL,
  SoLuong INT NOT NULL CHECK (SoLuong > 0),
  DonGia DECIMAL(18,2) NOT NULL,
  ThanhTien AS (SoLuong * DonGia) PERSISTED,
  CONSTRAINT FK_SD_HoaDon FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD),
  CONSTRAINT FK_SD_DichVu FOREIGN KEY (MaDV) REFERENCES DichVu(MaDV)
);
```

## 3.3 Dữ liệu mẫu
Để đảm bảo hệ thống có thể kiểm thử, mỗi bảng phải có số lượng bản ghi lớn hơn hoặc bằng 20. Trong quá trình cài đặt, nhóm em sinh dữ liệu mẫu với số lượng lớn, đủ để kiểm tra các truy vấn và xử lý ngoại lệ.

### 3.3.1 Dữ liệu mẫu loại phòng
- 25 bản ghi loại phòng
- Mỗi loại phòng có giá theo đêm và sức chứa khác nhau.

### 3.3.2 Dữ liệu mẫu phòng
- 60 phòng
- Trạng thái phòng được phân bổ như Available, Booked, Occupied, Maintenance.

### 3.3.3 Dữ liệu mẫu khách hàng
- 50 khách hàng
- Phân bố theo giới tính, tuổi và địa chỉ khác nhau.

### 3.3.4 Dữ liệu mẫu nhân viên
- 25 nhân viên
- Gồm lễ tân, buồng, quản lý.

### 3.3.5 Dữ liệu mẫu dịch vụ
- 30 loại dịch vụ
- Bao gồm ăn sáng, giặt ủi, spa, đưa đón...

### 3.3.6 Dữ liệu mẫu đặt phòng
- 40 đặt phòng
- Gắn với khách hàng và có mốc thời gian cụ thể.

### 3.3.7 Dữ liệu mẫu chi tiết đặt phòng
- Mỗi đơn đặt phòng có 1–3 phòng.
- Mỗi bản ghi lưu giá theo đêm và số đêm.

### 3.3.8 Dữ liệu mẫu hóa đơn
- Mỗi đặt phòng tương ứng với 1 hóa đơn.
- Hóa đơn được lưu với tổng tiền và thời gian thanh toán.

### 3.3.9 Dữ liệu mẫu sử dụng dịch vụ
- Mỗi hóa đơn có thể có nhiều dịch vụ sử dụng.
- Mỗi dịch vụ có số lượng và thành tiền được tính tự động.

## 3.4 Mô tả thao tác DML
### 3.4.1 INSERT
Dùng để tạo dữ liệu ban đầu cho các bảng, ví dụ:
```sql
INSERT INTO KhachHang(MaKH, TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi)
VALUES ('KH001', N'Nguyễn Văn A', '1998-05-12', 'M', '0901234567', 'a@gmail.com', N'Hà Nội');
```

### 3.4.2 UPDATE
Dùng để cập nhật thông tin hoặc trạng thái:
```sql
UPDATE Phong
SET TrangThai = 'Occupied'
WHERE MaPhong = 'P001';
```

### 3.4.3 DELETE
Xóa dữ liệu hợp lệ hoặc thử xóa dữ liệu vi phạm ràng buộc:
```sql
DELETE FROM DichVu WHERE MaDV = 'DV01';
```

## 3.5 Ví dụ về ràng buộc toàn vẹn ngăn chặn dữ liệu không hợp lệ
### 3.5.1 Khóa chính trùng
```sql
INSERT INTO KhachHang(MaKH, TenKH) VALUES ('KH001', N'Test');
```
Lệnh này sẽ bị lỗi vì khóa chính đã tồn tại.

### 3.5.2 Khóa ngoại không tồn tại
```sql
INSERT INTO DatPhong(MaDat, MaKH, NgayDen, NgayDi, TrangThai)
VALUES ('DP999', 'KH999', '2026-11-01', '2026-11-03', 'Booked');
```
Lệnh này sẽ bị lỗi vì KhachHang('KH999') không tồn tại.

### 3.5.3 Vi phạm CHECK
```sql
INSERT INTO LoaiPhong(MaLoai, TenLoai, GiaTheoDem, SucChua)
VALUES ('L99', N'Test', -100, 0);
```
Lệnh này sẽ bị lỗi vì giá không thể âm và sức chứa phải > 0.

---

# Kết luận
Thông qua đồ án này, nhóm em đã áp dụng các kiến thức của môn Cơ sở dữ liệu vào một bài toán thực tế: quản lý khách sạn. Quá trình làm việc từ phân tích nghiệp vụ, xác định thực thể, liệt kê thuộc tính, thiết kế ER, chuyển sang quan hệ, kiểm tra BCNF và cài đặt trên SQL Server đã giúp nhóm hiểu sâu hơn về cách xây dựng một hệ thống dữ liệu hiệu quả.

Cơ sở dữ liệu này đáp ứng tốt yêu cầu quản lý thông tin khách hàng, phòng, đặt phòng, dịch vụ và hóa đơn. Nếu tiếp tục phát triển, hệ thống có thể tích hợp thêm giao diện web, tích hợp thanh toán trực tuyến, báo cáo thống kê nâng cao và quản lý theo thời gian thực.

---

# Tài liệu tham khảo
- Giáo trình Cơ sở dữ liệu.
- Microsoft SQL Server Documentation.
- Slides và bài giảng môn Cơ sở dữ liệu.
- Tài liệu tham khảo về mô hình ER và chuẩn hóa dữ liệu.


### Ghi chú:
15 câu truy vấn SQL đã được lưu riêng trong file `queries.sql` để không làm dư thừa trong báo cáo chính theo yêu cầu của nhóm.
