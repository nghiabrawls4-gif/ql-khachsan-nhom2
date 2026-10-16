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

Nhóm em thực hiện đồ án “Hệ thống quản lý khách sạn” nhằm áp dụng các kiến thức đã học trong môn Cơ sở dữ liệu: phân tích nghiệp vụ, mô hình hóa ER, chuẩn hóa, thiết kế quan hệ, viết DDL/DML và khai thác bằng SQL Server. Báo cáo đã được cập nhật để sửa những điểm yếu theo phản hồi (xem phần "Các chỉnh sửa theo nhận xét" ở cuối).

---

# Mục lục
1. Chương 1: Giới thiệu bài toán
2. Chương 2: Phân tích và thiết kế cơ sở dữ liệu
   2.1 Mục đích hệ thống
   2.2 Đối tượng quản lý (thực thể & thuộc tính, gồm thuộc tính phức hợp/đa trị)
   2.3 Các nghiệp vụ chính
   2.4 Các quy tắc nghiệp vụ (mở rộng và chi tiết)
   2.5 Xác định thực thể và thuộc tính (bổ sung chú ý)
   2.6 Mối liên kết giữa các thực thể (đầy đủ ≥7 và giải thích tính chất)
   2.7 Mô hình ER và quá trình tinh chỉnh (ER mở rộng → ER rút gọn)
   2.8 Chuyển ER → quan hệ (giải thích quy tắc chuyển đổi)
   2.9 Phụ thuộc hàm, khóa ứng viên và kiểm tra BCNF (chi tiết theo quan hệ)
3. Chương 3: Cài đặt và khai thác CSDL
   3.1 Tạo cơ sở dữ liệu
   3.2 Tạo các bảng và ràng buộc (DDL đã chỉnh sửa)
   3.3 Nhập dữ liệu mẫu (mô tả + script cơ bản đính kèm)
   3.4 Thao tác DML minh họa ràng buộc
   3.5 Truy vấn SQL minh họa (file riêng)
4. Kết luận
5. Tài liệu tham khảo
6. Phụ lục: thay đổi theo phản hồi

---

# Chương 1. Giới thiệu bài toán

## 1.1 Bối cảnh, mục đích, đối tượng và tóm tắt nghiệp vụ

Khách sạn cung cấp dịch vụ lưu trú và các dịch vụ phụ trợ. Mục đích hệ thống là quản lý thông tin khách, phòng, đặt phòng, hóa đơn, dịch vụ và nhân viên để đảm bảo toàn vẹn dữ liệu, tránh trùng đặt, và hỗ trợ báo cáo.

Đối tượng quản lý: Khách hàng, Loại phòng, Phòng, Đặt phòng, Chi tiết đặt phòng, Hóa đơn, Dịch vụ, Sử dụng dịch vụ, Nhân viên.

Nghiệp vụ chính (tóm tắt): đăng ký khách, đặt phòng, gán phòng, nhận/ trả phòng, ghi nhận dịch vụ khi ở, lập hóa đơn khi trả phòng, thống kê doanh thu.

(Phần mở rộng: không lặp lại chi tiết đã chuyển sang Chương 2 — ở đây chỉ tóm tắt mục đích và phạm vi.)

---

# Chương 2. Phân tích và thiết kế CSDL

## 2.1 Mục đích hệ thống

Hệ thống lưu trữ tập trung thông tin khách hàng, phòng, đặt phòng, dịch vụ và hóa đơn; đảm bảo ràng buộc toàn vẹn, tránh chồng lịch đặt phòng, hỗ trợ sinh báo cáo doanh thu theo nhiều chiều.

## 2.2 Thực thể, thuộc tính (bổ sung: thuộc tính phức hợp / đa trị)

Ghi chú bổ sung:
- DiaChi (KhachHang) có thể là thuộc tính phức hợp (Số nhà, Đường, Quận/Huyện, Tỉnh/Thành). Ở mức cài đặt đơn giản chúng tôi giữ DiaChi là 1 chuỗi, nhưng trong phân tích cần nêu đây là thuộc tính phức hợp.
- SDT có thể đa trị (khách có nhiều số điện thoại). Thiết kế hiện tại lưu 1 SDT; nếu yêu cầu thực, có thể tách KhachHang_SDT(MaKH, SDT) để lưu nhiều số.

