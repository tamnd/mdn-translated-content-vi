---
title: CompressionStream
slug: Web/API/CompressionStream
page-type: web-api-interface
browser-compat: api.CompressionStream
---

{{APIRef("Compression Streams API")}}{{AvailableInWorkers}}

Giao diện **`CompressionStream`** của {{domxref('Compression Streams API','','',' ')}} nén một luồng dữ liệu. Nó triển khai cùng một dạng như {{domxref("TransformStream")}}, cho phép dùng trong {{domxref("ReadableStream.pipeThrough()")}} và các phương thức tương tự.

## Constructor

- {{domxref("CompressionStream.CompressionStream", "CompressionStream()")}}
  - : Tạo một `CompressionStream` mới.

## Thuộc tính thực thể

- {{domxref("CompressionStream.readable")}}
  - : Trả về thực thể {{domxref("ReadableStream")}} do đối tượng này điều khiển.
- {{domxref("CompressionStream.writable")}}
  - : Trả về thực thể {{domxref("WritableStream")}} do đối tượng này điều khiển.

## Ví dụ

Trong ví dụ này, một luồng được nén bằng nén gzip.

```js
const compressedReadableStream = inputReadableStream.pipeThrough(
  new CompressionStream("gzip"),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DecompressionStream")}}
- {{domxref("TransformStream")}}
