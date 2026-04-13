---
title: "RTCDataChannel: thuộc tính giao thức"
short-title: protocol
slug: Web/API/RTCDataChannel/protocol
page-type: web-api-instance-property
browser-compat: api.RTCDataChannel.protocol
---

{{APIRef("WebRTC")}}

Thuộc tính `RTCDataChannel` chỉ đọc
**`protocol`** trả về một chuỗi chứa
tên của giao thức con đang được sử dụng. Nếu không có giao thức nào được chỉ định khi kênh dữ liệu được
được tạo thì giá trị của thuộc tính này là chuỗi trống (`""`).

> [!LƯU Ý]
> Các giá trị được phép của thuộc tính này được xác định bởi trang web hoặc ứng dụng bằng cách sử dụng
> kênh dữ liệu.

Khả năng mỗi kênh có một giao thức con được xác định cho phép ứng dụng của bạn, ví dụ:
sử dụng các đối tượng JSON làm tin nhắn trên một kênh trong khi kênh khác là văn bản gốc và
cái khác là nhị phân thô hoặc thậm chí một số định dạng khác.


## Giá trị

Một chuỗi xác định giao thức con do ứng dụng xác định đang được sử dụng để trao đổi dữ liệu trên
kênh. Nếu chưa có chuỗi nào được thiết lập thì đây là một chuỗi trống ("").


## Ví dụ

```js
const pc = new RTCPeerConnection();
const dc = pc.createDataChannel("my channel", {
  protocol: "json",
});

function handleChannelMessage(dataChannel, msg) {
  switch (dataChannel.protocol) {
    case "json":
      /* process JSON data */
      break;
    case "raw":
      /* process raw binary data */
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
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCPeerConnection.createDataChannel()")}}
