---
title: "RTCPeerConnection: phương thức createDTMFSender()"
short-title: createDTMFSender()
slug: Web/API/RTCPeerConnection/createDTMFSender
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.RTCPeerConnection.createDTMFSender
---

{{APIRef("WebRTC")}}{{Deprecated_Inline}}{{Non-standard_Inline}}

Phương thức lỗi thời **`createDTMFSender()`** của giao diện {{domxref("RTCPeerConnection")}} tạo một {{domxref("RTCDTMFSender")}} mới, gắn với một {{domxref("MediaStreamTrack")}} cụ thể, để có thể gửi tín hiệu điện thoại {{Glossary("DTMF")}} qua kết nối.

## Cú pháp

```js-nolint
createDTMFSender(track)
```

### Tham số

- `track`
  - : Track âm thanh sẽ được dùng để tạo sender DTMF.

### Giá trị trả về

Một {{domxref("RTCDTMFSender")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