Danh sách thực thể và thuộc tính chính (giữ tương tự báo cáo trước) — xem mục 2.5.

## 2.3 Các nghiệp vụ chính

(Đã mô tả ở Chương 1; không lặp lại toàn bộ — chuyển các bước chi tiết vào phụ lục nếu cần.)

## 2.4 Các quy tắc nghiệp vụ (mở rộng và chi tiết)

Bổ sung các quy tắc quan trọng, vì giáo viên nhấn mạnh phần này:

1) Mỗi đơn đặt phòng (DatPhong) có thể gồm nhiều phòng nhưng 1 phòng trong cùng khoảng thời gian chỉ được gán cho một đơn (Không cho phép double-booking).
2) Một đơn đặt phòng chỉ được tạo hóa đơn một lần (1–1 DatPhong–HoaDon). HoaDon được lập khi khách trả phòng (CheckedOut) hoặc theo chính sách khách sạn.
3) Mỗi hóa đơn phải có nhân viên lập (HoaDon.MaNV NOT NULL).
4) Số người trong đặt phòng (SoNguoi) không vượt quá SucChua của loại phòng của các phòng được gán (kiểm tra tổng công suất nếu cần).
5) Giá phòng áp dụng theo thời điểm đặt (giá có thể thay đổi theo mùa) — do đó lưu GiaTheoDem vào ChiTietDatPhong tại thời điểm đặt để giữ lịch sử giá.
6) Dịch vụ phát sinh trong thời gian lưu trú — nên gắn dịch vụ với DatPhong (hoặc lượt lưu trú), không trực tiếp vào HoaDon; HoaDon tổng hợp các dịch vụ khi lập.
7) Không cho phép xóa DichVu nếu đã được tham chiếu trong SuDungDV (khóa ngoại, ON DELETE RESTRICT) — cần giải thích hậu quả và chính sách xóa/bỏ (soft delete).
8) NgayDi phải lớn hơn NgayDen (CHECK), SoNguoi > 0 (CHECK), SoPhong phải là duy nhất (UNIQUE).

## 2.5 Xác định thực thể và thuộc tính (đã nêu) — lưu ý về các thuộc tính phức hợp/đa trị

(Đã nêu danh sách; bổ sung ghi chú về DiaChi, SDT như phần 2.2.)

## 2.6 Xác định mối liên kết (đầy đủ và giải thích)

Danh sách liên kết (bổ sung và giải thích cardinality):
- KhachHang 1 — N DatPhong (một khách có nhiều đặt phòng).
- DatPhong 1 — N ChiTietDatPhong (một đặt có nhiều phòng) và ChiTietDatPhong N — 1 Phong.
- Phong N — 1 LoaiPhong (một loại có nhiều phòng).
- DatPhong 1 — 1 HoaDon (một đặt có một hóa đơn khi trả phòng).
- HoaDon N — 1 NhanVien (một nhân viên có thể lập nhiều hóa đơn); HoaDon.MaNV NOT NULL.
- DatPhong 1 — N SuDungDV (dịch vụ sinh trong khi lưu trú) — đề xuất: SuDungDV liên kết với MaDat thay vì MaHD.
- SuDungDV N — 1 DichVu (mỗi sử dụng dịch vụ tham chiếu loại dịch vụ).

Giải thích chọn 1–1 hoặc 1–N:
- DatPhong → HoaDon là 1–1 vì hoa đơn phản ánh một kỳ lưu trú duy nhất; nếu cần lưu nhiều hóa đơn cho một đặt (tạm tính, cọc...), mô hình có thể mở rộng nhưng hiện yêu cầu là 1 hóa đơn cuối cùng.
- DatPhong → SuDungDV là 1–N bởi dịch vụ phát sinh nhiều lần trong đặt.

Số liên kết bây giờ ≥7 và bao phủ mối quan hệ dịch vụ.

## 2.7 Mô hình ER và quá trình tinh chỉnh

