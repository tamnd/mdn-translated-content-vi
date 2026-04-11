---
title: "RTCDataChannel: thuộc tính kiểu nhị phân"
short-title: binaryType
slug: Web/API/RTCDataChannel/binaryType
page-type: web-api-instance-property
browser-compat: api.RTCDataChannel.binaryType
---

{{APIRef("WebRTC")}}

Thuộc tính **`binaryType`** trên
Giao diện {{domxref("RTCDataChannel")}} là một chuỗi chỉ định
loại đối tượng nên được sử dụng để thể hiện dữ liệu nhị phân nhận được
trên {{domxref("RTCDataChannel")}}. Giá trị cho phép của
Thuộc tính {{domxref("WebSocket.binaryType")}} cũng được phép ở đây:
`blob` nếu đối tượng {{domxref("Blob")}} đang được sử dụng hoặc
`arraybuffer` nếu đối tượng {{jsxref("ArrayBuffer")}} đang được sử dụng. các
mặc định là `arraybuffer`.

Khi nhận được một tin nhắn nhị phân trên kênh dữ liệu, kết quả
Thuộc tính {{domxref("MessageEvent.data")}} của sự kiện {{DOMxRef("RTCDataChannel.message_event", "message")}} là một đối tượng của
loại được chỉ định bởi `binaryType`.

## Giá trị

Một chuỗi có thể có một trong các giá trị sau:

- `"blob"`
  - : Nội dung của tin nhắn nhị phân nhận được sẽ được chứa trong đối tượng {{domxref("Blob")}}.
- `"arraybuffer"`
  - : Nội dung của tin nhắn nhị phân đã nhận sẽ được chứa trong {{jsxref("ArrayBuffer")}}
    đồ vật.

## Ví dụ

Mã này cấu hình kênh dữ liệu để nhận dữ liệu nhị phân trong
{{jsxref("ArrayBuffer")}} đối tượng và thiết lập trình nghe cho {{DOMxRef("RTCDataChannel.message_event", "message")}}
các sự kiện xây dựng một chuỗi biểu diễn dữ liệu nhận được dưới dạng danh sách thập lục phân
các giá trị byte.

```js
const dc = peerConnection.createDataChannel("Binary");
dc.binaryType = "arraybuffer";

dc.onmessage = (event) => {
  const byteArray = new Uint8Array(event.data);
  let hexString = "";

  byteArray.forEach((byte) => {
    hexString += `${byte.toString(16)} `;
  });
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Sử dụng kênh dữ liệu WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_data_channels)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCDataChannel.send()")}}
