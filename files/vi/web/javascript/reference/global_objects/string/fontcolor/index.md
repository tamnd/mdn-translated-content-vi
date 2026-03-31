---
title: String.prototype.fontcolor()
short-title: fontcolor()
slug: Web/JavaScript/Reference/Global_Objects/String/fontcolor
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.String.fontcolor
sidebar: jsref
---

{{Deprecated_Header}}

Phương thức **`fontcolor()`** của các giá trị {{jsxref("String")}} tạo ra một chuỗi nhúng chuỗi này vào trong phần tử {{HTMLElement("font")}} (`<font color="...">str</font>`), khiến chuỗi này được hiển thị với màu font chữ được chỉ định.

> [!NOTE]
> Tất cả [các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods) đều đã bị deprecated và chỉ được chuẩn hóa cho mục đích tương thích. Đối với trường hợp của `fontcolor()`, bản thân phần tử `<font>` đã bị loại bỏ khỏi đặc tả HTML và không nên được sử dụng nữa. Các nhà phát triển web nên sử dụng các thuộc tính [CSS](/en-US/docs/Web/CSS) thay thế.

## Cú pháp

```js-nolint
fontcolor(color)
```

### Tham số

- `color`
  - : Một chuỗi biểu thị màu sắc dưới dạng bộ ba RGB thập lục phân hoặc dưới dạng chuỗi literal. Các chuỗi literal cho tên màu được liệt kê trong [tham chiếu màu CSS](/en-US/docs/Web/CSS/Reference/Values/color_value).

### Giá trị trả về

Một chuỗi bắt đầu bằng thẻ mở `<font color="color">` (dấu ngoặc kép trong `color` được thay thế bằng `&quot;`), sau đó là văn bản `str`, và cuối cùng là thẻ đóng `</font>`.

## Mô tả

Bản thân phương thức `fontcolor()` chỉ đơn giản nối các phần của chuỗi lại mà không có bất kỳ xác thực hay chuẩn hóa nào. Tuy nhiên, để tạo ra các phần tử {{HTMLElement("font")}} hợp lệ, nếu bạn biểu thị màu sắc dưới dạng bộ ba RGB thập lục phân, bạn phải sử dụng định dạng `rrggbb`. Ví dụ, các giá trị RGB thập lục phân cho màu salmon là red=FA, green=80, và blue=72, vì vậy bộ ba RGB cho salmon là `"FA8072"`.

## Ví dụ

### Sử dụng fontcolor()

Đoạn code dưới đây tạo ra một chuỗi HTML rồi thay thế nội dung body của document bằng chuỗi đó:

```js
const contentString = "Hello, world";

document.body.innerHTML = contentString.fontcolor("red");
```

Đoạn code này sẽ tạo ra HTML sau:

```html
<font color="red">Hello, world</font>
```

> [!WARNING]
> Markup này không hợp lệ, vì `font` không còn là phần tử hợp lệ nữa.

Thay vì sử dụng `fontcolor()` và tạo văn bản HTML trực tiếp, bạn nên sử dụng CSS để thao tác với font chữ. Ví dụ, bạn có thể thao tác với {{cssxref("color")}} thông qua thuộc tính {{domxref("HTMLElement/style", "element.style")}}:

```js
document.getElementById("yourElemId").style.color = "red";
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.fontcolor` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.fontcolor`](https://www.npmjs.com/package/es-string-html-methods)
- [Các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods)
- {{HTMLElement("font")}}