Quá trình thực hiện:
1) Vẽ ER mở rộng (thể hiện thuộc tính phức hợp, thuộc tính đa trị, các mối quan hệ M–N, số lượng các liên kết).
2) Xác định các mối quan hệ M–N (DatPhong–Phong) và chuyển thành bảng quan hệ trung gian ChiTietDatPhong.
3) Xem xét ràng buộc thời gian và dữ liệu dẫn xuất (TriGia, ThanhTien) để quyết định lưu hay tính toán. Kết luận: ThanhTien để là computed column trong SuDungDV; TriGia có thể cập nhật khi lập hóa đơn (không lưu như cột tính toán để tránh bất đồng nếu cần audit — hoặc lưu và ghi nhận bằng trigger/stored-proc).

(ER được lưu trong erd.md; trong báo cáo chính đã bổ sung giải thích bước tinh chỉnh ER→ER rút gọn.)

## 2.8 Chuyển mô hình ER sang mô hình quan hệ — quy tắc và ví dụ

Quy tắc chính:
- Thuộc tính đơn → cột trong quan hệ.
- Thuộc tính phức hợp → tách cột con hoặc bảng phụ nếu cần.
- Quan hệ 1–N: FK ở phía N.
- Quan hệ M–N: tạo bảng trung gian có PK là (PK1, PK2).
- Quan hệ 1–1: có thể đặt FK ở một phía theo tính chất nghiệp vụ hoặc gộp 2 thực thể nếu luôn tồn tại đồng thời.

Ví dụ: DatPhong–Phong (M–N) → ChiTietDatPhong(MaDat, MaPhong, GiaTheoDem, SoDem).

## 2.9 Phụ thuộc hàm, khóa ứng viên, thuộc tính dẫn xuất và kiểm tra BCNF

### 2.9.1 Khóa ứng viên và FD mở rộng
- KhachHang: MaKH -> (TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi). Khóa ứng viên có thể là Email nếu đảm bảo duy nhất.
- LoaiPhong: MaLoai -> (TenLoai, GiaTheoDem, SucChua, MoTa).
- Phong: MaPhong -> (SoPhong, MaLoai, Tang, TrangThai). SoPhong có thể là khóa ứng viên nếu đảm bảo duy nhất; đã thêm UNIQUE(SoPhong).
- DatPhong: MaDat -> (MaKH, NgayDat, NgayDen, NgayDi, TrangThai, SoNguoi, GhiChu).
- ChiTietDatPhong: (MaDat, MaPhong) -> (GiaTheoDem, SoDem).
- NhanVien: MaNV -> (TenNV, ChucVu, SDT, Luong).
- HoaDon: MaHD -> (MaDat, MaNV, NgayLap, TriGia, DaThanhToan). Ngoài ra DatPhong.MaDat có thể là khóa thay thế nếu mapping 1–1.
- DichVu: MaDV -> (TenDV, DonGia).
- SuDungDV: MaSD -> (MaDat, MaDV, SoLuong, DonGia, ThanhTien) — lưu ý SuDungDV tham chiếu MaDat.

Chú ý: TriGia và ThanhTien là thuộc tính dẫn xuất: ThanhTien = SoLuong * DonGia (được khai báo là computed column); TriGia = SUM(phòng) + SUM(dịch vụ) — nên nên cập nhật khi lập hóa đơn hoặc tính toán on-demand.

### 2.9.2 Kiểm tra BCNF (theo quan hệ, ngắn gọn)
- KhachHang: khóa MaKH; không có FD phụ thuộc phần; đạt BCNF.
- LoaiPhong: MaLoai là khóa; đạt BCNF.
- Phong: MaPhong khóa; nếu SoPhong -> MaPhong (unique), không có FD phá BCNF; đạt BCNF.
- DatPhong: MaDat là khóa; mọi thuộc tính phụ thuộc vào MaDat; đạt BCNF theo mô tả hiện tại.
- ChiTietDatPhong: khóa (MaDat, MaPhong); thuộc tính phụ thuộc hoàn toàn; đạt BCNF.
- NhanVien: MaNV khóa; đạt BCNF.
- HoaDon: MaHD khóa; TriGia là thuộc tính dẫn xuất (không gây phụ thuộc hàm trái chuẩn). Nếu có FD MaDat -> MaHD (1–1), cần lưu ý MaDat là khóa ứng viên; cấu trúc vẫn có thể đạt BCNF nếu không có phụ thuộc hàm trái quy tắc.
- DichVu: đạt BCNF.
- SuDungDV: MaSD là khóa; ThanhTien là computed column; đạt BCNF.

