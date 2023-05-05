# SmartHome - Project Mẫu thiết kế phần mềm

Thành viên nhóm 8:

- 20110599 - Hà Nhật Vềnh
- 20110053 - Tô Duy Vượng
- 20110129 - Đinh Tấn Phúc Huy
- 20110459 - Đỗ Trung Đức
<hr>

## Công nghệ, thư viện sử dụng:

- Framework SpringBoot
- HTML, CSS, JSP
- MySQL
- Mẫu thiết kế: Factory Pattern + Strategy pattern
<hr>

# RUN APP
## B1: Sao chép dự án từ Github
git clone https://github.com/ToDuyVuong/SmartHome.git

## B2: Cấu hình database

- Tạo database tên "smarthome_mtkpm" trong MYSQL Server và cấu hình properties file.

- Dùng file smarthome_mtkpm.sql để backup dữ liệu

## B3: Chạy lệnh khởi động || hoặc chạy bằng IDE

- ./mvnw spring-boot:run

# Đường dẫn mặc định
 - Trang chủ: http://localhost:8080
 - Trang login admin và customer: http://localhost:8080/login
   + Tài khoản admin: TK: admin; MK: admin
 - Trang sản phẩm: http://localhost:8080/product