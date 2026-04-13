---
title: "RTCDataChannelEvent: thuộc tính channel"
short-title: channel
slug: Web/API/RTCDataChannelEvent/channel
page-type: web-api-instance-property
browser-compat: api.RTCDataChannelEvent.channel
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`RTCDataChannelEvent.channel`** trả về {{domxref("RTCDataChannel")}} liên kết với sự kiện.

## Giá trị

Một đối tượng {{domxref("RTCDataChannel")}} đại diện cho kênh dữ liệu liên kết {{domxref("RTCPeerConnection")}} nhận với peer từ xa của nó.

## Ví dụ

Dòng đầu tiên của mã trong trình xử lý sự kiện {{DOMxRef("RTCPeerConnection.datachannel_event", "datachannel")}} hiển thị bên dưới lấy kênh từ đối tượng sự kiện và lưu nó cục bộ để sử dụng bởi mã xử lý lưu lượng dữ liệu.

```js
pc.ondatachannel = (event) => {
  inboundDataChannel = event.channel;
  inboundDataChannel.onmessage = handleIncomingMessage;
  inboundDataChannel.onopen = handleChannelOpen;
  inboundDataChannel.onclose = handleChannelClose;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("RTCPeerConnection.datachannel_event", "datachannel")}}
- {{domxref("RTCDataChannel")}}
- [Mẫu RTCDataChannel đơn giản](/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample)
- {{domxref("RTCPeerConnection")}}