Ghi chú: phần kiểm tra BCNF đã được làm chi tiết hơn — nếu giáo viên yêu cầu chứng minh từng phụ thuộc, có thể mở rộng thành bảng phụ thuộc rõ ràng.

---

# Chương 3. Cài đặt và khai thác CSDL

## 3.1 Tạo database

```sql
CREATE DATABASE KhachSanDB;
GO
USE KhachSanDB;
GO
```

## 3.2 Tạo bảng và ràng buộc (sửa một số điểm theo nhận xét)

Điểm sửa chính:
- SuDungDV tham chiếu MaDat (DatPhong) thay vì MaHD để phản ánh dịch vụ phát sinh trong lúc lưu trú. Khi lập hóa đơn, HoaDon sẽ tổng hợp dịch vụ theo MaDat.
- HoaDon.MaNV đặt NOT NULL (mỗi hóa đơn phải có nhân viên lập); nếu cần cho phép NULL vì lý do nghiệp vụ thì phải giải thích (ví dụ: hệ thống tự động lập hóa đơn) — ở đây đặt NOT NULL theo yêu cầu.
- Thêm CHECK (NgayDi > NgayDen), CHECK (SoNguoi > 0) và UNIQUE (SoPhong).
- Đặt ON DELETE RESTRICT cho các FK quan trọng (ví dụ SuDungDV.MaDV -> DichVu) để tránh xóa dịch vụ đang được sử dụng.
- TriGia: lưu hay tính toán? Chúng tôi giữ TriGia là cột cập nhật bởi trigger/stored-proc khi lập hóa đơn (không dùng cột computed) để tiện audit; ThanhTien là computed column trong SuDungDV.

DDL chính (chỉ nêu phần sửa/quan trọng):

```sql
-- Phong: thêm UNIQUE cho SoPhong
CREATE TABLE Phong (
  MaPhong VARCHAR(10) PRIMARY KEY,
  SoPhong NVARCHAR(20) NOT NULL UNIQUE,
  MaLoai VARCHAR(10) NOT NULL,
  Tang INT NULL,
  TrangThai NVARCHAR(20) NOT NULL CHECK (TrangThai IN ('Available','Booked','Occupied','Maintenance')),
  CONSTRAINT FK_Phong_LoaiPhong FOREIGN KEY (MaLoai) REFERENCES LoaiPhong(MaLoai)
);

-- DatPhong: thêm CHECK NgayDen < NgayDi, SoNguoi > 0
CREATE TABLE DatPhong (
  MaDat VARCHAR(12) PRIMARY KEY,
  MaKH VARCHAR(10) NOT NULL,
  NgayDat DATETIME NOT NULL DEFAULT GETDATE(),
  NgayDen DATE NOT NULL,
  NgayDi DATE NOT NULL,
  TrangThai NVARCHAR(20) NOT NULL CHECK (TrangThai IN ('Booked','CheckedIn','CheckedOut','Cancelled')),
  SoNguoi INT NOT NULL CHECK (SoNguoi > 0),
  GhiChu NVARCHAR(200) NULL,
  CONSTRAINT FK_DatPhong_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
  CONSTRAINT CK_DatPhong_NgayDenDi CHECK (NgayDen < NgayDi)
);

-- SuDungDV: tham chiếu MaDat (dịch vụ phát sinh trong đặt) và MaDV
CREATE TABLE SuDungDV (
  MaSD VARCHAR(12) PRIMARY KEY,
  MaDat VARCHAR(12) NOT NULL,
  MaDV VARCHAR(10) NOT NULL,
  SoLuong INT NOT NULL CHECK (SoLuong > 0),
  DonGia DECIMAL(18,2) NOT NULL CHECK (DonGia >= 0),
  ThanhTien AS (SoLuong * DonGia) PERSISTED,
  CONSTRAINT FK_SD_DatPhong FOREIGN KEY (MaDat) REFERENCES DatPhong(MaDat) ON DELETE CASCADE,
  CONSTRAINT FK_SD_DichVu FOREIGN KEY (MaDV) REFERENCES DichVu(MaDV) ON DELETE RESTRICT
);

-- HoaDon: MaNV NOT NULL
CREATE TABLE HoaDon (
  MaHD VARCHAR(12) PRIMARY KEY,
  MaDat VARCHAR(12) NOT NULL UNIQUE,
  MaNV VARCHAR(10) NOT NULL,
  NgayLap DATETIME NOT NULL DEFAULT GETDATE(),
  TriGia DECIMAL(18,2) NOT NULL CHECK (TriGia >= 0),
  DaThanhToan BIT DEFAULT 0,
  CONSTRAINT FK_HoaDon_DatPhong FOREIGN KEY (MaDat) REFERENCES DatPhong(MaDat),
  CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);
```

