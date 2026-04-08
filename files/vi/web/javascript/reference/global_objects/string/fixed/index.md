---
title: String.prototype.fixed()
short-title: fixed()
slug: Web/JavaScript/Reference/Global_Objects/String/fixed
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.String.fixed
sidebar: jsref
---

{{Deprecated_Header}}

Phương thức **`fixed()`** của các giá trị {{jsxref("String")}} tạo ra một chuỗi nhúng chuỗi này vào trong phần tử {{HTMLElement("tt")}} (`<tt>str</tt>`), khiến chuỗi này được hiển thị với font chữ có độ rộng cố định.

> [!NOTE]
> Tất cả [các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods) đều đã bị deprecated và chỉ được chuẩn hóa cho mục đích tương thích. Đối với trường hợp của `fixed()`, bản thân phần tử `<tt>` đã bị loại bỏ khỏi đặc tả HTML và không nên được sử dụng nữa. Các nhà phát triển web nên sử dụng các thuộc tính [CSS](/en-US/docs/Web/CSS) thay thế.

## Cú pháp

```js-nolint
fixed()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi bắt đầu bằng thẻ mở `<tt>`, sau đó là văn bản `str`, và cuối cùng là thẻ đóng `</tt>`.

## Ví dụ

### Sử dụng fixed()

Đoạn code dưới đây tạo ra một chuỗi HTML rồi thay thế nội dung body của document bằng chuỗi đó:

```js
const contentString = "Hello, world";

document.body.innerHTML = contentString.fixed();
```

Đoạn code này sẽ tạo ra HTML sau:

```html
<tt>Hello, world</tt>
```

> [!WARNING]
> Markup này không hợp lệ, vì `tt` không còn là phần tử hợp lệ nữa.

Thay vì sử dụng `fixed()` và tạo văn bản HTML trực tiếp, bạn nên sử dụng CSS để thao tác với font chữ. Ví dụ, bạn có thể thao tác với {{cssxref("font-family")}} thông qua thuộc tính {{domxref("HTMLElement/style", "element.style")}}:

```js
document.getElementById("yourElemId").style.fontFamily = "monospace";
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.fixed` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.fixed`](https://www.npmjs.com/package/es-string-html-methods)
- [Các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods)
- {{HTMLElement("tt")}}
