---
title: "RTCDataChannel: thuộc tính ReadyState"
short-title: readyState
slug: Web/API/RTCDataChannel/readyState
page-type: web-api-instance-property
browser-compat: api.RTCDataChannel.readyState
---

{{APIRef("WebRTC")}}

Thuộc tính `RTCDataChannel` chỉ đọc **`readyState`** trả về một chuỗi cho biết trạng thái kết nối dữ liệu cơ bản của kênh dữ liệu.


## Giá trị

Một chuỗi biểu thị trạng thái hiện tại của quá trình truyền dữ liệu cơ bản, là một trong các giá trị sau:

- `connecting`
  - : Tác nhân người dùng (trình duyệt) đang trong quá trình tạo vận chuyển dữ liệu cơ bản;
    đây là trạng thái của {{domxref("RTCDataChannel")}} mới sau khi được tạo bởi {{domxref("RTCPeerConnection.createDataChannel()")}},
    trên thiết bị ngang hàng đã bắt đầu quá trình kết nối.
- `open`
  - : Việc vận chuyển dữ liệu cơ bản đã được thiết lập
    và dữ liệu có thể được truyền hai chiều qua nó.
    Đây là trạng thái mặc định của {{domxref("RTCDataChannel")}} mới được tạo bởi lớp WebRTC
    khi máy ngang hàng từ xa tạo kênh
    và gửi nó đến trang web hoặc ứng dụng
    trong sự kiện {{DOMxRef("RTCPeerConnection.datachannel_event", "datachannel")}}.
- `closing`
  - : Quá trình đóng vận chuyển dữ liệu cơ bản đã bắt đầu.
    Không thể xếp hàng đợi tin nhắn mới được gửi nữa,
    nhưng các tin nhắn đã xếp hàng trước đó vẫn có thể được gửi hoặc nhận
    trước khi vào trạng thái `closed`.
- `closed`
  - : Quá trình vận chuyển dữ liệu cơ bản đã đóng,
    hoặc nỗ lực thực hiện kết nối không thành công.


## Ví dụ

```js
const dataChannel = peerConnection.createDataChannel("File Transfer");
const sendQueue = [];

function sendMessage(msg) {
  switch (dataChannel.readyState) {
    case "connecting":
      console.log(`Connection not open; queueing: ${msg}`);
      sendQueue.push(msg);
      break;
    case "open":
      sendQueue.forEach((msg) => dataChannel.send(msg));
      break;
    case "closing":
      console.log(`Attempted to send message while closing: ${msg}`);
      break;
    case "closed":
      console.log("Error! Attempt to send while connection closed.");
      break;
  }
}

```

## Thông số kỹ thuật


{{Specifications}}


## Khả năng tương thích của trình duyệt

{{Compat}}


## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Sử dụng kênh dữ liệu WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_data_channels)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCPeerConnection.createDataChannel()")}}
