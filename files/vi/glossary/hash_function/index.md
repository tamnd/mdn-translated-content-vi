---
title: Hàm băm
slug: Glossary/Hash_function
page-type: glossary-definition
sidebar: glossarysidebar
---

**Hàm băm** là hàm nhận đầu vào có độ dài bất kỳ và tạo ra đầu ra có độ dài cố định, còn gọi là _digest_ (hay "hash"). Hàm băm phải nhanh khi tính toán, và các đầu vào khác nhau nên tạo ra đầu ra khác nhau nhiều nhất có thể (tính chất này gọi là _kháng va chạm_ — _collision-resistance_).

Hàm băm được dùng trong cả mục đích {{glossary("cryptography", "mật mã")}} và phi mật mã. Ngoài mật mã, hàm băm có thể được dùng để tạo khóa cho mảng kết hợp như map hay dictionary.

Hàm {{domxref("SubtleCrypto.digest()", "digest()")}} của giao diện {{domxref("SubtleCrypto")}} cung cấp nhiều hàm băm khác nhau cho ứng dụng web.

## Hàm băm mã hóa

Trong mã hóa, hàm băm có nhiều ứng dụng, bao gồm {{Glossary("digital signature", "chữ ký số")}}, và {{Glossary("HMAC", "mã xác thực thông báo")}}.

Không phải tất cả hàm băm đều phù hợp cho mã hóa. Để được sử dụng cho mã hóa, hàm băm phải:

- nhanh để tính toán
- một chiều: với đầu ra đã cho, việc tái tạo đầu vào ban đầu là không thực tế hoặc không thể
- kháng giả mạo: bất kỳ thay đổi nào đối với đầu vào dẫn đến đầu ra khác
- kháng va chạm: việc tìm hai đầu vào khác nhau tạo ra cùng đầu ra là không thực tế

Các hàm băm được sử dụng phổ biến nhất trong mã hóa là từ họ _SHA-2_ (Secure Hash Algorithm 2), có tên là `"SHA-"` tiếp theo là độ dài của digest đầu ra tính bằng bit: ví dụ, `"SHA-256"` và `"SHA-512"`.

SHA-2 là người kế nhiệm thuật toán SHA-1, không còn được coi là bảo mật và không nên được sử dụng trong mã hóa. Lưu ý rằng thuật toán MD5 cũng được coi là không an toàn.

## Xem thêm

- {{domxref("SubtleCrypto.digest()")}}
- [Hash function](https://en.wikipedia.org/wiki/Hash_function) trên Wikipedia
- [Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function) trên Wikipedia
- Các thuật ngữ liên quan:
  - {{Glossary("Symmetric-key cryptography")}}
