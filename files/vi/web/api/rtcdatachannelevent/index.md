---
title: RTCDataChannelEvent
slug: Web/API/RTCDataChannelEvent
page-type: web-api-interface
browser-compat: api.RTCDataChannelEvent
---

{{APIRef("WebRTC")}}

Giao diện **`RTCDataChannelEvent`** đại diện cho một sự kiện liên quan đến một {{DOMxRef("RTCDataChannel")}} cụ thể.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{DOMxRef("RTCDataChannelEvent.RTCDataChannelEvent", "RTCDataChannelEvent()")}}
  - : Tạo một `RTCDataChannelEvent` mới.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ {{DOMxRef("Event")}}._

- {{DOMxRef("RTCDataChannelEvent.channel", "channel")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("RTCDataChannel")}} liên kết với sự kiện.

## Ví dụ

Trong ví dụ này, trình xử lý sự kiện `datachannel` được thiết lập để lưu tham chiếu kênh dữ liệu và thiết lập các trình xử lý cho các sự kiện cần được theo dõi. Thuộc tính {{domxref("RTCDataChannelEvent.channel", "channel")}} cung cấp {{domxref("RTCDataChannel")}} đại diện cho kết nối đến peer khác.

```js
pc.ondatachannel = (event) => {
  inboundDataChannel = event.channel;
  inboundDataChannel.onmessage = handleIncomingMessage;
  inboundDataChannel.onopen = handleChannelOpen;
  inboundDataChannel.onclose = handleChannelClose;
};
```

Xem [Mẫu RTCDataChannel đơn giản](/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample) để biết ví dụ hoàn chỉnh hơn về cách sử dụng kênh dữ liệu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCDataChannel")}}
- [Mẫu RTCDataChannel đơn giản](/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample)
- {{domxref("RTCPeerConnection")}} (giao diện mục tiêu cho các sự kiện {{DOMxRef("RTCPeerConnection.datachannel_event", "datachannel")}})
