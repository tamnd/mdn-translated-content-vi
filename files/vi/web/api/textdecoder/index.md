---
title: TextDecoder
slug: Web/API/TextDecoder
page-type: web-api-interface
browser-compat: api.TextDecoder
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Giao diện **`TextDecoder`** đại diện cho một bộ giải mã cho một kiểu mã hóa văn bản cụ thể, chẳng hạn như `UTF-8`, `ISO-8859-2`, hoặc `GBK`. Một bộ giải mã nhận một mảng byte làm đầu vào và trả về một chuỗi JavaScript.

## Hàm tạo

- {{DOMxRef("TextDecoder.TextDecoder", "TextDecoder()")}}
  - : Tạo và trả về một `TextDecoder` mới.

## Thuộc tính thể hiện

_Giao diện `TextDecoder` không kế thừa thuộc tính nào._

- {{DOMxRef("TextDecoder.encoding")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa tên của hệ mã hóa ký tự mà `TextDecoder` này sẽ sử dụng.
- {{DOMxRef("TextDecoder.fatal")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết chế độ lỗi có phải là fatal hay không.
- {{DOMxRef("TextDecoder.ignoreBOM")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết [byte order mark](https://www.w3.org/International/questions/qa-byte-order-mark) có bị bỏ qua hay không.

## Phương thức thể hiện

_Giao diện `TextDecoder` không kế thừa phương thức nào_.

- {{DOMxRef("TextDecoder.decode()")}}
  - : Giải mã các byte đã cho thành một chuỗi JavaScript và trả về chuỗi đó.

## Ví dụ

### Giải mã văn bản UTF-8

Ví dụ này cho thấy cách giải mã mã hóa UTF-8 của ký tự "𠮷".

```html
<button id="decode">Decode</button>
<button id="reset">Reset</button>
<div id="output"></div>
```

```css hidden
div {
  margin: 1rem 0;
}
```

```js
const utf8decoder = new TextDecoder(); // default 'utf-8'
const encodedText = new Uint8Array([240, 160, 174, 183]);

const output = document.querySelector("#output");
const decodeButton = document.querySelector("#decode");
decodeButton.addEventListener("click", () => {
  output.textContent = utf8decoder.decode(encodedText);
});

const resetButton = document.querySelector("#reset");
resetButton.addEventListener("click", () => {
  window.location.reload();
});
```

{{embedlivesample("Giải mã văn bản UTF-8")}}

### Giải mã văn bản không phải UTF-8

Trong ví dụ này, chúng ta giải mã văn bản tiếng Nga "Привет, мир!", nghĩa là "Hello, world." Trong hàm tạo {{domxref("TextDecoder/TextDecoder", "TextDecoder()")}}, chúng ta chỉ định mã hóa ký tự Windows-1251.

```html
<button id="decode">Decode</button>
<button id="reset">Reset</button>
<div id="decoded"></div>
```

```css hidden
div {
  margin: 1rem 0;
}
```

```js
const win1251decoder = new TextDecoder("windows-1251");
const encodedText = new Uint8Array([
  207, 240, 232, 226, 229, 242, 44, 32, 236, 232, 240, 33,
]);

const decoded = document.querySelector("#decoded");
const decodeButton = document.querySelector("#decode");
decodeButton.addEventListener("click", () => {
  decoded.textContent = win1251decoder.decode(encodedText);
});

const resetButton = document.querySelector("#reset");
resetButton.addEventListener("click", () => {
  window.location.reload();
});
```

{{embedlivesample("Giải mã văn bản không phải UTF-8")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextEncoder")}} mô tả thao tác ngược lại.
