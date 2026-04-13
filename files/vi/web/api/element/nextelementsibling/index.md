---
title: "Element: nextElementSibling property"
short-title: nextElementSibling
slug: Web/API/Element/nextElementSibling
page-type: web-api-instance-property
browser-compat: api.Element.nextElementSibling
---

{{APIRef("DOM")}}

Thuộc tính **`Element.nextElementSibling`** read-only
property trả về the element immediately following the specified one in its parent's
{{domxref("Element.children", "children")}} list, or `null` if the specified element is the last one in the list.

## Giá trị

Một {{domxref("Element")}} object, or `null`.

## Ví dụ

```html
<div id="div-01">Here is div-01</div>
<div id="div-02">Here is div-02</div>
```

```js
let el = document.getElementById("div-01").nextElementSibling;
console.log("Siblings of div-01:");
while (el) {
  console.log(el.nodeName);
  el = el.nextElementSibling;
}
```

Ví dụ này outputs the following into the console when it loads:

```plain
Siblings of div-01:
DIV
SCRIPT
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.previousElementSibling")}}
