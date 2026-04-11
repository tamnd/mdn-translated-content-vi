---
title: "RTCPeerConnection: sự kiện track"
short-title: track
slug: Web/API/RTCPeerConnection/track_event
page-type: web-api-event
browser-compat: api.RTCPeerConnection.track_event
---

{{APIRef("WebRTC")}}

Sự kiện **`track`** của giao diện {{domxref("RTCPeerConnection")}} được gửi sau khi một track mới được thêm vào một trong các thể hiện {{domxref("RTCRtpReceiver")}} tạo nên kết nối.

## Cú pháp

```js-nolint
addEventListener("track", (event) => { })

ontrack = (event) => { }
```

## Loại sự kiện

Một {{domxref("RTCTrackEvent")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
