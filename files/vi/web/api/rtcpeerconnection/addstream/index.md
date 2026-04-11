---
title: "RTCPeerConnection: phương thức addStream()"
short-title: addStream()
slug: Web/API/RTCPeerConnection/addStream
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.RTCPeerConnection.addStream
---

{{APIRef("WebRTC")}}{{Deprecated_Inline}}{{Non-standard_Inline}}

Phương thức lỗi thời **`addStream()`** của giao diện {{domxref("RTCPeerConnection")}} thêm một {{domxref("MediaStream")}} làm nguồn cục bộ cho âm thanh hoặc video.
Thay vì dùng phương thức lỗi thời này, bạn nên dùng {{domxref("RTCPeerConnection.addTrack", "addTrack()")}} một lần cho mỗi track bạn muốn gửi đến máy ngang hàng từ xa.

## Cú pháp

```js-nolint
addStream(stream)
```

### Tham số

- `stream`
  - : Một {{domxref("MediaStream")}} sẽ được thêm vào kết nối.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
