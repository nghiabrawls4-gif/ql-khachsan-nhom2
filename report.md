# Báo cáo đồ án cuối kỳ
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

Trong báo cáo này, phần mô hình quan hệ và phần dữ liệu sẽ được trình bày có hệ thống, rõ ràng và phù hợp với yêu cầu của môn học. Phần 15 câu truy vấn SQL đã được tách riêng trong file `queries.sql` theo yêu cầu của nhóm, để không làm lộn giữa phần báo cáo chính và phần khai thác dữ liệu.

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
   - Khách hàng đặt phòng theo ngày đến, ngày đi và số lượng khách.
   - Một đơn đặt phòng có thể gắn với nhiều phòng.
   - Có thể hủy hoặc cập nhật trạng thái đặt phòng.
4. Quản lý hóa đơn
   - Khi khách trả phòng hoặc kết thúc lưu trú, lập hóa đơn.
   - Hóa đơn gồm tiền phòng và các dịch vụ khách sử dụng.
5. Quản lý dịch vụ
   - Khách sạn có nhiều loại dịch vụ: giặt ủi, ăn sáng, spa, đưa đón, bể bơi...
   - Dịch vụ có thể được ghi nhận trong hóa đơn.
6. Quản lý nhân viên
   - Quản lý thông tin personeel và người lập hóa đơn.
7. Báo cáo doanh thu
   - Thống kê doanh thu theo tháng, theo loại phòng, theo dịch vụ.

---

# Chương 2. Phân tích và thiết kế CSDL

## 2.1 Mục đích hệ thống

Hệ thống được xây dựng với mục đích tạo ra một cơ sở dữ liệu tập trung, giúp khách sạn lưu trữ, cập nhật và truy vấn thông tin ngày càng hiệu quả hơn. Thông tin cần được quản lý có tính chính xác và nhất quán để phục vụ cho nhiều chức năng khác nhau như tra cứu phòng, lập hóa đơn, tính doanh thu và kiểm tra dữ liệu lịch sử.

Một hệ thống CSDL tốt không chỉ giúp lưu giữ dữ liệu mà còn đảm bảo:
- không có dữ liệu trùng lặp không cần thiết;
- các mối quan hệ giữa bảng được xác định rõ ràng;
- dữ liệu là nhất quán và dễ quản lý;
- các hành vi không hợp lệ bị chặn bởi ràng buộc toàn vẹn.

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
   - Khách hàng mới được nhập thông tin đầy đủ.
   - Hệ thống lưu thông tin liên hệ để dễ liên lạc sau này.
2. Nghiệp vụ đặt phòng
   - Khách hàng đặt phòng theo ngày và số lượng người.
   - Hệ thống quản lý trạng thái đặt phòng.
3. Nghiệp vụ nhận phòng
   - Lễ tân cập nhật trạng thái phòng từ Available sang Occupied.
4. Nghiệp vụ trả phòng
   - Khi khách trả phòng, lập hóa đơn và tính tiền theo trạng thái phòng và số đêm.
5. Nghiệp vụ dịch vụ đi kèm
   - Khách có thể sử dụng thêm dịch vụ trong thời gian lưu trú.
6. Nghiệp vụ báo cáo và thống kê
   - Báo cáo doanh thu, tìm phòng trống, tìm dịch vụ bán chạy, thống kê khách hàng.

## 2.4 Các quy tắc nghiệp vụ

Các quy tắc nghiệp vụ là nền tảng để thiết kế model dữ liệu. Các quy tắc này làm cơ sở cho các ràng buộc nghiệp vụ và ràng buộc toàn vẹn dữ liệu.

- Một khách hàng có thể đặt nhiều đơn phòng trong các thời điểm khác nhau.
- Một đơn đặt phòng có thể có nhiều phòng.
- Mỗi phòng chỉ thuộc duy nhất một loại phòng.
- Một phòng không thể được đặt trùng thời gian cho nhiều khách khác nhau.
- Mỗi hóa đơn chỉ thuộc về một đặt phòng.
- Một hóa đơn có thể chứa nhiều dịch vụ sử dụng.
- Dịch vụ và phòng đều phải có giá trị không âm.
- Trạng thái phòng và đặt phòng phải nằm trong danh sách được định nghĩa trước.

## 2.5 Xác định các thực thể và thuộc tính

### 2.5.1 Bảng KhachHang
- MaKH: mã khách hàng, khóa chính
- TenKH: tên khách hàng
- NgaySinh: ngày sinh
- GioiTinh: giới tính
- SDT: số điện thoại
- Email: email
- DiaChi: địa chỉ

