---
title: DTLS (Datagram Transport Layer Security)
slug: Glossary/DTLS
page-type: glossary-definition
sidebar: glossarysidebar
---

**Datagram Transport Layer Security** (**DTLS**) là giao thức được sử dụng để bảo mật các giao tiếp dựa trên datagram. Nó dựa trên Transport Layer Security ({{Glossary("TLS")}}) tập trung vào luồng, cung cấp mức độ bảo mật tương tự. Là giao thức datagram, DTLS không đảm bảo thứ tự phân phối thông điệp, hoặc thậm chí là thông điệp có được phân phối hay không. Tuy nhiên, DTLS cũng có được các lợi ích của giao thức datagram; đặc biệt là overhead thấp hơn và độ trễ giảm.

Các tính năng này đặc biệt hữu ích cho một trong những lĩnh vực phổ biến nhất mà DTLS phát huy: {{Glossary("WebRTC")}}. Tất cả các giao thức liên quan đến WebRTC đều được yêu cầu mã hóa truyền thông của họ bằng DTLS; điều này bao gồm {{Glossary("SCTP")}}, {{Glossary("RTP","SRTP")}}, và {{Glossary("STUN")}}.

## Xem thêm

- [Datagram Transport Layer Security](https://en.wikipedia.org/wiki/Datagram_Transport_Layer_Security) trên Wikipedia
- Thông số kỹ thuật:
  - {{RFC(9147, "The Datagram Transport Layer Security (DTLS) Protocol Version 1.3")}}
  - {{RFC(6347, "Datagram Transport Layer Security Version 1.2")}}
