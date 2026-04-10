---
title: CompressionStream
slug: Web/API/CompressionStream
page-type: web-api-interface
browser-compat: api.CompressionStream
---

{{APIRef("Compression Streams API")}}{{AvailableInWorkers}}

Giao diện **`CompressionStream`** thuộc {{domxref('Compression Streams API','','',' ')}} dùng để nén một luồng dữ liệu. Giao diện này có hình dạng giống như {{domxref("TransformStream")}}, cho phép sử dụng trong {{domxref("ReadableStream.pipeThrough()")}} và các phương thức tương tự.

## Bộ khởi tạo

- {{domxref("CompressionStream.CompressionStream", "CompressionStream()")}}
  - : Tạo một `CompressionStream` mới.

## Thuộc tính thể hiện

- {{domxref("CompressionStream.readable")}}
  - : Trả về thể hiện {{domxref("ReadableStream")}} được điều khiển bởi đối tượng này.
- {{domxref("CompressionStream.writable")}}
  - : Trả về thể hiện {{domxref("WritableStream")}} được điều khiển bởi đối tượng này.

## Ví dụ

Trong ví dụ này, một luồng được nén bằng thuật toán gzip.

```js
const compressedReadableStream = inputReadableStream.pipeThrough(
  new CompressionStream("gzip"),
);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DecompressionStream")}}
- {{domxref("TransformStream")}}
