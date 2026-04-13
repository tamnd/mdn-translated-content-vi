---
title: "ReadableByteStreamController: thuộc tính byobRequest"
short-title: byobRequest
slug: Web/API/ReadableByteStreamController/byobRequest
page-type: web-api-instance-property
browser-compat: api.ReadableByteStreamController.byobRequest
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`byobRequest`** của giao diện {{domxref("ReadableByteStreamController")}} trả về yêu cầu BYOB hiện tại, hoặc `null` nếu không có yêu cầu nào đang chờ.

Nguồn byte bên dưới nên kiểm tra thuộc tính này và dùng nó để ghi dữ liệu vào stream nếu nó tồn tại (thay vì dùng {{domxref("ReadableByteStreamController.enqueue()")}}).
Điều này sẽ dẫn đến việc truyền zero-byte hiệu quả của dữ liệu đến consumer.

## Giá trị

Một đối tượng {{domxref("ReadableStreamBYOBRequest")}}, hoặc `null`.

## Ví dụ

Ví dụ trong [Sử dụng readable byte streams > Tạo readable socket push byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams#creating_a_readable_socket_push_byte_stream) cho thấy cách bạn dùng `byobRequest` để truyền dữ liệu (nếu nó tồn tại), hoặc ngược lại sao chép dữ liệu vào các hàng đợi nội bộ của stream bằng {{domxref("ReadableByteStreamController.enqueue()")}}.

Mã liên quan được tái tạo dưới đây.
Nếu `byobRequest` tồn tại, dữ liệu được đọc vào {{domxref("ReadableStreamBYOBRequest.view","controller.byobRequest.view")}}, và sau đó {{domxref("ReadableStreamBYOBRequest.respond()")}} được gọi để báo hiệu lượng dữ liệu sẵn sàng truyền.

```js
if (controller.byobRequest) {
  const v = controller.byobRequest.view;
  bytesRead = socket.readInto(v.buffer, v.byteOffset, v.byteLength);
  if (bytesRead === 0) {
    controller.close();
  }
  controller.byobRequest.respond(bytesRead);
} else {
  // Write to data using enqueue().
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
- {{domxref("ReadableByteStreamController")}}
