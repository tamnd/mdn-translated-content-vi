---
title: "CompressionStream: hàm dựng CompressionStream()"
short-title: CompressionStream()
slug: Web/API/CompressionStream/CompressionStream
page-type: web-api-constructor
browser-compat: api.CompressionStream.CompressionStream
---

{{APIRef("Compression Streams API")}}{{AvailableInWorkers}}

Hàm dựng **`CompressionStream()`** tạo một đối tượng {{domxref("CompressionStream")}} mới để nén một luồng dữ liệu.

## Cú pháp

```js-nolint
new CompressionStream(format)
```

### Tham số

- `format`
  - : Một trong các định dạng nén được hỗ trợ sau:
    - `"brotli"`
      - : Nén luồng bằng thuật toán [Brotli](https://www.rfc-editor.org/rfc/rfc1952).
    - `"gzip"`
      - : Nén luồng bằng định dạng [GZIP](https://www.rfc-editor.org/rfc/rfc1952).
    - `"deflate"`
      - : Nén luồng bằng thuật toán [DEFLATE](https://www.rfc-editor.org/rfc/rfc1950) trong định dạng dữ liệu nén ZLIB.
        Định dạng ZLIB bao gồm một tiêu đề chứa thông tin về phương thức nén và kích thước dữ liệu chưa nén, cùng với một giá trị kiểm tra ở cuối để xác minh tính toàn vẹn của dữ liệu.
    - `"deflate-raw"`
      - : Nén luồng bằng thuật toán [DEFLATE](https://www.rfc-editor.org/rfc/rfc1951) mà không có tiêu đề và giá trị kiểm tra ở cuối.
    - `"zstd"`
      - : Nén luồng bằng thuật toán [ZSTD](https://datatracker.ietf.org/doc/html/rfc8478).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu định dạng truyền vào hàm dựng không được hỗ trợ.

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