Ghi chú:
- Chúng tôi để MaDat là UNIQUE trong HoaDon (vì 1 DatPhong chỉ có 1 HoaDon) — điều này làm MaDat là khóa ứng viên của HoaDon.
- Quyết định thiết kế SuDungDV liên kết MaDat giúp lưu tất cả dịch vụ xảy ra trong kỳ đặt; khi hóa đơn được tạo, hệ thống lấy các SuDungDV theo MaDat và cộng vào TriGia.

## 3.3 Nhập dữ liệu mẫu

(Đã bổ sung script sinh dữ liệu cơ bản trong báo cáo trước. Script mới đơn giản, dùng WHILE để tạo ít nhất 20 bản ghi mỗi bảng; có trường hợp biên: zero-night, long-stay, cancelled; có dữ liệu trùng ở một số thuộc tính không khóa và dữ liệu đủ cho truy vấn.)

Mục tiêu: đảm bảo kiểm thử các truy vấn (tìm phòng trống, thống kê, kiểm tra chồng đặt, báo cáo doanh thu). Hướng dẫn chạy script đã có trong báo cáo (mục 3.3). (Bạn đã yêu cầu bỏ qua chi tiết sinh 20 bản ghi — phần này giữ mô tả và script đơn giản nếu cần.)

## 3.4 Thao tác DML minh họa và ràng buộc

- Thêm trigger/stored-proc mẫu để ngăn double-booking đã được cung cấp trong phần tiếp theo. Lưu ý: để đảm bảo an toàn race-condition, nên dùng stored-proc với transaction và SELECT ... WITH (UPDLOCK, HOLDLOCK).
- Ví dụ minh họa UPDATE TriGia sau khi tạo HoaDon (đã cung cấp câu lệnh UPDATE mẫu).

## 3.5 Truy vấn SQL minh họa

File queries.sql vẫn chứa 15 truy vấn minh họa (như yêu cầu nhóm). Vì file này đã bị gỡ công khai, nếu cần mình có thể gửi 15 truy vấn riêng cho giáo viên hoặc chèn trở lại repo theo chỉ định của nhóm.

---

# Chương 4. Các phần đã cải thiện (chi tiết kỹ thuật)

## 4.1 Chi tiết các bước tinh chỉnh ER

1) ER mở rộng: vẽ thực thể có thuộc tính phức hợp (KhachHang.DiaChi -> {SoNha, Duong, Quan, Tinh}) và thuộc tính đa trị (KhachHang.SDT) --> đề xuất tách KhachHang_SDT.
2) Xác định quan hệ M–N: DatPhong — Phong (một đặt có nhiều phòng, một phòng có thể thuộc nhiều đặt theo thời gian khác nhau) -> chuyển thành ChiTietDatPhong.
3) Dịch vụ: dịch vụ phát sinh trong quá trình lưu trú nên liên kết với DatPhong; khi tạo HoaDon, hệ thống tập hợp các SuDungDV theo MaDat để tính TriGia.
4) Kiểm soát thời gian: thêm CHECK NgayDen < NgayDi; để ngăn double-booking cần ràng buộc tạm thời/trigger hoặc kiểm tra ở application/stored-proc.

## 4.2 Bảng phụ thuộc hàm (mở rộng)

