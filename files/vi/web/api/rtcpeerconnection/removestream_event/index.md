---
title: "RTCPeerConnection: sự kiện removestream"
short-title: removestream
slug: Web/API/RTCPeerConnection/removestream_event
page-type: web-api-event
status:
  - deprecated
  - non-standard
browser-compat: api.RTCPeerConnection.removestream_event
---

{{APIRef("WebRTC")}}{{Deprecated_Inline}}{{Non-standard_Inline}}

Sự kiện lỗi thời **`removestream`** của giao diện {{domxref("RTCPeerConnection")}} được gửi khi một {{domxref("MediaStream")}} bị xóa khỏi kết nối.
Thay vì lắng nghe sự kiện lỗi thời này, bạn nên lắng nghe các sự kiện {{domxref("MediaStream.removetrack_event", "removetrack")}} trên từng luồng.

## Cú pháp

```js-nolint
addEventListener("removestream", (event) => { })

onremovestream = (event) => { }
```

## Loại sự kiện

Một {{domxref("MediaStreamEvent")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
