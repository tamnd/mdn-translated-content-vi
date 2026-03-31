---
title: 421 Misdirected Request
slug: Web/HTTP/Reference/Status/421
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#name-421-misdirected-request
sidebar: http
---

Mã trạng thái HTTP **`421 Misdirected Request`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết yêu cầu đã được gửi đến một máy chủ không có khả năng tạo phản hồi.
Điều này có thể được gửi bởi máy chủ không được cấu hình để tạo phản hồi cho sự kết hợp giữa [scheme](/en-US/docs/Web/URI/Reference/Schemes) và [authority](/en-US/docs/Web/URI/Reference/Authority) được bao gồm trong URI của yêu cầu.

Client có thể thử lại yêu cầu qua một kết nối khác.

## Trạng thái

```http
421 Misdirected Request
```

## Ví dụ

### Lỗi SNI của Apache

Với yêu cầu sau:

```http
GET / HTTP/1.1
Host: abc.example.com
```

Trong các trường hợp như chứng chỉ wildcard (`*.example.com`) khi kết nối được tái sử dụng cho nhiều tên miền (`abc.example.com`, `def.example.com`), máy chủ có thể phản hồi với 421:

```http
HTTP/1.1 421 Misdirected Request
Date: Wed, 26 Jun 2024 12:00:00 GMT
Server: Apache/2.4.1 (Unix)
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Multiple hosts and misdirected requests](https://httpd.apache.org/docs/2.4/mod/mod_http2.html#misdirected) Tài liệu Apache Server
- [TLS](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security)
- [Server Name Indication (SNI)](https://en.wikipedia.org/wiki/Server_Name_Indication)
- [Cấu hình Transport Layer Security (TLS)](/en-US/docs/Web/Security/Practical_implementation_guides/TLS)
