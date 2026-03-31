---
title: 101 Switching Protocols
slug: Web/HTTP/Reference/Status/101
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.101
sidebar: http
---

Mã trạng thái [phản hồi thông tin](/en-US/docs/Web/HTTP/Reference/Status#informational_responses) HTTP **`101 Switching Protocols`** cho biết giao thức mà máy chủ đã chuyển sang.
Giao thức được chỉ định trong tiêu đề yêu cầu {{HTTPHeader("Upgrade")}} nhận được từ client.

Máy chủ bao gồm tiêu đề {{HTTPHeader("Upgrade")}} trong phản hồi này để cho biết giao thức mà nó đã đồng ý chuyển sang.
Quá trình này được mô tả chi tiết trong hướng dẫn [Cơ chế nâng cấp giao thức](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism).

## Trạng thái

```http
101 Switching Protocols
```

## Ví dụ

### Chuyển đổi giao thức sang WebSockets

Ví dụ sau đây cho thấy cách chuyển đổi giao thức có thể được dùng với [WebSockets](/en-US/docs/Web/API/WebSockets_API).
Client gửi yêu cầu HTTP {{HTTPMethod("GET")}} với tiêu đề {{HTTPHeader("Upgrade")}} cũng phải được liệt kê trong tiêu đề {{HTTPHeader("Connection")}}.
Máy chủ đồng ý chuyển đổi giao thức, trả về phản hồi 101 có nghĩa là kết nối đã chuyển từ HTTP sang WebSocket.
Lúc này, client và máy chủ có thể bắt đầu trao đổi dữ liệu WebSocket.
Thông tin về cách thiết lập các tiêu đề `Sec-WebSocket-*` cho việc thương lượng bắt tay có thể tìm thấy trong [Các tiêu đề dành riêng cho WebSocket](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism#websocket-specific_headers).

```http
GET /notifications HTTP/1.1
Host: example.com
Upgrade: websocket
Connection: Upgrade
```

```http
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Cơ chế nâng cấp giao thức](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism)
- [WebSockets](/en-US/docs/Web/API/WebSockets_API)
- {{HTTPHeader("Upgrade")}}
- {{HTTPStatus("426", "426 Upgrade Required")}}
