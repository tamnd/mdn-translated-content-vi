---
title: 410 Gone
slug: Web/HTTP/Reference/Status/410
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.410
sidebar: http
---

Mã trạng thái HTTP **`410 Gone`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết tài nguyên đích không còn khả dụng tại máy chủ gốc và tình trạng này có khả năng là vĩnh viễn.
Phản hồi 410 được lưu vào bộ nhớ đệm theo mặc định.

Client không nên lặp lại yêu cầu cho các tài nguyên trả về phản hồi 410, và chủ sở hữu trang web nên xóa hoặc thay thế các liên kết trả về mã này.
Nếu chủ sở hữu máy chủ không biết tình trạng này là tạm thời hay vĩnh viễn, nên sử dụng mã trạng thái {{HTTPStatus(404)}} thay thế.

## Trạng thái

```http
410 Gone
```

## Ví dụ

### Yêu cầu tài nguyên đã lỗi thời

Yêu cầu `GET` sau dành cho một trang với nội dung quảng cáo không còn hiệu lực:

```http
GET /promotions/summer-2023 HTTP/1.1
Host: example.com
```

```http
HTTP/1.1 410 Gone
Content-Type: text/html
Content-Length: 212

<html lang="en-US">
  <head>
    <title>Promotion expired</title>
  </head>
  <body>
    <h1>Promotion expired</h1>
    <p>Promotion no longer active! See <a href="/offers">current offers</a>.</p>
  </body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus(404)}}
- [410 gone](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#410)
