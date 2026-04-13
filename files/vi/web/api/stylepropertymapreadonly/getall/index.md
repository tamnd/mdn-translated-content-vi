---
title: "StylePropertyMapReadOnly: phương thức getAll()"
short-title: getAll()
slug: Web/API/StylePropertyMapReadOnly/getAll
page-type: web-api-instance-method
browser-compat: api.StylePropertyMapReadOnly.getAll
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức **`getAll()`** của giao diện {{domxref("StylePropertyMapReadOnly")}} trả về một mảng các đối tượng {{domxref("CSSStyleValue")}} chứa các giá trị của thuộc tính được cung cấp.

## Cú pháp

```js-nolint
getAll(property)
```

### Tham số

- `property`
  - : Tên của thuộc tính cần lấy tất cả các giá trị.

### Giá trị trả về

Một mảng các đối tượng {{domxref("CSSStyleValue")}}.

## Ví dụ

Ví dụ sau sử dụng `getAll()` với thuộc tính {{cssxref('background-image')}}. Một {{jsxref('Array')}} được trả về chứa một phần tử cho mỗi hình nền được khai báo.

```js
// get a button element
const buttonEl = document.querySelector("button");

// we can retrieve all computed styles with `computedStyleMap`
const allComputedStyles = buttonEl.computedStyleMap();

// use getAll() with the background image property
const allBkImages = allComputedStyles.getAll("background-image");
console.log(allBkImages); // logs an array with each background image as an item
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
