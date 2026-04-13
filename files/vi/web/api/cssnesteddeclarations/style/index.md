---
title: "CSSNestedDeclarations: style property"
short-title: style
slug: Web/API/CSSNestedDeclarations/style
page-type: web-api-instance-property
browser-compat: api.CSSNestedDeclarations.style
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`style`** của giao diện {{domxref("CSSNestedDeclarations")}} đại diện cho các kiểu liên quan đến các quy tắc lồng nhau.

## Giá trị

Một đối tượng {{domxref("CSSStyleProperties")}}.

Mặc dù bản thân thuộc tính `style` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSStyleProperties`, bạn vẫn có thể gán cho thuộc tính `style` trực tiếp, tương đương với việc gán cho thuộc tính {{domxref("CSSStyleDeclaration/cssText", "cssText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `CSSStyleProperties` bằng cách sử dụng phương thức {{domxref("CSSStyleDeclaration/setProperty", "setProperty()")}} và {{domxref("CSSStyleDeclaration/removeProperty", "removeProperty()")}}.

## Ví dụ

Stylesheet này chứa {{domxref("cssRule","cssRules")}} lồng nhau.

`console.log` đầu tiên hiển thị `style` cấp cao nhất, cái thứ hai hiển thị truy vấn `@media` lồng nhau với kiểu lồng nhau của nó và cái cuối cùng hiển thị kiểu lồng nhau được khai báo sau truy vấn `@media`.

```css
.foo {
  font-size: 1.2rem;
  @media screen {
    color: tomato;
    background-color: darkgrey;
  }
  color: black;
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].style);
// { "0": "font-size" }
console.log(myRules[0].cssRules[0].cssRules[0].style);
// { "0": "color", "1": "background-color" }
console.log(myRules[0].cssRules[1].style);
// { "0": "color" }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSNestedDeclarations")}}
- [Quy tắc khai báo lồng nhau](/en-US/docs/Web/CSS/Guides/Nesting/Using#nested_declarations_rule)
