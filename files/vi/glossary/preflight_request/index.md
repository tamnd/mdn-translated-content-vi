---
title: Preflight request
slug: Glossary/Preflight_request
page-type: glossary-definition
sidebar: glossarysidebar
---

Yêu cầu preflight CORS là một yêu cầu {{Glossary("CORS")}} kiểm tra xem giao thức CORS có được hiểu và máy chủ có nhận biết bằng cách sử dụng các phương thức và header cụ thể hay không.

Đây là yêu cầu {{HTTPMethod("OPTIONS")}}, sử dụng hai hoặc ba header yêu cầu HTTP: {{HTTPHeader("Access-Control-Request-Method")}}, {{HTTPHeader("Origin")}}, và tùy chọn {{HTTPHeader("Access-Control-Request-Headers")}}.

Yêu cầu preflight được trình duyệt tự động phát ra và trong các trường hợp thông thường, các nhà phát triển front-end không cần tự tạo các yêu cầu như vậy. Nó xuất hiện khi yêu cầu đủ điều kiện là ["cần được kiểm tra trước"](/en-US/docs/Web/HTTP/Guides/CORS#preflighted_requests) và bị bỏ qua cho các [yêu cầu đơn giản](/en-US/docs/Web/HTTP/Guides/CORS#simple_requests).

Ví dụ, client có thể hỏi máy chủ xem có cho phép yêu cầu {{HTTPMethod("DELETE")}} không, trước khi gửi yêu cầu `DELETE`, bằng cách sử dụng yêu cầu preflight:

```http
OPTIONS /resource/foo
Access-Control-Request-Method: DELETE
Access-Control-Request-Headers: x-requested-with
Origin: https://www.example.com
```

Nếu máy chủ cho phép, thì nó sẽ phản hồi yêu cầu preflight với header phản hồi {{HTTPHeader("Access-Control-Allow-Methods")}}, trong đó liệt kê `DELETE`:

```http
HTTP/1.1 204 No Content
Connection: keep-alive
Access-Control-Allow-Origin: https://www.example.com
Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE
Access-Control-Allow-Headers: X-Requested-With
Access-Control-Max-Age: 86400
```

Phản hồi preflight có thể được cache tùy chọn cho các yêu cầu được tạo với cùng {{Glossary("URL")}} bằng cách sử dụng header {{HTTPHeader("Access-Control-Max-Age")}} như trong ví dụ trên. Để cache các phản hồi preflight, trình duyệt sử dụng một cache riêng biệt với cache HTTP chung mà trình duyệt quản lý. Phản hồi preflight không bao giờ được cache trong cache HTTP chung của trình duyệt.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("CORS")}}
- {{HTTPMethod("OPTIONS")}}
