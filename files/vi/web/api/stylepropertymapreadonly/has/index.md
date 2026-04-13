---
title: "StylePropertyMapReadOnly: phương thức has()"
short-title: has()
slug: Web/API/StylePropertyMapReadOnly/has
page-type: web-api-instance-method
browser-compat: api.StylePropertyMapReadOnly.has
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức **`has()`** của giao diện {{domxref("StylePropertyMapReadOnly")}} cho biết liệu thuộc tính được chỉ định có tồn tại trong đối tượng `StylePropertyMapReadOnly` hay không.

## Cú pháp

```js-nolint
has(property)
```

### Tham số

- `property`
  - : Tên của thuộc tính cần kiểm tra.

### Giá trị trả về

Một giá trị boolean.

## Ví dụ

Ví dụ này dùng phương thức `has()` để kiểm tra xem thuộc tính `padding-top` có trong thuộc tính style của phần tử button hay không.

```js
// get the button element
const buttonEl = document.querySelector(".example");

// find what's in the style attribute with attributeStyleMap and has()
const hasPadTop = buttonEl.attributeStyleMap.has("padding-top");

console.log(hasPadTop); // logs true if padding-top is present in style attribute
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
