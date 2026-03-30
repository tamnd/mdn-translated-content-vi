---
title: Chữ ký số
slug: Glossary/Digital_signature
page-type: glossary-definition
sidebar: glossarysidebar
---

**Chữ ký số** (digital signature) là một đối tượng có thể được sử dụng để {{glossary("authentication","xác thực")}} tác giả của một tài liệu hoặc thông điệp.

Chữ ký số thường dựa trên {{glossary("public-key cryptography","mật mã khóa công khai")}}, trong đó một khóa được tạo ra thành một cặp khóa, với đặc tính là nếu một số đầu vào được mã hóa bằng một khóa, nó chỉ có thể được giải mã bằng khóa kia, và ngược lại.

Người tạo ra cặp khóa công khai một khóa và giữ khóa kia là riêng tư. Để ký một tài liệu, chủ sở hữu cặp khóa tạo ra {{glossary("hash function","băm")}} của tài liệu và mã hóa nó bằng khóa riêng tư.

Tài liệu và chữ ký được gửi đến người xác minh, người này băm tài liệu, lấy khóa công khai và giải mã chữ ký: nếu điều này khớp với băm, thì chữ ký đã được xác minh, và người xác minh có thể tin tưởng rằng nó được tạo ra bởi một thực thể có quyền truy cập vào khóa riêng tư.

Tính bảo mật của hệ thống chữ ký số phụ thuộc (trong số những thứ khác) vào:

- Chủ sở hữu khóa riêng tư giữ nó an toàn: nếu các thực thể khác có thể truy cập vào khóa riêng tư, họ có thể mạo danh chủ sở hữu.
- Khóa công khai được người xác minh sử dụng là đối tác thực sự của khóa riêng tư của chủ sở hữu: nếu kẻ tấn công có thể lừa người xác minh tin tưởng khóa công khai sai, họ có thể mạo danh chủ sở hữu.

Người xác minh thường sử dụng {{glossary("digital certificate","chứng chỉ số")}} để kiểm tra xem khóa công khai có thực sự xác thực không.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Digital certificate")}}
  - {{glossary("Hash function")}}
  - {{glossary("Public-key cryptography")}}