Mục đích: liệt kê tất cả FD chính để chuẩn hóa và kiểm BCNF. Dưới đây là bảng tóm tắt (mỗi dòng: Quan hệ — FD chính):
- KhachHang: MaKH -> TenKH, NgaySinh, GioiTinh, SDT, Email, DiaChi
- LoaiPhong: MaLoai -> TenLoai, GiaTheoDem, SucChua, MoTa
- Phong: MaPhong -> SoPhong, MaLoai, Tang, TrangThai ; (SoPhong -> MaPhong) nếu SoPhong unique
- DatPhong: MaDat -> MaKH, NgayDat, NgayDen, NgayDi, TrangThai, SoNguoi, GhiChu
- ChiTietDatPhong: (MaDat, MaPhong) -> GiaTheoDem, SoDem
- NhanVien: MaNV -> TenNV, ChucVu, SDT, Luong
- HoaDon: MaHD -> MaDat, MaNV, NgayLap, TriGia, DaThanhToan ; nếu MaDat unique thì MaDat -> MaHD
- DichVu: MaDV -> TenDV, DonGia
- SuDungDV: MaSD -> MaDat, MaDV, SoLuong, DonGia, ThanhTien

Nếu giáo viên yêu cầu, mình sẽ mở rộng thành một bảng có tất cả FD phụ thuộc (kèm chứng minh vế trái có phải superkey không) cho mỗi quan hệ.

## 4.3 Kiểm tra BCNF — chứng minh ngắn gọn

Chiến lược: xem từng quan hệ, liệt kê FD không tầm thường và kiểm tra vế trái có là superkey không.

Ví dụ (một vài quan hệ):
- KhachHang: duy nhất FD MaKH -> ...; MaKH là khóa -> OK (BCNF)
- ChiTietDatPhong: khóa (MaDat, MaPhong) -> ...; không có FD khác với vế trái không phải superkey -> OK
- HoaDon: MaHD là PK; có FD MaHD -> ...; nếu MaDat -> MaHD tồn tại (vì 1-1) thì vế trái MaDat là superkey (do MaDat UNIQUE trong HoaDon) -> OK

Tất cả quan hệ đã được kiểm tra tương tự; kết luận: mô hình quan hệ hiện tại đạt BCNF theo các FD nêu.

Nếu cần mình sẽ soạn file "BCNF_proof.md" chi tiết từng phụ thuộc với minh chứng (một trang cho mỗi quan hệ).

## 4.4 Ràng buộc bổ sung và ví dụ T-SQL bảo vệ nguyên tắc nghiệp vụ

A) Stored-proc an toàn để đặt phòng (ngăn double-booking) — minh họa (T-SQL):

```sql
CREATE PROCEDURE sp_DatPhong_AnToan
  @MaDat VARCHAR(12),
  @MaKH VARCHAR(10),
  @NgayDen DATE,
  @NgayDi DATE
AS
BEGIN
  SET NOCOUNT ON;
  BEGIN TRAN;
  -- Khóa bảng ChiTietDatPhong/Phong để kiểm tra xung đột
  -- Kiểm tra xem có phòng đã được đặt/occupied trong khoảng giao nhau
  IF EXISTS (
    SELECT 1
    FROM ChiTietDatPhong c
    JOIN DatPhong d ON c.MaDat = d.MaDat
    WHERE NOT (d.NgayDi <= @NgayDen OR d.NgayDen >= @NgayDi) -- giao nhau
  )
  BEGIN
    ROLLBACK TRAN;
    RAISERROR('Có xung đột phòng trong khoảng thời gian này',16,1);
    RETURN;
  END

  -- Tạo DatPhong (ví dụ đơn giản, cần bổ sung gán phòng sau)
  INSERT INTO DatPhong(MaDat, MaKH, NgayDat, NgayDen, NgayDi, TrangThai, SoNguoi)
  VALUES (@MaDat, @MaKH, GETDATE(), @NgayDen, @NgayDi, 'Booked', 1);

  COMMIT TRAN;
END
```

