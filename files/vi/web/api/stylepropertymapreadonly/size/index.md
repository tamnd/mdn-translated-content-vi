---
title: "StylePropertyMapReadOnly: thuộc tính size"
short-title: size
slug: Web/API/StylePropertyMapReadOnly/size
page-type: web-api-instance-property
browser-compat: api.StylePropertyMapReadOnly.size
---

{{APIRef("CSS Typed Object Model API")}}

Thuộc tính chỉ đọc **`size`** của giao diện {{domxref("StylePropertyMapReadOnly")}} trả về một số nguyên dương chứa kích thước của đối tượng `StylePropertyMapReadOnly`.

## Giá trị

Một số nguyên dương.

## Ví dụ

Ví dụ này sử dụng thuộc tính size để trả về tổng số mục trong {{domxref('Element.computedStyleMap()','computedStyleMap')}} của phần tử button.

```js
// grab our element
const buttonEl = document.querySelector("button");

// we can retrieve all computed styles with `computedStyleMap`
const allComputedStyles = buttonEl.computedStyleMap();

// use size to get the total styles within the map
const amountStyles = allComputedStyles.size;
console.log(amountStyles); // logs 338
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
