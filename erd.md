# ERD — Quản lý khách sạn

```mermaid
 erDiagram
    KHACHHANG ||--o{ DATPHONG : co
    DATPHONG }o--o{ PHONG : chua
    LOAIPHONG ||--o{ PHONG : co
    DATPHONG ||--|| HOADON : tao
    HOADON ||--o{ SUDUNGDV : ghi_nhan
    DICHVU ||--o{ SUDUNGDV : duoc_su_dung
    NHANVIEN ||--o{ HOADON : lap

    KHACHHANG {
        varchar MaKH PK
        nvarchar TenKH
        date NgaySinh
        char GioiTinh
        varchar SDT
        nvarchar Email
        nvarchar DiaChi
    }

    LOAIPHONG {
        varchar MaLoai PK
        nvarchar TenLoai
        decimal GiaTheoDem
        int SucChua
        nvarchar MoTa
    }

    PHONG {
        varchar MaPhong PK
        nvarchar SoPhong
        varchar MaLoai FK
        int Tang
        nvarchar TrangThai
    }

    DATPHONG {
        varchar MaDat PK
        varchar MaKH FK
        datetime NgayDat
        date NgayDen
        date NgayDi
        nvarchar TrangThai
        int SoNguoi
        nvarchar GhiChu
    }

    HOADON {
        varchar MaHD PK
        varchar MaDat FK
        varchar MaNV FK
        datetime NgayLap
        decimal TriGia
        bit DaThanhToan
    }

    NHANVIEN {
        varchar MaNV PK
        nvarchar TenNV
        nvarchar ChucVu
        varchar SDT
        decimal Luong
    }

    DICHVU {
        varchar MaDV PK
        nvarchar TenDV
        decimal DonGia
    }

    SUDUNGDV {
        varchar MaSD PK
        varchar MaHD FK
        varchar MaDV FK
        int SoLuong
        decimal DonGia
        decimal ThanhTien
    }
```

Mô tả ngắn:
- Khách hàng có nhiều đơn đặt phòng.
- Một đơn đặt phòng chứa nhiều phòng.
- Phòng thuộc một loại phòng.
- Một đơn đặt phòng sinh ra một hóa đơn.
- Hóa đơn có nhiều dịch vụ sử dụng.
- Hóa đơn do một nhân viên lập.
