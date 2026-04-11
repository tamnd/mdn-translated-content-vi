---
title: "RTCPeerConnection: phương thức removeTrack()"
short-title: removeTrack()
slug: Web/API/RTCPeerConnection/removeTrack
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.removeTrack
---

{{APIRef("WebRTC")}}

Phương thức **`removeTrack()`** của giao diện {{domxref("RTCPeerConnection")}} yêu cầu đầu cục bộ của kết nối ngừng gửi media từ track được chỉ định, mà không thực sự xóa {{DOMxRef("RTCRtpSender")}} tương ứng khỏi danh sách sender như được báo cáo bởi {{DOMxRef("RTCPeerConnection.getSenders", "getSenders()")}}.
Nếu track đã dừng, hoặc không có trong danh sách sender của kết nối, phương thức này không có tác dụng.

## Cú pháp

```js-nolint
removeTrack(sender)
```

### Tham số

- `sender`
  - : {{domxref("RTCRtpSender")}} tương ứng với track cần ngừng gửi.

## Ví dụ

```js
const sender = pc.getSenders()[0];
pc.removeTrack(sender);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
