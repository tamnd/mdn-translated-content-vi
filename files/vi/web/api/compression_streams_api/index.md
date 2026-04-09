---
title: Compression Streams API
slug: Web/API/Compression_Streams_API
page-type: web-api-overview
browser-compat: api.CompressionStream
---

{{DefaultAPISidebar("Compression Streams API")}}{{AvailableInWorkers}}

**Compression Streams API** cung cấp một API JavaScript để nén và giải nén các luồng dữ liệu bằng định dạng gzip hoặc deflate.

Khả năng nén tích hợp sẵn có nghĩa là các ứng dụng JavaScript sẽ không cần phải kèm theo một thư viện nén, giúp kích thước tải xuống của ứng dụng nhỏ hơn.

{{domxref("Response")}} của Fetch API có thể được dùng để chuyển đổi các luồng thành:

- {{jsxref("ArrayBuffer")}}
- {{domxref("Blob")}}
- {{jsxref("Uint8Array")}}
- {{jsxref("String")}}
- JSON

## Giao diện

- {{domxref("CompressionStream")}}
  - : Nén một luồng dữ liệu.
- {{domxref("DecompressionStream")}}
  - : Giải nén một luồng dữ liệu.

## Ví dụ

Trong ví dụ này, một luồng được nén bằng phương thức nén gzip.

```js
const compressedReadableStream = inputReadableStream.pipeThrough(
  new CompressionStream("gzip"),
);
```

Trong ví dụ sau, một hàm giải nén một blob bằng gzip.

```js
async function DecompressBlob(blob) {
  const ds = new DecompressionStream("gzip");
  const decompressedStream = blob.stream().pipeThrough(ds);
  return await new Response(decompressedStream).blob();
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
