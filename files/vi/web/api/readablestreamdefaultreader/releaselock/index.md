---
title: "ReadableStreamDefaultReader: releaseLock() method"
short-title: releaseLock()
slug: Web/API/ReadableStreamDefaultReader/releaseLock
page-type: web-api-instance-method
browser-compat: api.ReadableStreamDefaultReader.releaseLock
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`releaseLock()`** của giao diện {{domxref("ReadableStreamDefaultReader")}} giải phóng khóa của trình đọc trên luồng.

Nếu luồng liên kết phát sinh lỗi khi khóa bị giải phóng, trình đọc sẽ sau đó xuất hiện ở trạng thái lỗi tương tự; nếu không, trình đọc sẽ xuất hiện là đã đóng.

Nếu khóa của trình đọc bị giải phóng trong khi vẫn còn các yêu cầu đọc đang chờ thì các promise do phương thức {{domxref("ReadableStreamDefaultReader.read()")}} trả về sẽ ngay lập tức bị từ chối với `TypeError`.
Các khối dữ liệu chưa đọc vẫn nằm trong hàng đợi nội bộ của luồng và có thể được đọc sau bằng cách lấy một trình đọc mới.

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
  - : Được ném ra nếu đối tượng nguồn không phải là `ReadableStreamDefaultReader`.

## Ví dụ

```js
function fetchStream() {
  const reader = stream.getReader();

  // …

  reader.releaseLock();

  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ReadableStreamDefaultReader.ReadableStreamDefaultReader", "ReadableStreamDefaultReader()")}} bộ khởi tạo
- [Sử dụng các luồng có thể đọc](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
