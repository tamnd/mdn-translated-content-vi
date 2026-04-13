---
title: "RTCPeerConnection: sự kiện negotiationneeded"
short-title: negotiationneeded
slug: Web/API/RTCPeerConnection/negotiationneeded_event
page-type: web-api-event
browser-compat: api.RTCPeerConnection.negotiationneeded_event
---

{{APIRef("WebRTC")}}

Sự kiện **`negotiationneeded`** của giao diện {{domxref("RTCPeerConnection")}} được gửi khi cần thực hiện thương lượng hoặc thương lượng lại kết nối {{Glossary("ICE")}}.
Việc này có thể xảy ra khi mở kết nối lần đầu cũng như khi cần thích ứng với điều kiện mạng thay đổi.
Bên nhận nên phản hồi bằng cách tạo một offer và gửi nó tới máy ngang hàng còn lại.

## Cú pháp

```js-nolint
addEventListener("negotiationneeded", (event) => { })

onnegotiationneeded = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
