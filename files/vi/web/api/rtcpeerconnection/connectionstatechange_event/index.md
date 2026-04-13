---
title: "RTCPeerConnection: sự kiện connectionstatechange"
short-title: connectionstatechange
slug: Web/API/RTCPeerConnection/connectionstatechange_event
page-type: web-api-event
browser-compat: api.RTCPeerConnection.connectionstatechange_event
---

{{APIRef("WebRTC")}}

Sự kiện **`connectionstatechange`** của giao diện {{domxref("RTCPeerConnection")}} được gửi khi trạng thái kết nối tổng thể của `RTCPeerConnection` thay đổi.

## Cú pháp

```js-nolint
addEventListener("connectionstatechange", (event) => { })

onconnectionstatechange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
pc.addEventListener("connectionstatechange", () => {
  console.log(pc.connectionState);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
