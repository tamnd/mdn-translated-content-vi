---
title: "RTCPeerConnection: sự kiện icecandidateerror"
short-title: icecandidateerror
slug: Web/API/RTCPeerConnection/icecandidateerror_event
page-type: web-api-event
browser-compat: api.RTCPeerConnection.icecandidateerror_event
---

{{APIRef("WebRTC")}}

Sự kiện **`icecandidateerror`** của giao diện {{domxref("RTCPeerConnection")}} được gửi tới kết nối nếu xảy ra lỗi trong quá trình thu thập {{Glossary("ICE")}} candidate.
Sự kiện này mô tả lỗi.

## Cú pháp

```js-nolint
addEventListener("icecandidateerror", (event) => { })

onicecandidateerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("RTCPeerConnectionIceErrorEvent")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
