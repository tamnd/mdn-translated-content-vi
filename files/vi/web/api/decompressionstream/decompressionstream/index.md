---
title: "DecompressionStream: Bộ khởi tạo DecompressionStream()"
short-title: DecompressionStream()
slug: Web/API/DecompressionStream/DecompressionStream
page-type: web-api-constructor
browser-compat: api.DecompressionStream.DecompressionStream
---

{{APIRef("Compression Streams API")}}{{AvailableInWorkers}}

Bộ khởi tạo **`DecompressionStream()`** tạo một đối tượng {{domxref("DecompressionStream")}} mới dùng để giải nén một luồng dữ liệu.

## Cú pháp

```js-nolint
new DecompressionStream(format)
```

### Tham số

- `format`
  - : Một trong các định dạng nén sau:
    - `"brotli"`
      - : Giải nén luồng bằng thuật toán [Brotli](https://www.rfc-editor.org/rfc/rfc1952).
    - `"gzip"`
      - : Giải nén luồng bằng thuật toán [GZIP](https://www.rfc-editor.org/rfc/rfc1952).
    - `"deflate"`
      - : Giải nén luồng bằng thuật toán [DEFLATE](https://www.rfc-editor.org/rfc/rfc1950) ở định dạng dữ liệu nén ZLIB.
        Định dạng ZLIB bao gồm một tiêu đề chứa thông tin về phương thức nén và kích thước dữ liệu chưa nén, cùng một mã kiểm tra ở cuối để xác minh tính toàn vẹn của dữ liệu.
    - `"deflate-raw"`
      - : Giải nén luồng bằng thuật toán [DEFLATE](https://www.rfc-editor.org/rfc/rfc1951) mà không có tiêu đề và mã kiểm tra ở cuối.
    - `"zstd"`
      - : Giải nén luồng bằng thuật toán [ZSTD](https://datatracker.ietf.org/doc/html/rfc8478).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu định dạng truyền vào bộ khởi tạo không được hỗ trợ.

## Ví dụ

Trong ví dụ này, một blob được nén bằng gzip sẽ được giải nén.

```js
const ds = new DecompressionStream("gzip");
const decompressedStream = blob.stream().pipeThrough(ds);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
