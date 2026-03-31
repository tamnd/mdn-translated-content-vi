---
title: 407 Proxy Authentication Required
slug: Web/HTTP/Reference/Status/407
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.407
sidebar: http
---

Mã trạng thái HTTP **`407 Proxy Authentication Required`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết yêu cầu không thành công vì thiếu thông tin xác thực hợp lệ cho {{Glossary("proxy server")}} nằm giữa client và máy chủ có quyền truy cập tài nguyên được yêu cầu.

Phản hồi này được gửi kèm tiêu đề {{HTTPHeader("Proxy-Authenticate")}} chứa thông tin về cách xác thực yêu cầu đúng cách.
Client có thể lặp lại yêu cầu với trường tiêu đề {{HTTPHeader("Proxy-Authorization")}} mới hoặc thay thế.

## Trạng thái

```http
407 Proxy Authentication Required
```

## Ví dụ

### Xác thực proxy

Yêu cầu GET được thực hiện tới `example.com/admin`:

```http
GET /admin HTTP/1.1
Host: example.com
```

Trên đường truyền, một thành phần trung gian thông báo cho client biết rằng client phải được xác thực và cung cấp thông tin về sơ đồ xác thực:

```http
HTTP/1.1 407 Proxy Authentication Required
Date: Wed, 21 Oct 2015 07:28:00 GMT
Proxy-Authenticate: Basic realm="Access to internal site"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication)
- {{HTTPHeader("WWW-Authenticate")}}
- {{HTTPHeader("Authorization")}}
- {{HTTPHeader("Proxy-Authorization")}}
- {{HTTPHeader("Proxy-Authenticate")}}
- {{HTTPStatus("401")}}, {{HTTPStatus("403")}}