### 2.5.2 Bảng LoaiPhong
- MaLoai: mã loại phòng, khóa chính
- TenLoai: tên loại phòng
- GiaTheoDem: giá theo đêm
- SucChua: số người tối đa
- MoTa: mô tả

### 2.5.3 Bảng Phong
- MaPhong: mã phòng, khóa chính
- SoPhong: số phòng
- MaLoai: khóa ngoại tham chiếu LoaiPhong
- Tang: tầng
- TrangThai: trạng thái phòng

### 2.5.4 Bảng DatPhong
- MaDat: mã đặt phòng, khóa chính
- MaKH: khóa ngoại tham chiếu KhachHang
- NgayDat: ngày đặt phòng
- NgayDen: ngày nhận phòng
- NgayDi: ngày trả phòng
- TrangThai: trạng thái đặt phòng
- SoNguoi: số người
- GhiChu: ghi chú

### 2.5.5 Bảng ChiTietDatPhong
- MaDat: khóa ngoại tham chiếu DatPhong
- MaPhong: khóa ngoại tham chiếu Phong
- GiaTheoDem: giá phòng theo đêm
- SoDem: số đêm thuê
- Khóa chính: (MaDat, MaPhong)

### 2.5.6 Bảng NhanVien
- MaNV: khóa chính
- TenNV: tên nhân viên
- ChucVu: chức vụ
- SDT: số điện thoại
- Luong: lương

### 2.5.7 Bảng HoaDon
- MaHD: khóa chính
- MaDat: khóa ngoại tham chiếu DatPhong
- MaNV: khóa ngoại tham chiếu NhanVien
- NgayLap: ngày lập hóa đơn
- TriGia: tổng tiền
- DaThanhToan: trạng thái thanh toán

### 2.5.8 Bảng DichVu
- MaDV: khóa chính
- TenDV: tên dịch vụ
- DonGia: đơn giá

### 2.5.9 Bảng SuDungDV
- MaSD: khóa chính
- MaHD: khóa ngoại tham chiếu HoaDon
- MaDV: khóa ngoại tham chiếu DichVu
- SoLuong: số lượng dịch vụ
- DonGia: đơn giá dịch vụ
- ThanhTien: thành tiền
a

## 2.6 Xác định mối liên kết giữa các thực thể

### 2.6.1 Quan hệ KhachHang – DatPhong
- Một khách hàng có thể có nhiều đơn đặt phòng.
- Một đặt phòng chỉ thuộc về một khách hàng.
- Đây là quan hệ 1–N.

### 2.6.2 Quan hệ DatPhong – Phong (qua ChiTietDatPhong)
- Một đơn đặt phòng có thể bao gồm nhiều phòng.
- Một phòng có thể xuất hiện trong nhiều đơn đặt phòng khác nhau theo thời gian.
- Đây là quan hệ M–N, được giải quyết bằng bảng trung gian ChiTietDatPhong.

### 2.6.3 Quan hệ LoaiPhong – Phong
- Một loại phòng có nhiều phòng.
- Mỗi phòng chỉ thuộc một loại phòng.
- Đây là quan hệ N–1 hoặc 1–N tùy cách nhìn.

### 2.6.4 Quan hệ DatPhong – HoaDon
- Một đặt phòng có thể dẫn đến một hóa đơn khi khách trả phòng.
- Một hóa đơn chỉ tương ứng với một đặt phòng.
- Đây là quan hệ 1–1 theo nghiệp vụ.

### 2.6.5 Quan hệ HoaDon – SuDungDV
- Một hóa đơn có thể có nhiều dòng dịch vụ sử dụng.
- Mỗi dịch vụ sử dụng thuộc về một hóa đơn.
- Đây là quan hệ 1–N.

### 2.6.6 Quan hệ HoaDon – NhanVien
- Một nhân viên có thể lập nhiều hóa đơn.
- Một hóa đơn do một nhân viên lập.
- Đây là quan hệ N–1.

## 2.7 Mô hình ER

Mô hình ER của hệ thống khách sạn có thể được mô tả như sau:
- KhachHang có quan hệ 1–N với DatPhong.
- DatPhong nối với Phong qua ChiTietDatPhong, tạo ra quan hệ M–N.
- Phong thuộc về LoaiPhong.
- DatPhong sinh ra HoaDon.
- HoaDon chứa nhiều SuDungDV.
- SuDungDV gắn với DichVu.
- NhanVien lập nhiều HoaDon.

Như vậy, hệ thống có tổng cộng 9 thực thể chính và nhiều mối quan hệ tương ứng. Số thực thể này thỏa yêu cầu tối thiểu “ít nhất 8 thực thể” theo đề bài.

