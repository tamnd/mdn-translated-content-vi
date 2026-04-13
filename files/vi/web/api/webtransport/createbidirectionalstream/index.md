---
title: "WebTransport: phương thức createBidirectionalStream()"
short-title: createBidirectionalStream()
slug: Web/API/WebTransport/createBidirectionalStream
page-type: web-api-instance-method
browser-compat: api.WebTransport.createBidirectionalStream
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Phương thức **`createBidirectionalStream()`** của giao diện {{domxref("WebTransport")}} mở bất đồng bộ và trả về một luồng hai chiều.

Phương thức trả về một {{jsxref("Promise")}} được giải quyết thành một đối tượng {{domxref("WebTransportBidirectionalStream")}}, đối tượng này có các thuộc tính `readable` và `writable` có thể dùng để đọc và ghi dữ liệu tới máy chủ một cách đáng tin cậy.
"Đáng tin cậy" có nghĩa là việc truyền và thứ tự dữ liệu được bảo đảm.
Điều này mang lại khả năng phân phối chậm hơn (dù vẫn nhanh hơn WebSockets) so với {{domxref("WebTransport.datagrams", "datagrams")}}, nhưng cần thiết trong các tình huống mà độ tin cậy và thứ tự là quan trọng, như ứng dụng chat.

Thứ tự tương đối mà các byte đang xếp hàng trong các luồng được tạo được xả có thể được chỉ định bằng tùy chọn `sendOrder`.
Nếu được đặt, các byte đang xếp hàng trong các luồng có `sendOrder` cao hơn sẽ được gửi trước các byte đang xếp hàng cho các luồng có `sendOrder` thấp hơn.
Nếu số thứ tự không được đặt, thứ tự gửi byte phụ thuộc vào triển khai.
Lưu ý rằng ngay cả khi byte từ các luồng có send order cao hơn được gửi trước, chúng vẫn có thể không đến trước.

## Cú pháp

```js-nolint
createBidirectionalStream()
createBidirectionalStream(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một object có thể có các thuộc tính sau:
    - `sendOrder` {{optional_inline}}
      - : Một giá trị số nguyên chỉ định độ ưu tiên gửi của luồng này so với các luồng khác có giá trị này được đặt.
        Các byte đang xếp hàng được gửi trước cho các luồng có giá trị cao hơn.
        Nếu không đặt, thứ tự gửi phụ thuộc vào triển khai.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành một đối tượng {{domxref("WebTransportBidirectionalStream")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `createBidirectionalStream()` được gọi trong khi WebTransport đang đóng hoặc đã thất bại.

## Ví dụ

Một hàm ban đầu được dùng để lấy tham chiếu tới các thuộc tính {{domxref("WebTransportBidirectionalStream.readable")}} và {{domxref("WebTransportBidirectionalStream.writable")}}. Đây là các tham chiếu tới các thể hiện `WebTransportReceiveStream` và `WebTransportSendStream`, tức các luồng đọc và ghi có thể dùng để đọc từ và ghi tới máy chủ.

```js
async function setUpBidirectional() {
  const stream = await transport.createBidirectionalStream({
    sendOrder: "596996858",
  });
  // stream là một WebTransportBidirectionalStream
  // stream.readable là một ReadableStream
  const readable = stream.readable;
  // stream.writable là một WritableStream
  const writable = stream.writable;

  // …
}
```

Việc đọc từ `WebTransportReceiveStream` có thể được thực hiện như sau:

```js
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
```

Và việc ghi vào `WebTransportSendStream` có thể làm như sau:

```js
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
- {{domxref("WebTransport.createUnidirectionalStream()")}}
- {{domxref("WebSockets API", "WebSockets API", "", "nocode")}}
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
