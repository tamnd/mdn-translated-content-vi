---
title: "RTCPeerConnection: hàm tạo RTCPeerConnection()"
short-title: RTCPeerConnection()
slug: Web/API/RTCPeerConnection/RTCPeerConnection
page-type: web-api-constructor
browser-compat: api.RTCPeerConnection.RTCPeerConnection
---

{{APIRef("WebRTC")}}

Hàm tạo **`RTCPeerConnection()`** tạo một đối tượng {{domxref("RTCPeerConnection")}} mới.

## Cú pháp

```js-nolint
new RTCPeerConnection()
new RTCPeerConnection(configuration)
```

### Tham số

- `configuration` {{optional_inline}}
  - : Một đối tượng {{domxref("RTCConfiguration")}} chỉ định cấu hình cho kết nối mới.

## Ví dụ

```js
const pc = new RTCPeerConnection({
  iceServers: [{ urls: "stun:stun.l.google.com:19302" }],
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
