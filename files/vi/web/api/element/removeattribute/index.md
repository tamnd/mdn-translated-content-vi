---
title: "Element: removeAttribute() method"
short-title: removeAttribute()
slug: Web/API/Element/removeAttribute
page-type: web-api-instance-method
browser-compat: api.Element.removeAttribute
---

{{ APIRef("DOM") }}

The {{domxref("Element")}} method
**`removeAttribute()`** removes the attribute with the
specified name from the element.

## Cú pháp

```js-nolint
removeAttribute(attrName)
```

### Tham số

- `attrName`
  - : Một chuỗi specifying the name of the attribute to remove from the
    element. If the specified attribute does not exist, `removeAttribute()`
    trả về without generating an error.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ghi chú sử dụng

You should use `removeAttribute()` instead of setting the attribute value to `null` either directly or using {{domxref("Element.setAttribute", "setAttribute()")}}.
Many attributes will not behave as expected if you set them to `null`.

## Ví dụ

```js
// Given: <div id="div1" disabled width="200px">
document.getElementById("div1").removeAttribute("disabled");
// Now: <div id="div1" width="200px">
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.hasAttribute()")}}
- {{domxref("Element.getAttribute()")}}
- {{domxref("Element.setAttribute()")}}
- {{domxref("Element.toggleAttribute()")}}
