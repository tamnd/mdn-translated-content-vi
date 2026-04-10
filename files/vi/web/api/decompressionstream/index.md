---
title: DecompressionStream
slug: Web/API/DecompressionStream
page-type: web-api-interface
browser-compat: api.DecompressionStream
---

{{APIRef("Compression Streams API")}}{{AvailableInWorkers}}

Giao diện **`DecompressionStream`** thuộc {{domxref('Compression Streams API','','',' ')}} dùng để giải nén một luồng dữ liệu. Giao diện này có hình dạng giống như {{domxref("TransformStream")}}, cho phép sử dụng trong {{domxref("ReadableStream.pipeThrough()")}} và các phương thức tương tự.

## Bộ khởi tạo

- {{domxref("DecompressionStream.DecompressionStream", "DecompressionStream()")}}
  - : Tạo một `DecompressionStream` mới.

## Thuộc tính thể hiện

- {{domxref("DecompressionStream.readable")}}
  - : Trả về thể hiện {{domxref("ReadableStream")}} được điều khiển bởi đối tượng này.
- {{domxref("DecompressionStream.writable")}}
  - : Trả về thể hiện {{domxref("WritableStream")}} được điều khiển bởi đối tượng này.

## Ví dụ

Trong ví dụ này, một blob được giải nén bằng thuật toán gzip.

```js
const ds = new DecompressionStream("gzip");
const decompressedStream = blob.stream().pipeThrough(ds);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CompressionStream")}}
- {{domxref("TransformStream")}}
