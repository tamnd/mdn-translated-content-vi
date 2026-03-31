---
title: 302 Found
slug: Web/HTTP/Reference/Status/302
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.302
sidebar: http
---

Mã trạng thái [phản hồi chuyển hướng](/en-US/docs/Web/HTTP/Reference/Status#redirection_messages) HTTP **`302 Found`** cho biết rằng tài nguyên được yêu cầu đã được di chuyển _tạm thời_ đến URL trong tiêu đề {{HTTPHeader("Location")}}.

Trình duyệt nhận được trạng thái này sẽ tự động yêu cầu tài nguyên tại URL trong tiêu đề `Location`, chuyển hướng người dùng đến trang mới.
Các công cụ tìm kiếm nhận được phản hồi này sẽ không gán các liên kết đến URL ban đầu cho tài nguyên mới, nghĩa là không có giá trị {{Glossary("SEO")}} nào được chuyển sang URL mới.

> [!NOTE]
> Trong [Fetch Standard](https://fetch.spec.whatwg.org/#http-redirect-fetch), khi user agent nhận được phản hồi `302` cho yêu cầu {{HTTPMethod("POST")}}, nó sử dụng phương thức {{HTTPMethod("GET")}} trong yêu cầu chuyển hướng tiếp theo, như được cho phép bởi [đặc tả](#specifications) HTTP.
> Để tránh user agent sửa đổi yêu cầu, hãy sử dụng {{HTTPStatus("307", "307 Temporary Redirect")}} thay thế, vì việc thay đổi phương thức sau phản hồi `307` bị cấm.
>
> Trong các trường hợp bạn muốn bất kỳ phương thức yêu cầu nào được thay đổi thành {{HTTPMethod("GET")}}, hãy sử dụng {{HTTPStatus("303", "303 See Other")}}.
> Điều này hữu ích khi bạn muốn đưa ra phản hồi cho phương thức {{HTTPMethod("PUT")}} mà không phải tài nguyên đã được tải lên mà là thông báo xác nhận như: "bạn đã tải lên XYZ thành công".

## Trạng thái

```http
302 Found
```

## Ví dụ

### Phản hồi 302 với URL mới

```http
GET /profile HTTP/1.1
Host: www.example.com
```

```http
HTTP/1.1 302 Found
Location: https://www.example.com/new-profile-url
Content-Type: text/html; charset=UTF-8
Content-Length: 0
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Chuyển hướng trong HTTP](/en-US/docs/Web/HTTP/Guides/Redirections)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("307", "307 Temporary Redirect")}}, tương đương với `302` nhưng phương thức yêu cầu không bị sửa đổi
- {{HTTPStatus("303", "303 See Other")}}, chuyển hướng tạm thời thay đổi phương thức thành {{HTTPMethod("GET")}}
- {{HTTPStatus("301", "301 Moved Permanently")}}, chuyển hướng vĩnh viễn