Sơ đồ ER có thể vẽ bằng Draw.io hoặc bảng Mermaid, được lưu trong file `erd.md`. Trong mô hình này, mọi thực thể đều có khóa chính rõ ràng và mối quan hệ giữa các thực thể đều phản ánh đúng nghiệp vụ quản lý khách sạn thực tế.

## 2.8 Chuyển ER sang mô hình quan hệ

Sau khi xác định thực thể và mối quan hệ, ta chuyển sang mô hình quan hệ như sau:

- KhachHang(MaKH, TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi)
- LoaiPhong(MaLoai, TenLoai, GiaTheoDem, SucChua, MoTa)
- Phong(MaPhong, SoPhong, MaLoai, Tang, TrangThai)
- DatPhong(MaDat, MaKH, NgayDat, NgayDen, NgayDi, TrangThai, SoNguoi, GhiChu)
- ChiTietDatPhong(MaDat, MaPhong, GiaTheoDem, SoDem)
- NhanVien(MaNV, TenNV, ChucVu, SDT, Luong)
- HoaDon(MaHD, MaDat, MaNV, NgayLap, TriGia, DaThanhToan)
- DichVu(MaDV, TenDV, DonGia)
- SuDungDV(MaSD, MaHD, MaDV, SoLuong, DonGia, ThanhTien)

### 2.8.1 Khóa chính và khóa ngoại

- KhachHang: MaKH là khóa chính.
- LoaiPhong: MaLoai là khóa chính.
- Phong: MaPhong là khóa chính; MaLoai là khóa ngoại.
- DatPhong: MaDat là khóa chính; MaKH là khóa ngoại.
- ChiTietDatPhong: (MaDat, MaPhong) là khóa chính; MaDat và MaPhong là khóa ngoại.
- NhanVien: MaNV là khóa chính.
- HoaDon: MaHD là khóa chính; MaDat và MaNV là khóa ngoại.
- DichVu: MaDV là khóa chính.
- SuDungDV: MaSD là khóa chính; MaHD và MaDV là khóa ngoại.

## 2.9 Phụ thuộc hàm và kiểm tra chuẩn BCNF

### 2.9.1 Phụ thuộc hàm của từng quan hệ

- KhachHang: MaKH -> TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi
- LoaiPhong: MaLoai -> TenLoai, GiaTheoDem, SucChua, MoTa
- Phong: MaPhong -> SoPhong, MaLoai, Tang, TrangThai
- DatPhong: MaDat -> MaKH, NgayDat, NgayDen, NgayDi, TrangThai, SoNguoi, GhiChu
- ChiTietDatPhong: (MaDat, MaPhong) -> GiaTheoDem, SoDem
- NhanVien: MaNV -> TenNV, ChucVu, SDT, Luong
- HoaDon: MaHD -> MaDat, MaNV, NgayLap, TriGia, DaThanhToan
- DichVu: MaDV -> TenDV, DonGia
- SuDungDV: MaSD -> MaHD, MaDV, SoLuong, DonGia, ThanhTien

### 2.9.2 Phân tích BCNF

Một quan hệ đạt chuẩn BCNF nếu với mọi phụ thuộc hàm X -> Y trong quan hệ, X phải là khóa siêu của quan hệ hoặc Y chứa các thuộc tính khóa.

Quan sát các quan hệ trên thấy rằng:
- Tất cả các thuộc tính không khóa đều phụ thuộc hoàn toàn vào khóa chính.
- Không có thuộc tính không khóa phụ thuộc vào một tập con của khóa chính.
- Vì vậy, các bảng trong mô hình đều đạt BCNF ở mức cơ bản.

Nếu có một số thuộc tính không khóa phụ thuộc vào phần tử của khóa tổ hợp, thì cần phân rã thêm. Trong mô hình khách sạn này, các bảng được thiết kế đơn giản và phù hợp, nên không cần phân rã nhiều.

---

# Chương 3. Cài đặt và khai thác CSDL

## 3.1 Tạo cơ sở dữ liệu

Ví dụ lệnh T-SQL để tạo CSDL:

```sql
CREATE DATABASE KhachSanDB;
GO
USE KhachSanDB;
GO
```

## 3.2 Tạo các bảng và ràng buộc

