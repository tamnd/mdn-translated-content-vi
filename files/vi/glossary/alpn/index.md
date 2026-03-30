---
title: ALPN
slug: Glossary/ALPN
page-type: glossary-definition
sidebar: glossarysidebar
---

**Đàm phán giao thức lớp ứng dụng** (**ALPN** - Application-Layer Protocol Negotiation) là một tiện ích mở rộng {{Glossary("TLS")}} (được định nghĩa trong [RFC 7301](https://www.rfc-editor.org/rfc/rfc7301)) để xác định giao thức lớp ứng dụng nào đang đàm phán kết nối được mã hóa, mà không cần thêm vòng lặp để thực hiện điều đó.

| Giao thức                                 | Chuỗi nhận dạng                                        |
| ----------------------------------------- | ------------------------------------------------------ |
| {{Glossary("HTTP", "HTTP/1.1")}}          | `0x68 0x74 0x74 0x70 0x2F 0x31 0x2E 0x31` ("http/1.1") |
| {{Glossary("HTTP 2", "HTTP/2")}}          | `0x68 0x32` ("h2")                                     |
| HTTP/2 qua cleartext {{Glossary("TCP")}}  | `0x68 0x32 0x63` ("h2c")                               |
| {{Glossary("HTTP 3", "HTTP/3")}}          | `0x68 0x33` ("h3")                                     |

## Xem thêm

- Thuộc tính [Performance resource timing `nextHopProtocol`](/en-US/docs/Web/API/PerformanceResourceTiming/nextHopProtocol)
- [PerformanceObserver API](/en-US/docs/Web/API/PerformanceObserver)
- [Định danh ALPN đã đăng ký IANA](https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml#alpn-protocol-ids)
