---
title: "MediaStreamEvent: thuộc tính stream"
short-title: stream
slug: Web/API/MediaStreamEvent/stream
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.MediaStreamEvent.stream
---

{{APIRef("WebRTC")}}{{deprecated_header}}{{Non-standard_header}}

Thuộc tính chỉ đọc **`MediaStreamEvent.stream`** trả về {{domxref("MediaStream")}} liên quan đến sự kiện.

## Ví dụ

```js
pc.onaddstream = (ev) => {
  alert(`A stream (id: '${ev.stream.id}') has been added to this connection.`);
};
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCPeerConnection.addstream_event", "addstream")}}, {{domxref("RTCPeerConnection.removestream_event", "removestream")}}
- {{domxref("RTCPeerConnection")}}
