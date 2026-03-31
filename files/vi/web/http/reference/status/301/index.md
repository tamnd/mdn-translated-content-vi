---
title: 301 Moved Permanently
slug: Web/HTTP/Reference/Status/301
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.301
sidebar: http
---

Mã trạng thái [phản hồi chuyển hướng](/en-US/docs/Web/HTTP/Reference/Status#redirection_messages) HTTP **`301 Moved Permanently`** cho biết rằng tài nguyên được yêu cầu đã được di chuyển vĩnh viễn đến URL trong tiêu đề {{HTTPHeader("Location")}}.

Trình duyệt nhận được trạng thái này sẽ tự động yêu cầu tài nguyên tại URL trong tiêu đề `Location`, chuyển hướng người dùng đến trang mới.
Các công cụ tìm kiếm nhận được phản hồi này sẽ gán các liên kết đến URL ban đầu cho tài nguyên đã được chuyển hướng, chuyển xếp hạng {{Glossary("SEO")}} sang URL mới.

> [!NOTE]
> Trong [Fetch Standard](https://fetch.spec.whatwg.org/#http-redirect-fetch), khi user agent nhận được phản hồi `301` cho yêu cầu {{HTTPMethod("POST")}}, nó sử dụng phương thức {{HTTPMethod("GET")}} trong yêu cầu chuyển hướng tiếp theo, như được cho phép bởi [đặc tả](#specifications) HTTP.
> Để tránh user agent sửa đổi yêu cầu, hãy sử dụng {{HTTPStatus("308", "308 Permanent Redirect")}} thay thế, vì việc thay đổi phương thức sau phản hồi `308` bị cấm.

## Trạng thái

```http
301 Moved Permanently
```

## Ví dụ

### Phản hồi 301 cho tài nguyên đã được di chuyển

Yêu cầu {{HTTPMethod("GET")}} sau đây được thực hiện đến tài nguyên có chuyển hướng `301`.

```http
GET /en-US/docs/AJAX HTTP/2
Host: developer.mozilla.org
User-Agent: curl/8.6.0
Accept: */*
```

Phản hồi bao gồm trạng thái `301` cùng với tiêu đề {{HTTPHeader("Location")}} cho biết URL nơi tài nguyên đã được di chuyển đến.

```http
HTTP/2 301
cache-control: max-age=2592000,public
location: /en-US/docs/Learn_web_development/Core/Scripting/Network_requests
content-type: text/plain; charset=utf-8
date: Fri, 19 Jul 2024 12:57:17 GMT
content-length: 97

Moved Permanently. Redirecting to /en-US/docs/Learn_web_development/Core/Scripting/Network_requests
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Chuyển hướng trong HTTP](/en-US/docs/Web/HTTP/Guides/Redirections)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("308", "308 Permanent Redirect")}} tương đương với `301`, nhưng phương thức yêu cầu không bị sửa đổi
- {{HTTPStatus("302", "302 Found")}} chuyển hướng tạm thời
