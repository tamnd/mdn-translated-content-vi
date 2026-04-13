---
title: "StylePropertyMap: clear() method"
short-title: clear()
slug: Web/API/StylePropertyMap/clear
page-type: web-api-instance-method
browser-compat: api.StylePropertyMap.clear
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức **`clear()`** của giao diện {{domxref("StylePropertyMap")}} xóa tất cả các khai báo trong `StylePropertyMap`.

## Cú pháp

```js-nolint
clear()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau xóa tất cả các kiểu trong [thuộc tính style](/en-US/docs/Web/HTML/Reference/Global_attributes/style) của phần tử.

```js
// lấy phần tử button
const buttonEl = document.querySelector(".example");

// xóa tất cả các kiểu từ thuộc tính style
buttonEl.attributeStyleMap.clear();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
