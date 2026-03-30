---
title: Signature (security)
slug: Glossary/Signature/Security
page-type: glossary-definition
sidebar: glossarysidebar
---

Một **chữ ký**, hay _chữ ký số_, là một {{glossary("protocol")}} chứng minh rằng một thông điệp là xác thực.

Từ {{glossary("hash function", "hàm băm")}} của một thông điệp cho trước, **quá trình ký** đầu tiên tạo ra một chữ ký số liên kết với thực thể ký, sử dụng {{glossary("key", "khóa")}} riêng tư của thực thể đó.

Khi nhận được thông điệp, **quá trình xác minh** sẽ:

- _xác thực người gửi -_ sử dụng khóa công khai của người gửi để {{glossary("decryption","giải mã")}} chữ ký và khôi phục lại giá trị băm — giá trị này chỉ có thể được tạo bởi khóa riêng tư của người gửi, và
- _kiểm tra tính toàn vẹn của thông điệp -_ so sánh giá trị băm đó với giá trị băm mới được tính từ tài liệu nhận được (hai giá trị băm sẽ khác nhau nếu tài liệu đã bị giả mạo)

Hệ thống sẽ thất bại nếu khóa riêng tư bị xâm phạm hoặc người nhận bị đánh lừa khi nhận sai khóa công khai.

Chữ ký số dựa trên mật mã học bất đối xứng, còn được gọi là [mật mã hóa khóa công khai](https://en.wikipedia.org/wiki/Public-key_cryptography).

## Xem thêm

- [Chữ ký số](https://en.wikipedia.org/wiki/Digital_signature) trên Wikipedia
- Các thuật ngữ liên quan:
  - {{glossary("Hash function")}}
  - {{glossary("Encryption")}}