### 3.2.1 KhachHang
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
```

### 3.2.2 LoaiPhong
```sql
CREATE TABLE LoaiPhong (
  MaLoai VARCHAR(10) PRIMARY KEY,
  TenLoai NVARCHAR(50) NOT NULL,
  GiaTheoDem DECIMAL(18,2) NOT NULL CHECK (GiaTheoDem >= 0),
  SucChua INT NOT NULL CHECK (SucChua > 0),
  MoTa NVARCHAR(200)
);
```

### 3.2.3 Phong
```sql
CREATE TABLE Phong (
  MaPhong VARCHAR(10) PRIMARY KEY,
  SoPhong NVARCHAR(20) NOT NULL,
  MaLoai VARCHAR(10) NOT NULL,
  Tang INT,
  TrangThai NVARCHAR(20) NOT NULL CHECK (TrangThai IN ('Available','Booked','Occupied','Maintenance')),
  CONSTRAINT FK_Phong_LoaiPhong FOREIGN KEY (MaLoai) REFERENCES LoaiPhong(MaLoai)
);
```

### 3.2.4 DatPhong
```sql
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
```

### 3.2.5 ChiTietDatPhong
```sql
CREATE TABLE ChiTietDatPhong (
  MaDat VARCHAR(12) NOT NULL,
  MaPhong VARCHAR(10) NOT NULL,
  GiaTheoDem DECIMAL(18,2) NOT NULL,
  SoDem INT NOT NULL CHECK (SoDem > 0),
  PRIMARY KEY (MaDat, MaPhong),
  CONSTRAINT FK_CTD_DatPhong FOREIGN KEY (MaDat) REFERENCES DatPhong(MaDat),
  CONSTRAINT FK_CTD_Phong FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong)
);
```

### 3.2.6 NhanVien
```sql
CREATE TABLE NhanVien (
  MaNV VARCHAR(10) PRIMARY KEY,
  TenNV NVARCHAR(100) NOT NULL,
  ChucVu NVARCHAR(50),
  SDT VARCHAR(20),
  Luong DECIMAL(18,2) CHECK (Luong >= 0)
);
```

### 3.2.7 HoaDon
```sql
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
```

### 3.2.8 DichVu
```sql
CREATE TABLE DichVu (
  MaDV VARCHAR(10) PRIMARY KEY,
  TenDV NVARCHAR(100) NOT NULL,
  DonGia DECIMAL(18,2) NOT NULL CHECK (DonGia >= 0)
);
```

### 3.2.9 SuDungDV
```sql
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

## 3.3 Nhập dữ liệu mẫu

Để kiểm thử hệ thống, mỗi bảng cần tối thiểu 20 bản ghi. Trong repo, nhóm em đã sinh dữ liệu mẫu số lượng như sau:
- LoaiPhong: 25
- Phong: 60
- KhachHang: 50
- NhanVien: 25
- DichVu: 30
- DatPhong: 40
- ChiTietDatPhong: > 40
- HoaDon: >= 40
- SuDungDV: nhiều bản ghi

Việc sinh dữ liệu này nhằm mục đích:
- Kiểm tra các truy vấn có trả về nhiều kết quả;
- Có dữ liệu ở mức bình thường và mức biên;
- Có dữ liệu trùng và có dữ liệu bất thường để rèn kỹ năng xử lý dữ liệu.

### 3.3.1 Ví dụ INSERT dữ liệu
```sql
INSERT INTO KhachHang(MaKH, TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi)
VALUES ('KH001', N'Nguyễn Văn A', '1998-05-12', 'M', '0901234567', 'a@gmail.com', N'Hà Nội');
```

### 3.3.2 Ví dụ INSERT loại phòng
```sql
INSERT INTO LoaiPhong(MaLoai, TenLoai, GiaTheoDem, SucChua, MoTa)
VALUES ('L01', N'Phòng tiêu chuẩn', 500000, 2, N'Phòng có giường đơn');
```

### 3.3.3 Ví dụ INSERT phòng
```sql
INSERT INTO Phong(MaPhong, SoPhong, MaLoai, Tang, TrangThai)
VALUES ('P001', '101', 'L01', 1, 'Available');
```

### 3.3.4 Ví dụ INSERT hóa đơn
```sql
INSERT INTO HoaDon(MaHD, MaDat, MaNV, NgayLap, TriGia, DaThanhToan)
VALUES ('HD001', 'DP001', 'NV01', GETDATE(), 1200000, 1);
```

## 3.4 Thao tác DML minh họa và ràng buộc toàn vẹn

### 3.4.1 UPDATE
```sql
UPDATE Phong
SET TrangThai = 'Occupied'
WHERE MaPhong = 'P001';
```

### 3.4.2 DELETE
```sql
DELETE FROM DichVu WHERE MaDV = 'DV01';
```

### 3.4.3 Thêm khóa chính trùng
```sql
INSERT INTO KhachHang(MaKH, TenKH) VALUES ('KH001', N'Test');
```
Lệnh sẽ lỗi vì MaKH đã tồn tại.

