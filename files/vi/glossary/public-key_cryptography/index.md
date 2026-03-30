---
title: Mật mã khóa công khai
slug: Glossary/Public-key_cryptography
page-type: glossary-definition
sidebar: glossarysidebar
---

Mật mã khóa công khai (Public-key cryptography) — hay còn gọi là _mật mã bất đối xứng_ (asymmetric cryptography) — là một hệ thống mật mã trong đó các khóa xuất hiện theo cặp. Phép biến đổi được thực hiện bởi một trong hai khóa chỉ có thể được hoàn tác bằng khóa kia. Một khóa (_khóa riêng tư_ — private key) được giữ bí mật trong khi khóa còn lại được công khai.

## Chữ ký số

Khi được dùng cho {{glossary("digital signature", "chữ ký số")}}, khóa riêng tư được dùng để ký, và khóa công khai được dùng để xác minh. Điều này có nghĩa là bất kỳ ai cũng có thể xác minh chữ ký, nhưng chỉ chủ sở hữu của khóa riêng tư tương ứng mới có thể tạo ra nó.

## Mã hóa

Khi được dùng cho {{glossary("encryption")}} (mã hóa), khóa công khai được dùng để mã hóa, và khóa riêng tư được dùng để giải mã. Điều này mang lại cho hệ thống mã hóa khóa công khai một lợi thế so với hệ thống mã hóa đối xứng: Khóa mã hóa có thể được công khai. Bất kỳ ai cũng có thể mã hóa một tin nhắn tới chủ sở hữu khóa riêng tư, nhưng chỉ chủ sở hữu khóa riêng tư mới có thể giải mã nó.

Tuy nhiên, hệ thống mã hóa khóa công khai thường chậm hơn nhiều so với các thuật toán đối xứng, và kích thước các tin nhắn chúng có thể mã hóa tỷ lệ với kích thước khóa, vì vậy chúng không mở rộng tốt cho các tin nhắn dài.

Do đó, thường gặp nhất là hệ thống mã hóa sử dụng thuật toán đối xứng để mã hóa các tin nhắn, rồi dùng hệ thống khóa công khai để mã hóa khóa đối xứng. Cách sắp xếp này có thể mang lại lợi ích của cả hai hệ thống.

## Các hệ thống mật mã khóa công khai phổ biến

Các hệ thống mật mã khóa công khai thường dùng là [RSA](https://en.wikipedia.org/wiki/RSA_cryptosystem) (cho cả ký và mã hóa), [DSA](https://en.wikipedia.org/wiki/Digital_Signature_Algorithm) (cho ký) và [Diffie–Hellman](https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange) (để thỏa thuận khóa).

Mật mã đường cong elliptic cung cấp phương pháp thay thế cho các hệ thống mật mã này với lợi thế sử dụng kích thước khóa tương đối nhỏ hơn, thao tác nhanh hơn và lưu trữ, truyền tải nhỏ hơn. Các thuật toán đường cong elliptic phổ biến bao gồm [Elliptic-curve Diffie–Hellman](https://en.wikipedia.org/wiki/Elliptic-curve_Diffie–Hellman) và [Elliptic Curve Digital Signature Algorithm](https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm), mà các nhà phát triển thường gặp dưới dạng viết tắt **ECDH** và **ECDSA**.

## Xem thêm

- [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API)
- [Các thuật toán được SubtleCrypto hỗ trợ](/en-US/docs/Web/API/SubtleCrypto#supported_algorithms)
- Các thuật ngữ liên quan:
  - {{Glossary("Symmetric-key cryptography")}}
- [Public-key cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography) trên Wikipedia
