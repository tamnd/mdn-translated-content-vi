---
title: String.prototype.italics()
short-title: italics()
slug: Web/JavaScript/Reference/Global_Objects/String/italics
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.String.italics
sidebar: jsref
---

{{Deprecated_Header}}

Phương thức **`italics()`** của các giá trị {{jsxref("String")}} tạo ra một chuỗi nhúng chuỗi này vào trong phần tử {{HTMLElement("i")}} (`<i>str</i>`), khiến chuỗi này được hiển thị in nghiêng.

> [!NOTE]
> Tất cả [các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods) đều đã bị deprecated và chỉ được chuẩn hóa cho mục đích tương thích. Hãy sử dụng [DOM APIs](/en-US/docs/Web/API/Document_Object_Model) như [`document.createElement()`](/en-US/docs/Web/API/Document/createElement) thay thế.

## Cú pháp

```js-nolint
italics()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi bắt đầu bằng thẻ mở `<i>`, sau đó là văn bản `str`, và cuối cùng là thẻ đóng `</i>`.

## Ví dụ

### Sử dụng italics()

Đoạn code dưới đây tạo ra một chuỗi HTML rồi thay thế nội dung body của document bằng chuỗi đó:

```js
const contentString = "Hello, world";

document.body.innerHTML = contentString.italics();
```

Đoạn code này sẽ tạo ra HTML sau:

```html
<i>Hello, world</i>
```

Thay vì sử dụng `italics()` và tạo văn bản HTML trực tiếp, bạn nên sử dụng DOM APIs như [`document.createElement()`](/en-US/docs/Web/API/Document/createElement). Ví dụ:

```js
const contentString = "Hello, world";
const elem = document.createElement("i");
elem.innerText = contentString;
document.body.appendChild(elem);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.italics` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.italics`](https://www.npmjs.com/package/es-string-html-methods)
- [Các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods)
- {{HTMLElement("i")}}
