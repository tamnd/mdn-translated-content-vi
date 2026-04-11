---
title: "RTCPeerConnection: sự kiện datachannel"
short-title: datachannel
slug: Web/API/RTCPeerConnection/datachannel_event
page-type: web-api-event
browser-compat: api.RTCPeerConnection.datachannel_event
---

{{APIRef("WebRTC")}}

Sự kiện **`datachannel`** của giao diện {{domxref("RTCPeerConnection")}} được gửi khi máy ngang hàng từ xa thêm một {{domxref("RTCDataChannel")}} vào kết nối.

## Cú pháp

```js-nolint
addEventListener("datachannel", (event) => { })

ondatachannel = (event) => { }
```

## Loại sự kiện

Một {{domxref("RTCDataChannelEvent")}}.

## Ví dụ

```js
pc.ondatachannel = (event) => {
  const channel = event.channel;
  console.log(channel.label);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
