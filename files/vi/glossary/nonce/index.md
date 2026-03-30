---
title: Nonce
slug: Glossary/Nonce
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong mật mã học và bảo mật máy tính, **`nonce`** là một số tùy ý chỉ được sử dụng **một lần duy nhất** trong giao tiếp mật mã. Thuật ngữ này được rút ra từ "number used once" (số chỉ dùng một lần) và thường được dùng để ngăn chặn tấn công phát lại (replay attack), đảm bảo tính mới của thông điệp, và tăng thêm tính ngẫu nhiên cho các giao thức mật mã.

Nonce được dùng phổ biến trong các giao thức xác thực, các cơ chế mã hóa, băm (hashing), và chữ ký số. Chúng có thể được tạo ra ngẫu nhiên hoặc giả ngẫu nhiên, hoặc được dẫn xuất theo cách xác định, tùy thuộc vào ứng dụng và yêu cầu bảo mật.

Trong bảo mật web, nonce thường được dùng trong các cơ chế như **Content Security Policy (CSP)** để cho phép các script cụ thể thực thi trong khi ngăn chặn tấn công cross-site scripting (XSS). Trong các giao thức mật mã như {{Glossary("TLS")}}, nonce giúp đảm bảo mỗi phiên làm việc là duy nhất.

## Xem thêm

- [Cryptographic nonce](https://en.wikipedia.org/wiki/Cryptographic_nonce) trên Wikipedia
- [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP)
- [Replay attack](https://en.wikipedia.org/wiki/Replay_attack) trên Wikipedia
- Các thuật ngữ liên quan:
  - {{Glossary("cryptography")}}
  - {{Glossary("encryption")}}
  - {{Glossary("Hash function", "hash")}}
  - {{Glossary("TLS")}}
  - {{Glossary("authentication")}}
