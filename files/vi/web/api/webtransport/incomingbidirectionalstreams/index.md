---
title: "WebTransport: thuộc tính incomingBidirectionalStreams"
short-title: incomingBidirectionalStreams
slug: Web/API/WebTransport/incomingBidirectionalStreams
page-type: web-api-instance-property
browser-compat: api.WebTransport.incomingBidirectionalStreams
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`incomingBidirectionalStreams`** của giao diện {{domxref("WebTransport")}} đại diện cho một hoặc nhiều luồng hai chiều do máy chủ mở. Nó trả về một {{domxref("ReadableStream")}} của các đối tượng {{domxref("WebTransportBidirectionalStream")}}. Mỗi đối tượng có thể được dùng để đọc dữ liệu từ máy chủ một cách đáng tin cậy và ghi dữ liệu trở lại máy chủ.

"Đáng tin cậy" có nghĩa là việc truyền và thứ tự dữ liệu được bảo đảm. Điều này mang lại khả năng phân phối chậm hơn (dù vẫn nhanh hơn WebSockets) so với {{domxref("WebTransport.datagrams", "datagrams")}}, nhưng cần thiết trong các tình huống mà độ tin cậy và thứ tự là quan trọng, như ứng dụng chat.

## Giá trị

Một {{domxref("ReadableStream")}} của các đối tượng {{domxref("WebTransportBidirectionalStream")}}.

## Ví dụ

Một hàm ban đầu được dùng để đọc các đối tượng {{domxref("WebTransportBidirectionalStream")}} từ {{domxref("ReadableStream")}}. Với mỗi đối tượng, các giá trị {{domxref("WebTransportBidirectionalStream.readable")}} và {{domxref("WebTransportBidirectionalStream.writable")}} được chuyển cho các hàm khác để đọc từ và ghi vào các luồng đó.

```js
async function receiveBidirectional() {
  const bds = transport.incomingBidirectionalStreams;
  const reader = bds.getReader();
  while (true) {
    const { done, value } = await reader.read();
    if (done) {
      break;
    }
    // value là một thể hiện của WebTransportBidirectionalStream
    await readData(value.readable);
    await writeData(value.writable);
  }
}

async function readData(readable) {
  const reader = readable.getReader();
  while (true) {
    const { value, done } = await reader.read();
    if (done) {
      break;
    }
    // value là một Uint8Array.
    console.log(value);
  }
}

async function writeData(writable) {
  const writer = writable.getWriter();
  const data1 = new Uint8Array([65, 66, 67]);
  const data2 = new Uint8Array([68, 69, 70]);
  writer.write(data1);
  writer.write(data2);
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
