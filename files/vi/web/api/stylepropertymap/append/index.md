---
title: "StylePropertyMap: append() method"
short-title: append()
slug: Web/API/StylePropertyMap/append
page-type: web-api-instance-method
browser-compat: api.StylePropertyMap.append
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức **`append()`** của giao diện {{domxref("StylePropertyMap")}} thêm giá trị CSS đã truyền vào `StylePropertyMap` với thuộc tính đã cho.

## Cú pháp

```js-nolint
append(property, value)
```

### Tham số

- `property`
  - : Một định danh chỉ ra tính năng kiểu dáng (ví dụ: font, width, background color) cần thêm.
- `value`
  - : Giá trị mà thuộc tính đã cho nên có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này cho thấy một giá trị hình ảnh nền bổ sung được thêm vào thuộc tính {{cssxref('background-image')}} của phần tử, sử dụng {{domxref('HTMLElement.attributeStyleMap')}}.

```js
// lấy phần tử button
const buttonEl = document.querySelector("button");

// thêm một giá trị khác vào thuộc tính background-image được đặt trên thuộc tính
buttonEl.attributeStyleMap.append(
  "background-image",
  "linear-gradient(180deg, blue, black)",
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
