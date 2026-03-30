---
title: Session hijacking
slug: Glossary/Session_Hijacking
page-type: glossary-definition
sidebar: glossarysidebar
---

**Session hijacking** (chiếm đoạt phiên) xảy ra khi kẻ tấn công tiếp quản một phiên hợp lệ giữa hai máy tính. Kẻ tấn công đánh cắp ID phiên hợp lệ để xâm nhập vào hệ thống và theo dõi dữ liệu.

Hầu hết việc xác thực chỉ xảy ra ở đầu phiên {{glossary("TCP")}}. Trong chiếm đoạt phiên TCP, kẻ tấn công giành quyền truy cập bằng cách tiếp quản một phiên TCP giữa hai máy tính đang diễn ra.

![Kẻ tấn công theo dõi và truy cập ID phiên hợp lệ từ người dùng tương tác với máy chủ web, sau đó sử dụng ID phiên đó để giả mạo phiên giữa người dùng thông thường và máy chủ để khai thác phiên của người dùng và truy cập trực tiếp vào máy chủ.](session_hijacking_3.jpg)

## Session hijacking xảy ra vì

- không có khóa tài khoản cho các ID phiên không hợp lệ
- thuật toán tạo ID phiên yếu
- xử lý không an toàn
- thời gian hết hạn phiên vô thời hạn
- ID phiên ngắn
- truyền dưới dạng văn bản thuần túy

## Quy trình session hijacking

1. **Sniff** - thực hiện tấn công man-in-the-middle (MITM), đặt mình giữa nạn nhân và máy chủ.
2. **Monitor** - theo dõi các gói tin luân chuyển giữa máy chủ và người dùng.
3. **Break** - ngắt kết nối của máy nạn nhân.
4. **Take control** - kiểm soát phiên.
5. **Inject** - chèn các gói tin mới vào máy chủ sử dụng ID phiên của nạn nhân.

## Bảo vệ chống session hijacking

- tạo kênh truyền thông bảo mật với SSH (secure shell)
- truyền cookie xác thực qua kết nối HTTPS
- triển khai chức năng đăng xuất để người dùng có thể kết thúc phiên
- tạo ID phiên sau khi đăng nhập thành công
- truyền dữ liệu được mã hóa giữa người dùng và máy chủ web
- sử dụng chuỗi hoặc số ngẫu nhiên dài làm session key

## Xem thêm

- [Session hijacking](https://en.wikipedia.org/wiki/Session_hijacking) trên Wikipedia
