---
title: "RTCPeerConnection: sự kiện icecandidate"
short-title: icecandidate
slug: Web/API/RTCPeerConnection/icecandidate_event
page-type: web-api-event
browser-compat: api.RTCPeerConnection.icecandidate_event
---

{{APIRef("WebRTC")}}

Sự kiện **`icecandidate`** của giao diện {{domxref("RTCPeerConnection")}} được gửi để yêu cầu candidate được chỉ định được truyền tới máy ngang hàng từ xa.

## Cú pháp

```js-nolint
addEventListener("icecandidate", (event) => { })

onicecandidate = (event) => { }
```

## Loại sự kiện

Một {{domxref("RTCPeerConnectionIceEvent")}}.

## Ví dụ

```js
pc.onicecandidate = (event) => {
  if (event.candidate) {
    sendCandidateToPeer(event.candidate);
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
