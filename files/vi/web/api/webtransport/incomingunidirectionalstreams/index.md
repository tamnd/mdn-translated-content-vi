---
title: "WebTransport: thuộc tính incomingUnidirectionalStreams"
short-title: incomingUnidirectionalStreams
slug: Web/API/WebTransport/incomingUnidirectionalStreams
page-type: web-api-instance-property
browser-compat: api.WebTransport.incomingUnidirectionalStreams
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`incomingUnidirectionalStreams`** của giao diện {{domxref("WebTransport")}} đại diện cho một hoặc nhiều luồng một chiều do máy chủ mở. Nó trả về một {{domxref("ReadableStream")}} của các đối tượng {{domxref("WebTransportReceiveStream")}}. Mỗi đối tượng có thể được dùng để đọc dữ liệu từ máy chủ một cách đáng tin cậy.

"Đáng tin cậy" có nghĩa là việc truyền và thứ tự dữ liệu được bảo đảm. Điều này mang lại khả năng phân phối chậm hơn (dù vẫn nhanh hơn WebSockets) so với {{domxref("WebTransport.datagrams", "datagrams")}}, nhưng cần thiết trong các tình huống mà độ tin cậy và thứ tự là quan trọng, như ứng dụng chat.

## Giá trị

Một {{domxref("ReadableStream")}} của các đối tượng {{domxref("WebTransportReceiveStream")}}.

## Ví dụ

Một hàm ban đầu được dùng để đọc các đối tượng {{domxref("WebTransportReceiveStream")}} từ {{domxref("ReadableStream")}}. Mỗi object sau đó được chuyển cho một hàm khác để đọc từ các luồng đó.

```js
async function receiveUnidirectional() {
  const uds = transport.incomingUnidirectionalStreams;
  const reader = uds.getReader();
  while (true) {
    const { done, value } = await reader.read();
    if (done) {
      break;
    }
    // value là một thể hiện của WebTransportReceiveStream
    await readData(value);
  }
}

async function readData(receiveStream) {
  const reader = receiveStream.getReader();
  while (true) {
    const { done, value } = await reader.read();
    if (done) {
      break;
    }
    // value là một Uint8Array
    console.log(value);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng WebTransport](https://developer.chrome.com/docs/capabilities/web-apis/webtransport)
- {{domxref("WebSockets API", "WebSockets API", "", "nocode")}}
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
