---
title: "StylePropertyMapReadOnly: phương thức keys()"
short-title: keys()
slug: Web/API/StylePropertyMapReadOnly/keys
page-type: web-api-instance-method
browser-compat: api.StylePropertyMapReadOnly.keys
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức **`StylePropertyMapReadOnly.keys()`** trả về một _iterator mảng_ mới chứa các khóa của mỗi phần tử trong `StylePropertyMapReadOnly`.

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} mới.

## Ví dụ

Trong ví dụ này, sử dụng phương thức `keys()` để truy cập các thuộc tính trong {{domxref('Element.computedStyleMap()')}}.

```js
// get a button element
const buttonEl = document.querySelector("button");

// we can retrieve all computed styles with `computedStyleMap`
const allComputedStyles = buttonEl.computedStyleMap();

// keys returns an iterable list of properties
const props = allComputedStyles.keys();
console.log(props.next().value); // returns align-content
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
