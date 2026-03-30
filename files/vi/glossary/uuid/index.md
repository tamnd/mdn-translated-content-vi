---
title: UUID
slug: Glossary/UUID
page-type: glossary-definition
sidebar: glossarysidebar
---

**Universally Unique Identifier** (**UUID** — Định danh duy nhất toàn cầu) là nhãn được dùng để xác định duy nhất một tài nguyên trong số tất cả các tài nguyên thuộc loại đó.

Các hệ thống máy tính tạo UUID cục bộ bằng cách sử dụng các số ngẫu nhiên rất lớn. Về lý thuyết, các ID có thể không hoàn toàn duy nhất trên toàn cầu, nhưng xác suất trùng lặp là cực kỳ nhỏ. Nếu hệ thống thực sự cần ID hoàn toàn duy nhất, chúng có thể được phân bổ bởi một cơ quan trung ương.

UUID có giá trị 128 bit và được biểu diễn theo quy chuẩn dưới dạng chuỗi 36 ký tự theo định dạng `123e4567-e89b-12d3-a456-426614174000` (5 chuỗi hex phân cách bằng dấu gạch ngang). Có một số phiên bản khác nhau đôi chút trong cách tính toán; ví dụ như việc bao gồm thông tin thời gian.

Định nghĩa chính thức có thể tìm thấy tại: [RFC4122: A Universally Unique IDentifier (UUID) URN Namespace](https://www.rfc-editor.org/rfc/rfc4122).

## Xem thêm

- [UUID](https://en.wikipedia.org/wiki/UUID) trên Wikipedia
- [`Crypto.randomUUID()`](/en-US/docs/Web/API/Crypto/randomUUID)
