---
title: "TextDecoder: TextDecoder() constructor"
short-title: TextDecoder()
slug: Web/API/TextDecoder/TextDecoder
page-type: web-api-constructor
browser-compat: api.TextDecoder.TextDecoder
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Hàm tạo **`TextDecoder()`** trả về một đối tượng {{DOMxRef("TextDecoder")}} mới.

## Cú pháp

```js-nolint
new TextDecoder()
new TextDecoder(label)
new TextDecoder(label, options)
```

### Tham số

- `label` {{optional_inline}}
  - : Một chuỗi xác định mã hóa ký tự mà bộ giải mã này sẽ sử dụng. Có thể là [bất kỳ nhãn hợp lệ nào](/en-US/docs/Web/API/Encoding_API/Encodings).

    Mặc định là `"utf-8"`.

- `options` {{optional_inline}}
  - : Một đối tượng với các thuộc tính sau:
    - `fatal` {{optional_inline}}
      - : Một giá trị boolean cho biết phương thức {{DOMxRef("TextDecoder.decode()")}} có phải ném ra {{jsxref("TypeError")}} khi giải mã dữ liệu không hợp lệ hay không.
        Mặc định là `false`, nghĩa là bộ giải mã sẽ thay dữ liệu lỗi bằng ký tự thay thế.

    - `ignoreBOM` {{optional_inline}}
      - : Một giá trị boolean cho biết [byte order mark](https://www.w3.org/International/questions/qa-byte-order-mark) sẽ được đưa vào đầu ra hay bị bỏ qua.
        Mặc định là `false`, nghĩa là byte order mark sẽ bị bỏ qua khi giải mã và không được đưa vào văn bản đã giải mã.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu giá trị của `label` không xác định, hoặc là một trong các giá trị dẫn đến thuật toán giải mã `'replacement'` (`"iso-2022-cn"` hoặc `"iso-2022-cn-ext"`).

## Ví dụ

```js
const textDecoder1 = new TextDecoder("iso-8859-2");

const textDecoder2 = new TextDecoder();

const textDecoder3 = new TextDecoder("csiso2022kr", { fatal: true });
// Allows TypeError exception to be thrown.

const textDecoder4 = new TextDecoder("iso-2022-cn");
// Throws a RangeError exception.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextDecoder")}} mà nó thuộc về.
