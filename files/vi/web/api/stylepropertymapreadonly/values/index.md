---
title: "StylePropertyMapReadOnly: phương thức values()"
short-title: values()
slug: Web/API/StylePropertyMapReadOnly/values
page-type: web-api-instance-method
browser-compat: api.StylePropertyMapReadOnly.values
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức **`StylePropertyMapReadOnly.values()`** trả về một _iterator mảng_ mới chứa các giá trị của mỗi chỉ mục trong đối tượng `StylePropertyMapReadOnly`.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} mới.

## Ví dụ

Trong ví dụ này, sử dụng phương thức `values()` để truy cập các giá trị trong [`Element.computedStyleMap()`](/en-US/docs/Web/API/Element/computedStyleMap).

```js
// get a button element
const buttonEl = document.querySelector("button");

// we can retrieve all computed styles with `computedStyleMap`
const allComputedStyles = buttonEl.computedStyleMap();

// values returns an iterable list of the CSS values
const vals = allComputedStyles.values();
console.log(vals.next().value); // returns a CSSStyleValue
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
