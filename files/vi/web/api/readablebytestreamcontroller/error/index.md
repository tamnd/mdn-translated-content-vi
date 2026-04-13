---
title: "ReadableByteStreamController: phương thức error()"
short-title: error()
slug: Web/API/ReadableByteStreamController/error
page-type: web-api-instance-method
browser-compat: api.ReadableByteStreamController.error
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`error()`** của giao diện {{domxref("ReadableByteStreamController")}} khiến bất kỳ tương tác nào trong tương lai với stream liên quan gặp lỗi với lý do được chỉ định.

Phương thức này thường được nguồn bên dưới gọi để hiển thị lỗi từ giao diện nơi nó lấy dữ liệu (chẳng hạn như lỗi đọc tập tin hoặc lỗi socket).
Nó cũng có thể được gọi từ nơi khác để kích hoạt lỗi stream, ví dụ nếu một phần khác của hệ thống mà stream phụ thuộc vào bị lỗi.

## Cú pháp

```js-nolint
error(errorObject)
```

### Tham số

- `errorObject`
  - : Bất kỳ đối tượng nào mà bạn muốn các tương tác trong tương lai thất bại cùng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu đối tượng nguồn không phải là `ReadableByteStreamController`, hoặc stream không thể đọc vì lý do nào đó.

## Ví dụ

Ví dụ trong [Sử dụng readable byte streams > Tạo readable socket push byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams#creating_a_readable_socket_push_byte_stream) cho thấy cách bạn có thể dùng `error()` để kích hoạt lỗi stream thủ công nếu một phần khác của hệ thống mà nó phụ thuộc vào bị lỗi.

Cụ thể, phương thức `start()` của nguồn bên dưới gọi `readRepeatedly()` để thực hiện tất cả các thao tác thiết lập và thực hiện yêu cầu dữ liệu.
Hàm này trả về một promise.
Nếu có bất kỳ lỗi nào được ném ra khi đọc dữ liệu, chúng sẽ được bắt bởi hàm `catch()` được nối vào.
Trong `catch()`, chúng ta gọi `error()` trên controller, truyền lý do từ nguồn bên dưới.

```js
function start(controller) {
  readRepeatedly().catch((e) => controller.error(e));
}

function readRepeatedly() {
  return socket.select2().then(() => {
    // …
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
