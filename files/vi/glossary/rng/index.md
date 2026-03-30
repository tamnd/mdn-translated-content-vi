---
title: RNG
slug: Glossary/RNG
page-type: glossary-definition
sidebar: glossarysidebar
---

**PRNG** (pseudorandom number generator - bộ tạo số giả ngẫu nhiên) là thuật toán xuất ra các số theo một mẫu phức tạp, thoạt nhìn có vẻ không thể đoán trước. Các số thực sự ngẫu nhiên (ví dụ, từ nguồn phóng xạ) hoàn toàn không thể dự đoán, trong khi mọi thuật toán đều có tính dự đoán được, và PRNG sẽ trả về các số giống nhau khi được truyền vào cùng tham số khởi đầu hay _seed_ (hạt giống).

PRNG có thể được sử dụng cho nhiều ứng dụng khác nhau, chẳng hạn như trò chơi điện tử.

PRNG an toàn về mặt mật mã là PRNG có thêm một số thuộc tính đặc biệt giúp nó phù hợp để sử dụng trong mật mã học. Các thuộc tính đó bao gồm:

- Việc kẻ tấn công (không biết seed) dự đoán đầu ra của nó là không khả thi về mặt tính toán.
- Nếu kẻ tấn công biết được trạng thái hiện tại của nó, điều đó vẫn không cho phép họ suy ra các số đã phát ra trước đó.

Hầu hết các PRNG đều không an toàn về mặt mật mã.

## Xem thêm

- Hàm PRNG tích hợp sẵn của JavaScript {{jsxref("Math.random()")}} và CSS {{cssxref("random()")}}. Lưu ý rằng đây không phải là PRNG an toàn về mặt mật mã.
- {{domxref("Crypto.getRandomValues()")}}: được thiết kế để cung cấp các số an toàn về mặt mật mã.
- [Bộ tạo số giả ngẫu nhiên](https://en.wikipedia.org/wiki/Pseudorandom_number_generator) trên Wikipedia
