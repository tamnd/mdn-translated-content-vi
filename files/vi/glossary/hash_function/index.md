---
title: Hash function
slug: Glossary/Hash_function
page-type: glossary-definition
sidebar: glossarysidebar
---

**Hàm băm** là hàm nhận đầu vào có độ dài biến đổi và tạo ra đầu ra có độ dài cố định, còn được gọi là _digest_ (hoặc chỉ là "hash"). Hàm băm nên nhanh để tính toán, và các đầu vào khác nhau nên tạo ra đầu ra khác nhau càng nhiều càng tốt (điều này được gọi là _collision-resistance_ - kháng va chạm).

Hàm băm có cả mục đích {{glossary("cryptography", "mã hóa")}} và phi mã hóa. Ngoài mã hóa, ví dụ, hàm băm có thể được sử dụng để tạo các khóa cho mảng kết hợp như bản đồ hoặc từ điển.

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
