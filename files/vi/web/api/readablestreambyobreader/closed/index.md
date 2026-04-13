---
title: "ReadableStreamBYOBReader: thuộc tính closed"
short-title: closed
slug: Web/API/ReadableStreamBYOBReader/closed
page-type: web-api-instance-property
browser-compat: api.ReadableStreamBYOBReader.closed
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`closed`** của giao diện {{domxref("ReadableStreamBYOBReader")}} trả về một {{jsxref("Promise")}} hoàn thành khi stream đóng lại, hoặc bị từ chối nếu stream phát sinh lỗi hoặc khóa của reader được giải phóng.

Thuộc tính này cho phép bạn viết mã phản ứng khi quá trình streaming kết thúc.

## Giá trị

Một {{jsxref("Promise")}}.

## Ví dụ

Đoạn mã dưới đây cho thấy cách xử lý trạng thái đóng/lỗi của BYOBReader.

```js
const reader = stream.getReader({ mode: "byob" });
reader.closed
  .then(() => {
    // Resolved - code to handle stream closing
  })
  .catch(() => {
    // Rejected - code to handle error
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hàm khởi tạo {{domxref("ReadableStreamBYOBReader.ReadableStreamBYOBReader", "ReadableStreamBYOBReader()")}}
- [Sử dụng readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
