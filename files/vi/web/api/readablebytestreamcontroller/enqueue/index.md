---
title: "ReadableByteStreamController: phương thức enqueue()"
short-title: enqueue()
slug: Web/API/ReadableByteStreamController/enqueue
page-type: web-api-instance-method
browser-compat: api.ReadableByteStreamController.enqueue
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`enqueue()`** của giao diện {{domxref("ReadableByteStreamController")}} xếp hàng một chunk đã cho trong readable byte stream liên quan (chunk được chuyển vào các hàng đợi nội bộ của stream).

Chỉ nên dùng phương thức này để truyền dữ liệu vào hàng đợi khi {{domxref("ReadableByteStreamController.byobRequest","byobRequest")}} là `null`.

## Cú pháp

```js-nolint
enqueue(chunk)
```

### Tham số

- `chunk`
  - : Chunk cần xếp hàng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu đối tượng nguồn không phải là `ReadableByteStreamController`, hoặc stream không thể đọc vì lý do nào đó, hoặc chunk không phải là đối tượng, hoặc array buffer nội bộ của chunk không tồn tại, có độ dài bằng không, hoặc đã bị tách ra.
    Nó cũng được ném ra nếu stream đã được đóng.

## Ví dụ

Ví dụ trong [Sử dụng readable byte streams > Tạo readable socket push byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams#creating_a_readable_socket_push_byte_stream) cho thấy cách bạn có thể dùng `enqueue()` để sao chép dữ liệu vào stream nếu không có {{domxref("ReadableByteStreamController.byobRequest","byobRequest")}} nào đang chờ.
Nếu có `byobRequest` thì nên sử dụng nó!

Mã dưới đây cho thấy dữ liệu được đọc vào một `ArrayBuffer` bằng cách dùng phương thức `socket.readInto()` "giả định" và sau đó được xếp hàng (nhưng chỉ khi dữ liệu thực sự được sao chép):

```js
const buffer = new ArrayBuffer(DEFAULT_CHUNK_SIZE);
bytesRead = socket.readInto(buffer, 0, DEFAULT_CHUNK_SIZE);
if (bytesRead === 0) {
  controller.close();
} else {
  controller.enqueue(new Uint8Array(buffer, 0, bytesRead));
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
- {{domxref("ReadableByteStreamController")}}
