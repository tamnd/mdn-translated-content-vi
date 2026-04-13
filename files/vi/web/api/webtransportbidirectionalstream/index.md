---
title: WebTransportBidirectionalStream
slug: Web/API/WebTransportBidirectionalStream
page-type: web-api-interface
browser-compat: api.WebTransportBidirectionalStream
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Giao diện **`WebTransportBidirectionalStream`** của {{domxref("WebTransport API", "WebTransport API", "", "nocode")}} đại diện cho một luồng hai chiều được tạo bởi máy chủ hoặc máy khách có thể được sử dụng để truyền tải đáng tin cậy. Cung cấp quyền truy cập vào một {{domxref("WebTransportReceiveStream")}} để đọc dữ liệu đến và một {{domxref("WebTransportSendStream")}} để ghi dữ liệu đi.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("WebTransportBidirectionalStream.readable", "readable")}} {{ReadOnlyInline}}
  - : Trả về một phiên bản {{domxref("WebTransportReceiveStream")}} có thể được sử dụng để đọc dữ liệu đến.
- {{domxref("WebTransportBidirectionalStream.writable", "writable")}} {{ReadOnlyInline}}
  - : Trả về một phiên bản {{domxref("WebTransportSendStream")}} có thể được sử dụng để ghi dữ liệu đi.

## Ví dụ

### Truyền hai chiều được khởi tạo bởi user agent

Để mở một luồng hai chiều từ một user agent, bạn sử dụng phương thức {{domxref("WebTransport.createBidirectionalStream()")}} để lấy tham chiếu đến một `WebTransportBidirectionalStream`. Các thuộc tính `readable` và `writable` trả về các tham chiếu đến các phiên bản `WebTransportReceiveStream` và `WebTransportSendStream`. Chúng kế thừa từ `ReadableStream` và `WritableStream` tương ứng, và có thể được sử dụng để đọc từ và ghi vào máy chủ.

```js
async function setUpBidirectional() {
  const stream = await transport.createBidirectionalStream();
  // stream is a WebTransportBidirectionalStream
  // stream.readable is a WebTransportReceiveStream
  const readable = stream.readable;
  // stream.writable is a WebTransportSendStream
  const writable = stream.writable;

  // …
}
```

Đọc từ `WebTransportReceiveStream` có thể được thực hiện theo cách tương tự như bạn đọc một `ReadableStream`:

```js
async function readData(readable) {
  const reader = readable.getReader();
  while (true) {
    const { value, done } = await reader.read();
    if (done) {
      break;
    }
    // value is a Uint8Array.
    console.log(value);
  }
}
```

Và ghi vào `WebTransportSendStream` có thể được thực hiện như sau:

```js
async function writeData(writable) {
  const writer = writable.getWriter();
  const data1 = new Uint8Array([65, 66, 67]);
  const data2 = new Uint8Array([68, 69, 70]);
  writer.write(data1);
  writer.write(data2);
}
```

### Truyền hai chiều được khởi tạo bởi máy chủ

Nếu máy chủ mở một luồng hai chiều để truyền dữ liệu đến và nhận từ máy khách, điều này có thể được truy cập qua thuộc tính {{domxref("WebTransport.incomingBidirectionalStreams")}}, trả về một {{domxref("ReadableStream")}} của các đối tượng `WebTransportBidirectionalStream`. Mỗi cái có thể được sử dụng để đọc và ghi các phiên bản {{jsxref("Uint8Array")}} như được hiển thị ở trên. Tuy nhiên, bạn cần một hàm ban đầu để đọc luồng hai chiều:

```js
async function receiveBidirectional() {
  const bds = transport.incomingBidirectionalStreams;
  const reader = bds.getReader();
  while (true) {
    const { done, value } = await reader.read();
    if (done) {
      break;
    }
    // value is an instance of WebTransportBidirectionalStream
    await readData(value.readable);
    await writeData(value.writable);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebTransport](https://developer.chrome.com/docs/capabilities/web-apis/webtransport)
- {{domxref("WebSockets API", "WebSockets API", "", "nocode")}}
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
