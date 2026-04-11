---
title: "RTCPeerConnection: phương thức removeStream()"
short-title: removeStream()
slug: Web/API/RTCPeerConnection/removeStream
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.RTCPeerConnection.removeStream
---

{{APIRef("WebRTC")}}{{Deprecated_Inline}}{{Non-standard_Inline}}

Phương thức lỗi thời **`removeStream()`** của giao diện {{domxref("RTCPeerConnection")}} xóa một {{domxref("MediaStream")}} làm nguồn cục bộ cho âm thanh hoặc video.
Vì phương thức này đã lỗi thời, bạn nên dùng {{domxref("RTCPeerConnection.removeTrack", "removeTrack()")}}.

## Cú pháp

```js-nolint
removeStream(stream)
```

### Tham số

- `stream`
  - : Một {{domxref("MediaStream")}} sẽ được xóa khỏi kết nối.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
