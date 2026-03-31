---
title: 401 Unauthorized
slug: Web/HTTP/Reference/Status/401
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.401
sidebar: http
---

Mã trạng thái HTTP **`401 Unauthorized`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết yêu cầu không thành công vì thiếu thông tin xác thực hợp lệ cho tài nguyên được yêu cầu.
Mã trạng thái này được gửi kèm tiêu đề phản hồi HTTP {{HTTPHeader("WWW-Authenticate")}} chứa thông tin về [sơ đồ xác thực](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes) mà máy chủ yêu cầu client cung cấp để thực hiện yêu cầu thành công.

`401 Unauthorized` tương tự phản hồi {{HTTPStatus("403", "403 Forbidden")}}, ngoại trừ phản hồi 403 được trả về khi yêu cầu chứa thông tin xác thực hợp lệ nhưng client không có quyền thực hiện hành động đó.

## Trạng thái

```http
401 Unauthorized
```

## Ví dụ

### Yêu cầu trái phép đến một API được bảo vệ

Yêu cầu GET sau được gửi đến URL `www.example.com/admin` yêu cầu thông tin xác thực trong tiêu đề {{HTTPHeader("Authorization")}}:

```http
GET /admin HTTP/1.1
Host: example.com
```

Máy chủ phản hồi với thông báo 401 và tiêu đề {{HTTPHeader("WWW-Authenticate")}} cho biết yêu cầu phải được xác thực và `Bearer` auth (access token) là [sơ đồ xác thực](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes) được cho phép:

```http
HTTP/1.1 401 Unauthorized
Date: Tue, 02 Jul 2024 12:18:47 GMT
WWW-Authenticate: Bearer
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication)
- {{Glossary("Challenge")}}
- {{HTTPHeader("WWW-Authenticate")}}
- {{HTTPHeader("Authorization")}}
- {{HTTPHeader("Proxy-Authorization")}}
- {{HTTPHeader("Proxy-Authenticate")}}
- {{HTTPStatus("403")}}, {{HTTPStatus("407")}}
