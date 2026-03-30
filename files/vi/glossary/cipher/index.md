---
title: Cipher (Mật mã)
slug: Glossary/Cipher
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong {{glossary("cryptography", "mật mã học")}}, **mật mã** là một thuật toán có thể {{glossary("encryption", "mã hóa")}} {{glossary("plaintext", "văn bản thuần túy")}} để làm cho nó không đọc được, và {{glossary("decryption", "giải mã")}} dữ liệu đã được mã hóa trở lại thành văn bản thuần túy.

Các mật mã đã phổ biến từ rất lâu trước kỷ nguyên thông tin (ví dụ: [mật mã thay thế](https://en.wikipedia.org/wiki/Substitution_cipher), [mật mã hoán vị](https://en.wikipedia.org/wiki/Transposition_cipher), và [mật mã hoán đổi vị trí](https://en.wikipedia.org/wiki/Permutation_cipher)), nhưng không ai trong số chúng an toàn về mặt mật mã học ngoại trừ [one-time pad](https://en.wikipedia.org/wiki/One-time_pad).

Trong thời đại hiện đại, các mật mã đã phát triển đáng kể. [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard), [RSA](<https://en.wikipedia.org/wiki/RSA_(cryptosystem)>) và [Blowfish](<https://en.wikipedia.org/wiki/Blowfish_(cipher)>) là ví dụ về các mật mã là thành phần không thể thiếu của các tiêu chuẩn và hệ thống mã hóa hiện đại.

Các mật mã hiện đại được thiết kế để chịu đựng các cuộc tấn công được phát hiện thông qua {{glossary("cryptanalysis", "phân tích mật mã")}}. Không có gì đảm bảo rằng tất cả các phương thức tấn công đã được phát hiện, vì vậy mỗi thuật toán được [khuyến nghị cho các mục đích khác nhau](/en-US/docs/Web/API/SubtleCrypto#supported_algorithms) dựa trên các loại tấn công đã biết.

Các mật mã hoạt động theo một trong hai cách: như [mật mã khối](https://en.wikipedia.org/wiki/Block_cipher) trên các khối (hoặc bộ đệm) dữ liệu liên tiếp, hoặc như [mật mã dòng](https://en.wikipedia.org/wiki/Stream_cipher) trên một luồng dữ liệu liên tục (thường là âm thanh hoặc video).

Các mật mã cũng được phân loại theo cách xử lý {{glossary("key", "khóa")}} của chúng:

- Các thuật toán {{Glossary("Symmetric-key cryptography", "khóa đối xứng")}} sử dụng cùng một khóa để mã hóa và giải mã tin nhắn. Khóa cũng phải được gửi một cách an toàn nếu tin nhắn cần giữ bí mật.
- Các thuật toán {{Glossary("Public-key cryptography", "khóa bất đối xứng")}} sử dụng một khóa để mã hóa và khóa kia để giải mã.

## Xem thêm

- [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API)
- [Các thuật toán được SubtleCrypto hỗ trợ](/en-US/docs/Web/API/SubtleCrypto#supported_algorithms)
- Thuật ngữ liên quan:
  - {{Glossary("Block cipher mode of operation")}}
  - {{Glossary("Ciphertext")}}
  - {{Glossary("Cipher suite")}}
  - {{Glossary("Cryptanalysis")}}
  - {{Glossary("Cryptography")}}
  - {{Glossary("Decryption")}}
  - {{Glossary("Encryption")}}
  - {{Glossary("Key")}}
  - {{Glossary("Plaintext")}}
  - {{Glossary("Public-key cryptography")}}
  - {{Glossary("Symmetric-key cryptography")}}
- [Cipher](https://en.wikipedia.org/wiki/Cipher) trên Wikipedia
