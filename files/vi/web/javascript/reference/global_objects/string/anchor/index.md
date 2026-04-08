---
title: String.prototype.anchor()
short-title: anchor()
slug: Web/JavaScript/Reference/Global_Objects/String/anchor
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.String.anchor
sidebar: jsref
---

{{Deprecated_Header}}

Phương thức **`anchor()`** của các giá trị {{jsxref("String")}} tạo ra một chuỗi nhúng chuỗi này vào trong phần tử {{HTMLElement("a")}} với thuộc tính name (`<a name="...">str</a>`).

> [!NOTE]
> Tất cả [các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods) đều đã bị deprecated và chỉ được chuẩn hóa cho mục đích tương thích. Hãy sử dụng [DOM APIs](/en-US/docs/Web/API/Document_Object_Model) như [`document.createElement()`](/en-US/docs/Web/API/Document/createElement) thay thế.
>
> Đặc tả HTML không còn cho phép phần tử {{HTMLElement("a")}} có thuộc tính `name` nữa, vì vậy phương thức này thậm chí không tạo ra markup hợp lệ.

## Cú pháp

```js-nolint
anchor(name)
```

### Tham số

- `name`
  - : Một chuỗi đại diện cho giá trị `name` để đặt vào thẻ mở `<a name="...">` được tạo ra.

### Giá trị trả về

Một chuỗi bắt đầu bằng thẻ mở `<a name="name">` (dấu ngoặc kép trong `name` được thay thế bằng `&quot;`), sau đó là văn bản `str`, và cuối cùng là thẻ đóng `</a>`.

## Ví dụ

### Sử dụng anchor()

Đoạn code dưới đây tạo ra một chuỗi HTML rồi thay thế nội dung body của document bằng chuỗi đó:

```js
const contentString = "Hello, world";

document.body.innerHTML = contentString.anchor("hello");
```

Đoạn code này sẽ tạo ra HTML sau:

```html
<a name="hello">Hello, world</a>
```

> [!WARNING]
> Markup này không hợp lệ, vì `name` không còn là thuộc tính hợp lệ của phần tử {{HTMLElement("a")}} nữa.

Thay vì sử dụng `anchor()` và tạo văn bản HTML trực tiếp, bạn nên sử dụng DOM APIs như [`document.createElement()`](/en-US/docs/Web/API/Document/createElement). Ví dụ:

```js
const contentString = "Hello, world";
const elem = document.createElement("a");
elem.innerText = contentString;
document.body.appendChild(elem);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.anchor` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.anchor`](https://www.npmjs.com/package/es-string-html-methods)
- [Các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods)
- {{HTMLElement("a")}}
