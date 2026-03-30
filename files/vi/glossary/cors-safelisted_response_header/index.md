---
title: Header phản hồi được CORS cho phép
slug: Glossary/CORS-safelisted_response_header
page-type: glossary-definition
sidebar: glossarysidebar
---

**Header phản hồi được CORS cho phép** (còn được gọi là "header phản hồi đơn giản") là một [HTTP header](/en-US/docs/Web/HTTP/Reference/Headers) trong phản hồi [CORS](/en-US/docs/Web/HTTP/Guides/CORS) được coi là _an toàn_ để hiển thị cho các tập lệnh client. Chỉ các header phản hồi được cho phép mới có thể được truy cập từ các trang web.

Theo mặc định, danh sách cho phép bao gồm các header phản hồi sau:

- {{HTTPHeader("Cache-Control")}}
- {{HTTPHeader("Content-Language")}}
- {{HTTPHeader("Content-Length")}}
- {{HTTPHeader("Content-Type")}}
- {{HTTPHeader("Expires")}}
- {{HTTPHeader("Last-Modified")}}
- {{HTTPHeader("Pragma")}}

Các header bổ sung có thể được thêm vào danh sách cho phép bằng cách sử dụng {{HTTPHeader("Access-Control-Expose-Headers")}}.

## Ví dụ

### Mở rộng danh sách cho phép

Bạn có thể mở rộng danh sách các header phản hồi được CORS cho phép bằng cách sử dụng header {{HTTPHeader("Access-Control-Expose-Headers")}}:

```http
Access-Control-Expose-Headers: X-Custom-Header, Content-Encoding
```

## Xem thêm

- [HTTP](/en-US/docs/Web/HTTP)
- [HTTP headers](/en-US/docs/Web/HTTP/Reference/Headers)
- {{HTTPHeader("Access-Control-Expose-Headers")}}
- Các thuật ngữ liên quan:
  - {{Glossary("CORS")}}
  - {{Glossary("CORS-safelisted_request_header", "Header yêu cầu được CORS cho phép")}}
  - {{Glossary("Forbidden request header")}}
  - {{Glossary("Request header")}}
