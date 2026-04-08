---
title: String.prototype.fontsize()
short-title: fontsize()
slug: Web/JavaScript/Reference/Global_Objects/String/fontsize
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.String.fontsize
sidebar: jsref
---

{{Deprecated_Header}}

Phương thức **`fontsize()`** của các giá trị {{jsxref("String")}} tạo ra một chuỗi nhúng chuỗi này vào trong phần tử {{HTMLElement("font")}} (`<font size="...">str</font>`), khiến chuỗi này được hiển thị với kích thước font chữ được chỉ định.

> [!NOTE]
> Tất cả [các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods) đều đã bị deprecated và chỉ được chuẩn hóa cho mục đích tương thích. Đối với trường hợp của `fontsize()`, bản thân phần tử `<font>` đã bị loại bỏ khỏi đặc tả HTML và không nên được sử dụng nữa. Các nhà phát triển web nên sử dụng các thuộc tính [CSS](/en-US/docs/Web/CSS) thay thế.

## Cú pháp

```js-nolint
fontsize(size)
```

### Tham số

- `size`
  - : Một số nguyên từ 1 đến 7, hoặc một chuỗi đại diện cho số nguyên có dấu từ 1 đến 7.

### Giá trị trả về

Một chuỗi bắt đầu bằng thẻ mở `<font size="size">` (dấu ngoặc kép trong `size` được thay thế bằng `&quot;`), sau đó là văn bản `str`, và cuối cùng là thẻ đóng `</font>`.

## Mô tả

Bản thân phương thức `fontsize()` chỉ đơn giản nối các phần của chuỗi lại mà không có bất kỳ xác thực hay chuẩn hóa nào. Tuy nhiên, để tạo ra các phần tử {{HTMLElement("font")}} hợp lệ, khi bạn chỉ định size là số nguyên, bạn đặt kích thước font chữ của `str` thành một trong 7 kích thước được định nghĩa. Bạn có thể chỉ định `size` dưới dạng chuỗi như `"-2"` hoặc `"+3"` để điều chỉnh kích thước font chữ của `str` tương đối so với giá trị mặc định là 3.

## Ví dụ

### Sử dụng fontsize()

Đoạn code dưới đây tạo ra một chuỗi HTML rồi thay thế nội dung body của document bằng chuỗi đó:

```js
const contentString = "Hello, world";

document.body.innerHTML = contentString.fontsize(7);
```

Đoạn code này sẽ tạo ra HTML sau:

```html
<font size="7">Hello, world</font>
```

> [!WARNING]
> Markup này không hợp lệ, vì `font` không còn là phần tử hợp lệ nữa.

Thay vì sử dụng `fontsize()` và tạo văn bản HTML trực tiếp, bạn nên sử dụng CSS để thao tác với font chữ. Ví dụ, bạn có thể thao tác với {{cssxref("font-size")}} thông qua thuộc tính {{domxref("HTMLElement/style", "element.style")}}:

```js
document.getElementById("yourElemId").style.fontSize = "7pt";
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.fontsize` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.fontsize`](https://www.npmjs.com/package/es-string-html-methods)
- [Các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods)
- {{HTMLElement("font")}}
