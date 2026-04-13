---
title: "StylePropertyMap: delete() method"
short-title: delete()
slug: Web/API/StylePropertyMap/delete
page-type: web-api-instance-method
browser-compat: api.StylePropertyMap.delete
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức **`delete()`** của giao diện {{domxref("StylePropertyMap")}} xóa khai báo CSS với thuộc tính đã cho.

## Cú pháp

```js-nolint
delete(property)
```

### Tham số

- `property`
  - : Một định danh chỉ ra tính năng kiểu dáng (ví dụ: font, width, background color) cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau xóa thuộc tính {{cssxref('background-image')}} khỏi [thuộc tính style](/en-US/docs/Web/HTML/Reference/Global_attributes/style) của phần tử.

```js
// lấy phần tử button
const buttonEl = document.querySelector("button");

// xóa background-image khỏi thuộc tính style
buttonEl.attributeStyleMap.delete("background-image");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
