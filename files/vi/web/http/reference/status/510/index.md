---
title: 510 Not Extended
slug: Web/HTTP/Reference/Status/510
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc2774#section-7
sidebar: http
---

Mã trạng thái HTTP **`510 Not Extended`** [phản hồi lỗi phía máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) được gửi khi yêu cầu client khai báo một HTTP Extension ({{RFC("2774")}}) cần được sử dụng để xử lý yêu cầu, nhưng extension đó không được hỗ trợ.

## Trạng thái

```http
510 Not Extended
```

## Ví dụ

### Extension không được hỗ trợ

Trong ví dụ sau, client gửi yêu cầu với phần mở rộng bắt buộc được chỉ định trong tiêu đề `C-MAN`.
Tiêu đề {{HTTPHeader("Connection")}} chỉ định rằng các phần mở rộng này phải được xử lý trên cơ sở [hop-by-hop](/en-US/docs/Web/HTTP/Reference/Headers#hop-by-hop_headers).
Một {{Glossary("Proxy_server", "proxy")}} chuyển tiếp yêu cầu mở rộng, nhưng tiêu đề {{HTTPHeader("Connection")}} bị loại bỏ trong quá trình truyền.
Vì máy chủ gốc không nhận được bất kỳ thông tin nào về phương thức `M-GET`, nó gửi `510` trong phản hồi:

```http
M-GET /document HTTP/1.1
Host: example.com
C-Man: "http://www.example.org/"
Connection: C-Man
```

```http
HTTP/1.1 510 Not Extended
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
