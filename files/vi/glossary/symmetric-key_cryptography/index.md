---
title: Symmetric-key cryptography
slug: Glossary/Symmetric-key_cryptography
page-type: glossary-definition
sidebar: glossarysidebar
---

Mật mã học khóa đối xứng (Symmetric-key cryptography) là thuật ngữ dùng để chỉ các thuật toán mật mã sử dụng cùng một khóa cho cả quá trình mã hóa lẫn giải mã. Khóa này thường được gọi là "khóa đối xứng" hoặc "khóa bí mật".

Thuật toán này thường được so sánh với {{Glossary("public-key cryptography", "mật mã học khóa công khai")}}, trong đó các khóa được tạo thành cặp và phép biến đổi do một khóa thực hiện chỉ có thể được đảo ngược bằng khóa còn lại.

Khi được sử dụng đúng cách, các thuật toán khóa đối xứng đảm bảo tính bảo mật và có hiệu suất cao, do đó chúng có thể được dùng để mã hóa lượng dữ liệu lớn mà không ảnh hưởng tiêu cực đến hiệu năng.

Hầu hết các thuật toán khóa đối xứng hiện đang được sử dụng đều là các {{Glossary("Cipher", "mật mã")}} khối: nghĩa là chúng mã hóa dữ liệu theo từng khối. Kích thước mỗi khối được cố định và xác định bởi thuật toán — ví dụ AES sử dụng các khối 16 byte. Mật mã khối luôn được dùng kèm với một _{{Glossary("Block cipher mode of operation", "chế độ vận hành")}}_, chỉ định cách mã hóa an toàn các tin nhắn dài hơn kích thước khối. Ví dụ, AES là một mật mã, trong khi CTR, CBC và GCM đều là các chế độ vận hành. Việc sử dụng chế độ không phù hợp, hoặc sử dụng sai cách, có thể hoàn toàn phá vỡ tính bảo mật mà mật mã cơ bản cung cấp.

## Xem thêm

- [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API)
- [Các thuật toán SubtleCrypto được hỗ trợ](/en-US/docs/Web/API/SubtleCrypto#supported_algorithms)
- Các thuật ngữ liên quan:
  - {{Glossary("Block cipher mode of operation")}}
  - {{Glossary("Cryptography")}}
  - {{Glossary("Hash function")}}
