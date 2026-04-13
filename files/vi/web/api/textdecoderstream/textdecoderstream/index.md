---
title: "TextDecoderStream: TextDecoderStream() constructor"
short-title: TextDecoderStream()
slug: Web/API/TextDecoderStream/TextDecoderStream
page-type: web-api-constructor
browser-compat: api.TextDecoderStream.TextDecoderStream
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`TextDecoderStream()`** tạo đối tượng {{domxref("TextDecoderStream")}} mới được dùng để chuyển đổi luồng văn bản trong mã hóa nhị phân thành chuỗi.

## Cú pháp

```js-nolint
new TextDecoderStream(label)
new TextDecoderStream(label, options)
```

### Tham số

- `label`
  - : Chuỗi mặc định là `utf-8`.
    Đây có thể là [bất kỳ nhãn hợp lệ nào](/en-US/docs/Web/API/Encoding_API/Encodings).
- `options` {{optional_inline}}
  - : Đối tượng với các thuộc tính sau:
    - `fatal` {{optional_inline}}
      - : Giá trị boolean cho biết phương thức {{DOMxRef("TextDecoder.decode()")}} có phải ném {{jsxref("TypeError")}} khi giải mã dữ liệu không hợp lệ hay không.
        Mặc định là `false`, có nghĩa là bộ giải mã sẽ thay thế dữ liệu không hợp lệ bằng ký tự thay thế.

    - `ignoreBOM` {{optional_inline}}
      - : Giá trị boolean cho biết [byte order mark](https://www.w3.org/International/questions/qa-byte-order-mark) có được đưa vào đầu ra hay bị bỏ qua hay không.
        Mặc định là `false`, có nghĩa là byte order mark sẽ bị bỏ qua khi giải mã và không được đưa vào văn bản đã giải mã.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu giá trị của `label` không xác định, hoặc là một trong các giá trị dẫn đến thuật toán giải mã `'replacement'` (`"iso-2022-cn"` hoặc `"iso-2022-cn-ext"`).

## Ví dụ

Ví dụ sau minh họa cách giải mã dữ liệu nhị phân lấy từ lệnh gọi {{domxref("Window/fetch", "fetch()")}}.
Dữ liệu sẽ được hiểu là UTF-8, vì không có `label` nào được truyền.

```js
const response = await fetch("https://example.com");
const stream = response.body.pipeThrough(new TextDecoderStream());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
