---
title: "ReadableByteStreamController: phương thức close()"
short-title: close()
slug: Web/API/ReadableByteStreamController/close
page-type: web-api-instance-method
browser-compat: api.ReadableByteStreamController.close
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`close()`** của giao diện {{domxref("ReadableByteStreamController")}} đóng stream liên quan.

Phương thức này có thể được nguồn bên dưới gọi khi nguồn dữ liệu của nó đã cạn kiệt/hoàn thành.

> [!NOTE]
> Reader vẫn có thể đọc bất kỳ chunk nào đã được xếp hàng từ stream, nhưng khi đã đọc hết, stream sẽ trở thành trạng thái đóng.
> Tuy nhiên, nếu có {{domxref("ReadableByteStreamController.byobRequest","byobRequest")}} chưa hoàn chỉnh khi `close()` được gọi, stream sẽ gặp lỗi.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu đối tượng nguồn không phải là `ReadableByteStreamController`, nó đã được đóng, hoặc stream không thể đọc vì lý do nào đó.

## Ví dụ

Ví dụ trong [Sử dụng readable byte streams > Tạo readable socket push byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams#creating_a_readable_socket_push_byte_stream) cho thấy cách chúng ta có thể đóng stream khi không còn dữ liệu.

Mã liên quan được tái tạo dưới đây.
Điều này dựa trên phương thức `readInto()` giả định chỉ trả về 0 byte khi không còn dữ liệu.

```js
bytesRead = socket.readInto(v.buffer, v.byteOffset, v.byteLength);
if (bytesRead === 0) {
  controller.close();
}
```

Sau khi gọi close, stream sẽ được đóng và bất kỳ consumer nào sẽ được thông báo.
Ví dụ nếu dùng {{domxref("ReadableStreamBYOBReader")}}, bất kỳ yêu cầu {{domxref("ReadableStreamBYOBReader.read()","read()")}} nào sẽ giải quyết với `done: true` và promise từ {{domxref("ReadableStreamBYOBReader.closed")}} cũng sẽ được giải quyết.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
- {{domxref("ReadableByteStreamController")}}