### 3.4.4 Thêm khóa ngoại không tồn tại
```sql
INSERT INTO DatPhong(MaDat, MaKH, NgayDen, NgayDi, TrangThai)
VALUES ('DP999', 'KH999', '2026-11-01', '2026-11-03', 'Booked');
```
Lệnh sẽ lỗi vì KH999 không tồn tại trong KhachHang.

### 3.4.5 Vi phạm CHECK
```sql
INSERT INTO LoaiPhong(MaLoai, TenLoai, GiaTheoDem, SucChua)
VALUES ('L99', N'Test', -100, 0);
```
Lệnh sẽ lỗi vì giá tiền và sức chứa không hợp lệ.

## 3.5 Truy vấn SQL minh họa

Nhóm em đã tách riêng 15 câu truy vấn SQL trong file `queries.sql` theo yêu cầu, nên phần báo cáo chính chỉ nêu ý nghĩa chủ yếu và hướng sử dụng. Dưới đây là phân loại truy vấn và ví dụ mô tả ngắn gọn:

### 3.5.1 Truy vấn cơ bản
- Hiển thị tất cả dữ liệu khách hàng.
- Hiển thị phòng trống theo tầng.
- Liệt kê loại phòng có giá cao hơn X.
- Tìm đặt phòng của một khách hàng.

### 3.5.2 Truy vấn nhiều bảng
- Liệt kê chi tiết đặt phòng kèm thông tin loại phòng.
- Tổng hợp hóa đơn với nhân viên lập hóa đơn.
- Tìm thông tin dịch vụ của mỗi hóa đơn.

### 3.5.3 Gom nhóm và thống kê
- Tổng doanh thu theo từng tháng.
- Tìm 5 phòng được đặt nhiều nhất.
- Xếp hạng khách hàng theo tổng chi tiêu.
- Doanh thu dịch vụ theo từng loại dịch vụ.

### 3.5.4 Truy vấn lồng nhau
- Tìm khách hàng có chi tiêu lớn hơn trung bình toàn hệ thống.
- Tìm phòng chưa từng được đặt.
- Phát hiện đặt phòng chồng lịch (double booking).

Vì phần 15 câu truy vấn SQL được tách riêng trong file `queries.sql`, nên phần báo cáo này không nhắc lại toàn bộ câu lệnh mà tập trung vào ý nghĩa nghiệp vụ và mục đích kiểm thử.

---

# Kết luận

Nhóm em đã hoàn thành quá trình phân tích, thiết kế và cài đặt cơ sở dữ liệu cho hệ thống quản lý khách sạn. Trong suốt quá trình làm đồ án, nhóm em đã áp dụng những nội dung quan trọng của môn Cơ sở dữ liệu như xác định thực thể, thuộc tính, mối quan hệ, chuyển mô hình ER sang mô hình quan hệ, chuẩn hóa, và cài đặt trên SQL Server.

Đề tài Quản lý khách sạn là một ví dụ lý tưởng cho việc thiết kế CSDL bởi vì nó bao gồm nhiều lớp dữ liệu và nhiều quan hệ phức tạp nhưng vẫn rất gần với thực tế. Từ đó, nhóm em hiểu rõ hơn rằng thiết kế dữ liệu không chỉ là viết bảng và câu lệnh SQL, mà còn là phải suy nghĩ về nghiệp vụ, ràng buộc dữ liệu, tính nhất quán và khả năng khai thác thông tin cho các báo cáo sau này.

Nếu tiếp tục phát triển, hệ thống có thể được nâng cấp theo nhiều hướng:
- thêm phần thanh toán trực tuyến;
- thêm bảng khuyến mãi và voucher;
- thêm chức năng báo cáo tự động bằng BI;
- thêm giao diện web hoặc ứng dụng di động;
- thêm phân quyền người dùng và lịch sử log hoạt động.

Nhờ đó, hệ thống sẽ gần gũi với các ứng dụng quản lý khách sạn thực tế hơn, không những phục vụ cho bài tập mà còn có thể ứng dụng vào doanh nghiệp nhỏ và vừa.

---

# Tài liệu tham khảo
- Giáo trình môn Cơ sở dữ liệu.
- Slides bài giảng của giảng viên.
- Microsoft SQL Server Documentation.
- Tài liệu về ERD, chuẩn hóa dữ liệu và phụ thuộc hàm.

---

# Phụ lục

1. File báo cáo chính: `report.md`
2. File truy vấn SQL riêng: `queries.sql`
3. File sơ đồ ERD: `erd.md`

---

Kết thúc báo cáo theo dạng sinh viên năm 2.
