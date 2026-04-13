---
title: "StylePropertyMap: set() method"
short-title: set()
slug: Web/API/StylePropertyMap/set
page-type: web-api-instance-method
browser-compat: api.StylePropertyMap.set
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức **`set()`** của giao diện {{domxref("StylePropertyMap")}} thay đổi khai báo CSS với thuộc tính đã cho.

## Cú pháp

```js-nolint
set(property, value)
```

### Tham số

- `property`
  - : Một định danh chỉ ra tính năng kiểu dáng (ví dụ: font, width, background color) cần thay đổi.
- `value`
  - : Giá trị mà thuộc tính đã cho nên có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này đặt thuộc tính {{cssxref('padding-top')}} với giá trị đã cho trong [thuộc tính style](/en-US/docs/Web/HTML/Reference/Global_attributes/style) của phần tử.

```js
// lấy phần tử button
const buttonEl = document.querySelector("button");

// đặt padding-top trên thuộc tính style của button
buttonEl.attributeStyleMap.set("padding-top", CSS.px(10));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
