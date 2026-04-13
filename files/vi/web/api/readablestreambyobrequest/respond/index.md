---
title: "ReadableStreamBYOBRequest: respond() method"
short-title: respond()
slug: Web/API/ReadableStreamBYOBRequest/respond
page-type: web-api-instance-method
browser-compat: api.ReadableStreamBYOBRequest.respond
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`respond()`** của giao diện {{domxref("ReadableStreamBYOBRequest")}} được dùng để báo hiệu cho [readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams) liên quan rằng số byte được chỉ định đã được ghi vào {{domxref("ReadableStreamBYOBRequest.view")}}.

Sau khi phương thức này được gọi, {{domxref("ReadableStreamBYOBRequest/view","view")}} sẽ được truyền và không còn có thể sửa đổi.

## Cú pháp

```js-nolint
respond(bytesWritten)
```

### Tham số

- `bytesWritten`
  - : Số byte đã được ghi vào {{domxref("ReadableStreamBYOBRequest.view")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Yêu cầu không có {{domxref("ReadableByteStreamController")}} liên quan, hoặc bộ nhớ đệm view không bị tách ra/không thể truyền được.

## Ví dụ

Code bên dưới được lấy từ các ví dụ trực tiếp trong [Sử dụng readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams).

Phương thức này được gọi bởi nguồn byte bên dưới như một phần của việc thực hiện truyền zero-copy dữ liệu để hoàn thành yêu cầu đọc đang chờ từ người tiêu thụ. Nguồn bên dưới trước tiên ghi dữ liệu vào {{domxref("ReadableStreamBYOBRequest.view")}} và sau đó gọi phương thức `respond()` này để chỉ ra _lượng_ dữ liệu được sao chép vào bộ nhớ đệm, và khiến dữ liệu được truyền đến reader.

```js
const v = controller.byobRequest.view;
bytesRead = socket.readInto(v.buffer, v.byteOffset, v.byteLength);
controller.byobRequest.respond(bytesRead);
```

Sau khi thao tác này, `byobRequest.view` bị tách ra và yêu cầu nên bị loại bỏ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
