---
title: "ReadableStreamBYOBReader: phương thức releaseLock()"
short-title: releaseLock()
slug: Web/API/ReadableStreamBYOBReader/releaseLock
page-type: web-api-instance-method
browser-compat: api.ReadableStreamBYOBReader.releaseLock
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`releaseLock()`** của giao diện {{domxref("ReadableStreamBYOBReader")}} giải phóng khóa của reader trên stream.
Sau khi khóa được giải phóng, reader không còn hoạt động nữa.

Reader sẽ xuất hiện lỗi nếu stream liên quan gặp lỗi khi khóa được giải phóng; ngược lại, reader sẽ xuất hiện trạng thái đóng.

Nếu khóa của reader được giải phóng trong khi vẫn còn các yêu cầu đọc đang chờ, các promise được trả về bởi phương thức {{domxref("ReadableStreamBYOBReader.read()")}} của reader sẽ bị từ chối ngay lập tức với `TypeError`.
Các chunk chưa đọc vẫn còn trong hàng đợi nội bộ của stream và có thể được đọc sau bằng cách lấy một reader mới.

## Cú pháp

```js-nolint
releaseLock()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu đối tượng nguồn không phải là `ReadableStreamBYOBReader`.

## Ví dụ

Ví dụ đơn giản dưới đây được hiển thị.
Khóa được tạo ngay khi reader được tạo trên stream.

```js
const reader = stream.getReader({ mode: "byob" });
reader.releaseLock();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hàm khởi tạo {{domxref("ReadableStreamBYOBReader.ReadableStreamBYOBReader", "ReadableStreamBYOBReader()")}}
- [Sử dụng readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
