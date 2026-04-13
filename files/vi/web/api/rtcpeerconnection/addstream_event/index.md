---
title: "RTCPeerConnection: sự kiện addstream"
short-title: addstream
slug: Web/API/RTCPeerConnection/addstream_event
page-type: web-api-event
status:
  - deprecated
  - non-standard
browser-compat: api.RTCPeerConnection.addstream_event
---

{{APIRef("WebRTC")}}{{Deprecated_Inline}}{{Non-standard_Inline}}

Sự kiện lỗi thời **`addstream`** của giao diện {{domxref("RTCPeerConnection")}} được gửi khi một {{domxref("MediaStream")}} mới được thêm vào kết nối.
Thay vì lắng nghe sự kiện lỗi thời này, bạn nên lắng nghe sự kiện {{domxref("RTCPeerConnection.track_event", "track")}}; một sự kiện được gửi cho mỗi {{domxref("MediaStreamTrack")}} được thêm vào kết nối.

## Cú pháp

```js-nolint
addEventListener("addstream", (event) => { })

onaddstream = (event) => { }
```

## Loại sự kiện

Một {{domxref("MediaStreamEvent")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
