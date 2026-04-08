---
title: String.prototype.strike()
short-title: strike()
slug: Web/JavaScript/Reference/Global_Objects/String/strike
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.String.strike
sidebar: jsref
---

{{Deprecated_Header}}

Phương thức **`strike()`** của các giá trị {{jsxref("String")}} tạo ra một chuỗi nhúng chuỗi này vào trong phần tử {{HTMLElement("strike")}} (`<strike>str</strike>`), khiến chuỗi này được hiển thị dưới dạng văn bản có gạch ngang.

> [!NOTE]
> Tất cả [các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods) đều đã bị deprecated và chỉ được chuẩn hóa cho mục đích tương thích. Đối với `strike()`, bản thân phần tử `<strike>` đã bị loại khỏi đặc tả HTML và không nên dùng nữa. Thay vào đó, các nhà phát triển web nên dùng {{HTMLElement("del")}} cho nội dung đã xóa hoặc {{HTMLElement("s")}} cho nội dung không còn chính xác hay không còn phù hợp.

## Cú pháp

```js-nolint
strike()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi bắt đầu bằng thẻ mở `<strike>`, sau đó là văn bản `str`, và cuối cùng là thẻ đóng `</strike>`.

## Ví dụ

### Sử dụng strike()

Đoạn code dưới đây tạo ra một chuỗi HTML rồi thay thế nội dung body của document bằng chuỗi đó:

```js
const contentString = "Hello, world";

document.body.innerHTML = contentString.strike();
```

Đoạn code này sẽ tạo ra HTML sau:

```html
<strike>Hello, world</strike>
```

> [!WARNING]
> Markup này không hợp lệ vì `strike` không còn là phần tử hợp lệ nữa.

Thay vì sử dụng `strike()` và tạo văn bản HTML trực tiếp, bạn nên sử dụng DOM APIs như [`document.createElement()`](/en-US/docs/Web/API/Document/createElement). Ví dụ:

```js
const contentString = "Hello, world";
const elem = document.createElement("s");
elem.innerText = contentString;
document.body.appendChild(elem);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.strike` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.strike`](https://www.npmjs.com/package/es-string-html-methods)
- [Các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods)
- {{HTMLElement("strike")}}
