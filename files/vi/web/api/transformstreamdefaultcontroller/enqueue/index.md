---
title: "TransformStreamDefaultController: enqueue() method"
short-title: enqueue()
slug: Web/API/TransformStreamDefaultController/enqueue
page-type: web-api-instance-method
browser-compat: api.TransformStreamDefaultController.enqueue
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`enqueue()`** của giao diện {{domxref("TransformStreamDefaultController")}} xếp hàng chunk đã cho vào phía có thể đọc của luồng.

Để biết thêm thông tin về luồng có thể đọc và các chunk, xem [Sử dụng luồng có thể đọc](/en-US/docs/Web/API/Streams_API/Using_readable_streams).

## Cú pháp

```js-nolint
enqueue(chunk)
```

### Tham số

- `chunk`
  - : Chunk đang được xếp hàng. Một chunk là một mảnh dữ liệu đơn. Nó có thể là bất kỳ loại dữ liệu nào và một luồng có thể chứa các chunk thuộc các loại khác nhau.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Luồng không có thể đọc. Điều này có thể xảy ra nếu luồng bị báo lỗi qua `controller.error()`, hoặc khi nó bị đóng mà không bao giờ gọi phương thức `controller.close()` của bộ điều khiển.

## Ví dụ

Trong ví dụ này, một chunk đã mã hóa được truyền vào hàng đợi sử dụng phương thức `enqueue()`.

```js
const textEncoderStream = new TransformStream({
  transform(chunk, controller) {
    controller.enqueue(new TextEncoder().encode(chunk));
  },
  flush(controller) {
    controller.terminate();
  },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
