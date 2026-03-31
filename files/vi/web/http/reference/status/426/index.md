---
title: 426 Upgrade Required
slug: Web/HTTP/Reference/Status/426
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.426
sidebar: http
---

Mã trạng thái HTTP **`426 Upgrade Required`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ từ chối thực hiện yêu cầu bằng giao thức hiện tại nhưng có thể sẵn sàng làm như vậy sau khi client nâng cấp lên giao thức khác.

Máy chủ gửi tiêu đề {{HTTPHeader("Upgrade")}} kèm phản hồi này để cho biết (các) giao thức bắt buộc.

## Trạng thái

```http
426 Upgrade Required
```

## Ví dụ

### Yêu cầu nâng cấp từ HTTP/1.1

Với yêu cầu GET đến một hệ thống:

```http
GET /resources HTTP/1.1
Host: example.com
```

Máy chủ gốc yêu cầu các yêu cầu phải được thực hiện bằng [HTTP/3](/en-US/docs/Glossary/HTTP_3):

```http
HTTP/1.1 426 Upgrade Required
Upgrade: HTTP/3.0
Connection: Upgrade
Content-Length: 53
Content-Type: text/plain

This service requires use of the HTTP/3.0 protocol.
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPHeader("Upgrade")}}
- {{HTTPStatus("101", "101 Switching Protocols")}}