Ghi chú: để tránh race condition trong môi trường nhiều client, khi kiểm tra xung đột nên dùng SELECT ... WITH (UPDLOCK, HOLDLOCK) trên những hàng phòng liên quan hoặc dùng LOCK TABLE tương tự; hoặc thực hiện toàn bộ quá trình trong transaction với isolation level SERIALIZABLE.

B) Trigger/Stored-proc cập nhật TriGia khi lập HoaDon (ví dụ):

```sql
CREATE PROCEDURE sp_TaoHoaDonVaTinhTriGia
  @MaHD VARCHAR(12),
  @MaDat VARCHAR(12),
  @MaNV VARCHAR(10)
AS
BEGIN
  SET NOCOUNT ON;
  BEGIN TRAN;
  INSERT INTO HoaDon(MaHD, MaDat, MaNV, NgayLap, TriGia, DaThanhToan)
  VALUES (@MaHD, @MaDat, @MaNV, GETDATE(), 0, 0);

  DECLARE @sumPhong DECIMAL(18,2) = (
    SELECT ISNULL(SUM(GiaTheoDem * SoDem),0) FROM ChiTietDatPhong WHERE MaDat = @MaDat
  );
  DECLARE @sumDV DECIMAL(18,2) = (
    SELECT ISNULL(SUM(ThanhTien),0) FROM SuDungDV WHERE MaDat = @MaDat
  );

  UPDATE HoaDon SET TriGia = @sumPhong + @sumDV WHERE MaHD = @MaHD;
  COMMIT TRAN;
END
```

C) Ví dụ CHECKs/UNIQUE đã thêm trong DDL (NgayDi > NgayDen, SoNguoi > 0, UNIQUE SoPhong) — đã nêu ở Chương 3.2.

---

# Kết luận

Đã chỉnh sửa báo cáo theo phản hồi: mở rộng quy tắc nghiệp vụ, chỉ rõ thuộc tính phức hợp/đa trị, bổ sung và giải thích thêm các mối liên kết, mô tả bước tinh chỉnh ER→ER rút gọn, nêu rõ khóa ứng viên và phân tích BCNF chi tiết hơn, và sửa một số điểm trong DDL (SuDungDV liên kết MaDat, HoaDon.MaNV NOT NULL, CHECK/UNIQUE bổ sung). Ngoài ra cung cấp stored-proc/trigger mẫu để xử lý double-booking và tính TriGia.

---

# Phụ lục: Các chỉnh sửa theo nhận xét

1) Loại sửa chính:
   - Mở rộng phần quy tắc nghiệp vụ (thêm 8 quy tắc cụ thể).
   - Bổ sung phân tích thuộc tính phức hợp và đa trị.
   - Bổ sung liên kết DatPhong–SuDungDV và giải thích.
   - Thay đổi DDL theo nhận xét (chi tiết ở 3.2).
2) Lý do một số quyết định thiết kế:
   - Gắn dịch vụ với DatPhong để phản ánh dịch vụ phát sinh trong lưu trú; hóa đơn tổng hợp khi trả phòng.
   - Giữ TriGia được cập nhật bởi stored-proc/trigger để thuận tiện audit và performance; ThanhTien là computed column để tránh sai số nhập tay.
3) Các đề xuất cải tiến nếu có thời gian phát triển tiếp:
   - Tách DiaChi thành bảng/thuộc tính phức hợp, tách SDT đa trị.
   - Thêm lịch sử giá cho LoaiPhong (PriceHistory) nếu cần quản lý giá theo mùa.
   - Thêm bảng LuuTru (Stay) để tách khái niệm "lượt lưu trú" với nhiều hóa đơn/ghi chú (nếu nghiệp vụ phức tạp hơn).

---

# Tài liệu tham khảo
- Giáo trình môn Cơ sở dữ liệu
- Microsoft SQL Server Documentation
- Tài liệu về mô hình ER, phụ thuộc hàm và BCNF
- Tài liệu tham khảo về thiết kế hệ thống quản lý khách sạn

---

# Phụ lục files
- ERD: erd.md
- Script mẫu (nhập dữ liệu): sample_data_basic.sql (đã chèn trong báo cáo trước)
- 15 truy vấn kiểm thử: queries.sql (lưu riêng theo yêu cầu nhóm)

Kết thúc báo cáo.
