---
title: 425 Too Early
slug: Web/HTTP/Reference/Status/425
page-type: http-status-code
browser-compat: http.status.425
sidebar: http
---

Mã trạng thái HTTP **`425 Too Early`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ không muốn chấp nhận rủi ro xử lý yêu cầu có thể bị phát lại để tránh các cuộc tấn công phát lại tiềm ẩn.

Nếu client đã tương tác với máy chủ gần đây, dữ liệu sớm (còn được gọi là dữ liệu zero round-trip time (0-RTT)) cho phép client gửi dữ liệu đến máy chủ trong vòng đầu tiên của kết nối mà không cần chờ quá trình bắt tay TLS [handshake](/en-US/docs/Glossary/TCP_handshake) hoàn tất.
Client gửi yêu cầu trong dữ liệu sớm không cần bao gồm tiêu đề `Early-Data`.
Xem {{HTTPHeader("Early-Data")}} để biết thêm thông tin.

## Trạng thái

```http
425 Too Early
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [TLS](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security)
- {{HTTPHeader("Early-Data")}}
