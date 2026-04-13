---
title: "CompressionStream: Bộ khởi tạo CompressionStream()"
short-title: CompressionStream()
slug: Web/API/CompressionStream/CompressionStream
page-type: web-api-constructor
browser-compat: api.CompressionStream.CompressionStream
---

{{APIRef("Compression Streams API")}}{{AvailableInWorkers}}

Bộ khởi tạo **`CompressionStream()`** tạo một đối tượng {{domxref("CompressionStream")}} mới dùng để nén một luồng dữ liệu.

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
      - : Nén luồng bằng thuật toán [DEFLATE](https://www.rfc-editor.org/rfc/rfc1950) ở định dạng dữ liệu nén ZLIB.
        Định dạng ZLIB bao gồm một tiêu đề chứa thông tin về phương thức nén và kích thước dữ liệu chưa nén, cùng một mã kiểm tra ở cuối để xác minh tính toàn vẹn của dữ liệu.
    - `"deflate-raw"`
      - : Nén luồng bằng thuật toán [DEFLATE](https://www.rfc-editor.org/rfc/rfc1951) mà không có tiêu đề và mã kiểm tra ở cuối.
    - `"zstd"`
      - : Nén luồng bằng thuật toán [ZSTD](https://datatracker.ietf.org/doc/html/rfc8478).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu định dạng truyền vào bộ khởi tạo không được hỗ trợ.

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
