---
title: "WebTransport: phương thức createUnidirectionalStream()"
short-title: createUnidirectionalStream()
slug: Web/API/WebTransport/createUnidirectionalStream
page-type: web-api-instance-method
browser-compat: api.WebTransport.createUnidirectionalStream
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Phương thức **`createUnidirectionalStream()`** của giao diện {{domxref("WebTransport")}} mở bất đồng bộ một luồng một chiều.

Phương thức trả về một {{jsxref("Promise")}} được giải quyết thành một đối tượng {{domxref("WritableStream")}}, có thể dùng để ghi dữ liệu một cách đáng tin cậy tới máy chủ.

<!-- Note, returns a `WebTransportSendStream` according to spec, but not yet implemented -->

"Đáng tin cậy" có nghĩa là việc truyền và thứ tự dữ liệu được bảo đảm. Điều này mang lại khả năng phân phối chậm hơn (dù vẫn nhanh hơn WebSockets) so với {{domxref("WebTransport.datagrams", "datagrams")}}, nhưng cần thiết trong các tình huống mà độ tin cậy và thứ tự là quan trọng, như ứng dụng chat.

Thứ tự tương đối mà các byte đang xếp hàng trong các luồng được tạo được xả có thể được chỉ định bằng tùy chọn `sendOrder`.
Nếu được đặt, các byte đang xếp hàng trong các luồng có `sendOrder` cao hơn sẽ được gửi trước các byte đang xếp hàng cho các luồng có `sendOrder` thấp hơn.
Nếu số thứ tự không được đặt, thứ tự gửi byte phụ thuộc vào triển khai.
Lưu ý rằng ngay cả khi byte từ các luồng có send order cao hơn được gửi trước, chúng vẫn có thể không đến trước.

## Cú pháp

```js-nolint
createUnidirectionalStream()
createUnidirectionalStream(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một object có thể có các thuộc tính sau:
    - `sendOrder` {{optional_inline}}
      - : Một giá trị số nguyên chỉ định độ ưu tiên gửi của luồng này so với các luồng khác có giá trị này được đặt.
        Các byte đang xếp hàng được gửi trước cho các luồng có giá trị cao hơn.
        Nếu không đặt, thứ tự gửi phụ thuộc vào triển khai.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành một đối tượng `WebTransportSendStream` (đây là một {{domxref("WritableStream")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `createUnidirectionalStream()` được gọi trong khi WebTransport đang đóng hoặc đã thất bại.

## Ví dụ

Dùng phương thức `createUnidirectionalStream()` để lấy tham chiếu tới một {{domxref("WritableStream")}}. Từ đó bạn có thể {{domxref("WritableStream.getWriter", "get a writer", "", "nocode")}} để cho phép dữ liệu được ghi vào luồng và gửi tới máy chủ.

Dùng phương thức {{domxref("WritableStreamDefaultWriter.close", "close()")}} của {{domxref("WritableStreamDefaultWriter")}} kết quả để đóng kết nối HTTP/3 liên quan. Trình duyệt cố gửi mọi dữ liệu đang chờ trước khi thực sự đóng kết nối liên quan.

```js
async function writeData() {
  const stream = await transport.createUnidirectionalStream({
    sendOrder: "596996858",
  });
  const writer = stream.getWriter();
  const data1 = new Uint8Array([65, 66, 67]);
  const data2 = new Uint8Array([68, 69, 70]);
  writer.write(data1);
  writer.write(data2);

  try {
    await writer.close();
    console.log("Tất cả dữ liệu đã được gửi.");
  } catch (error) {
    console.error(`Đã xảy ra lỗi: ${error}`);
  }
}
```

Bạn cũng có thể dùng {{domxref("WritableStreamDefaultWriter.abort()")}} để chấm dứt luồng đột ngột. Khi dùng `abort()`, trình duyệt có thể bỏ qua bất kỳ dữ liệu nào đang chờ chưa được gửi.

```js
// …

const stream = await transport.createUnidirectionalStream();
const writer = stream.getWriter();

// …

writer.write(data1);
writer.write(data2);
await writer.abort();
// Không phải toàn bộ dữ liệu có thể đã được ghi.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng WebTransport](https://developer.chrome.com/docs/capabilities/web-apis/webtransport)
- {{domxref("WebTransport.createBidirectionalStream()")}}
- {{domxref("WebSockets API", "WebSockets API", "", "nocode")}}
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
