---
title: 307 Temporary Redirect
slug: Web/HTTP/Reference/Status/307
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.307
sidebar: http
---

Mã trạng thái [phản hồi chuyển hướng](/en-US/docs/Web/HTTP/Reference/Status#redirection_messages) HTTP **`307 Temporary Redirect`** cho biết rằng tài nguyên được yêu cầu đã được di chuyển _tạm thời_ đến URL trong tiêu đề {{HTTPHeader("Location")}}.

Trình duyệt nhận được trạng thái này sẽ tự động yêu cầu tài nguyên tại URL trong tiêu đề `Location`, chuyển hướng người dùng đến trang mới.
Các công cụ tìm kiếm nhận được phản hồi này sẽ không gán các liên kết đến URL ban đầu cho tài nguyên mới, nghĩa là không có giá trị {{Glossary("SEO")}} nào được chuyển sang URL mới.

Phương thức và thân của yêu cầu ban đầu được tái sử dụng để thực hiện yêu cầu chuyển hướng.
Trong các trường hợp bạn muốn phương thức yêu cầu thay đổi thành {{HTTPMethod("GET")}}, hãy sử dụng {{HTTPStatus("303", "303 See Other")}} thay thế.
Điều này hữu ích khi bạn muốn đưa ra câu trả lời cho yêu cầu {{HTTPMethod("PUT")}} thành công mà không phải tài nguyên đã được tải lên, mà là thông báo trạng thái hoặc xác nhận như "Bạn đã tải lên XYZ thành công".

Sự khác biệt giữa `307` và {{HTTPStatus("302")}} là `307` đảm bảo rằng client **sẽ không thay đổi** phương thức yêu cầu và thân khi yêu cầu được chuyển hướng.
Với `302`, các client cũ đã thay đổi sai phương thức thành {{HTTPMethod("GET")}}.
Các phản hồi `307` và `302` giống hệt nhau khi phương thức yêu cầu là {{HTTPMethod("GET")}}.

## Trạng thái

```http
307 Temporary Redirect
```

## Ví dụ

### Phản hồi 307 cho tài nguyên đã được di chuyển

Yêu cầu {{HTTPMethod("GET")}} sau đây được thực hiện đến tài nguyên có chuyển hướng `307`.
Tiêu đề {{HTTPHeader("Location")}} cung cấp URL của tài nguyên đã được chuyển hướng.

```http
GET /en-US/docs/AJAX HTTP/2
Host: developer.mozilla.org
User-Agent: curl/8.6.0
Accept: */*
```

```http
HTTP/2 307
location: /en-US/docs/Learn_web_development/Core/Scripting/Network_requests
content-type: text/plain; charset=utf-8
date: Fri, 19 Jul 2024 12:57:17 GMT
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Chuyển hướng trong HTTP](/en-US/docs/Web/HTTP/Guides/Redirections)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("302", "302 Found")}}, tương đương với `307`, nhưng có thể sửa đổi các phương thức không phải {{HTTPMethod("GET")}}
- {{HTTPStatus("303", "303 See Other")}}, chuyển hướng tạm thời thay đổi phương thức yêu cầu thành {{HTTPMethod("GET")}}
- {{HTTPStatus("301", "301 Moved Permanently")}}, chuyển hướng vĩnh viễn
