---
title: "ReadableStream: thuộc tính locked"
short-title: locked
slug: Web/API/ReadableStream/locked
page-type: web-api-instance-property
browser-compat: api.ReadableStream.locked
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính **`locked`** chỉ đọc của giao diện {{domxref("ReadableStream")}} trả về xem luồng có thể đọc được có bị khóa đối với đầu đọc hay không.

Một luồng có thể đọc được có thể có nhiều nhất một trình đọc đang hoạt động tại một thời điểm và được khóa đối với trình đọc đó cho đến khi nó được giải phóng.
Một trình đọc có thể được lấy bằng cách sử dụng [`ReadableStream.getReader()`](/en-US/docs/Web/API/ReadableStream/getReader) và được phát hành bằng phương pháp `releaseLock()` của trình đọc.

## Giá trị

Giá trị {{Glossary("boolean")}} cho biết luồng có thể đọc được có bị khóa hay không.

## Ví dụ

```js
const stream = new ReadableStream({
  // …
});

const reader = stream.getReader();

stream.locked;
// should return true, as the stream has been locked to a reader
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- hàm tạo {{domxref("ReadableStream.ReadableStream", "ReadableStream()")}}

- [Sử dụng các luồng có thể đọc được](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
