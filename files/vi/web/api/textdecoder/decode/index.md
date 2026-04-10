---
title: "TextDecoder: decode() method"
short-title: decode()
slug: Web/API/TextDecoder/decode
page-type: web-api-instance-method
browser-compat: api.TextDecoder.decode
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Phương thức **`TextDecoder.decode()`** trả về một chuỗi chứa văn bản đã được giải mã từ bộ đệm được truyền vào làm tham số.

Phương thức giải mã được xác định bởi đối tượng {{domxref("TextDecoder")}} hiện tại.
Điều này bao gồm mã hóa mong đợi của dữ liệu, và cách xử lý lỗi khi giải mã.

## Cú pháp

```js-nolint
decode()
decode(buffer)
decode(buffer, options)
```

### Tham số

- `buffer` {{Optional_Inline}}
  - : Một đối tượng [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer), {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} chứa văn bản đã mã hóa cần giải mã.
- `options` {{Optional_Inline}}
  - : Một đối tượng với thuộc tính:
    - `stream`
      - : Một cờ boolean cho biết có dữ liệu bổ sung sẽ tiếp tục xuất hiện trong các lần gọi `decode()` tiếp theo hay không.
        Đặt thành `true` nếu xử lý dữ liệu theo từng khối, và `false` cho khối cuối cùng hoặc nếu dữ liệu không được chia khối.
        Mặc định là `false`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu xảy ra lỗi giải mã khi thuộc tính {{DOMxRef("TextDecoder.fatal")}} là `true`.

### Giá trị trả về

Một chuỗi.

## Ví dụ

Ví dụ này mã hóa và giải mã ký hiệu euro, €.

### HTML

```html
<p>Encoded value: <span id="encoded-value"></span></p>
<p>Decoded value: <span id="decoded-value"></span></p>
```

### JavaScript

```js
const encoder = new TextEncoder();
const array = encoder.encode("€"); // Uint8Array(3) [226, 130, 172]
document.getElementById("encoded-value").textContent = array;

const decoder = new TextDecoder();
const str = decoder.decode(array); // String "€"
document.getElementById("decoded-value").textContent = str;
```

### Kết quả

{{EmbedLiveSample("Ví dụ")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextDecoder")}} mà nó thuộc về.
