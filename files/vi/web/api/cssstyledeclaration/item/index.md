---
title: "CSSStyleDeclaration: phương thức item()"
short-title: item()
slug: Web/API/CSSStyleDeclaration/item
page-type: web-api-instance-method
browser-compat: api.CSSStyleDeclaration.item
---

{{ APIRef("CSSOM") }}

Phương thức giao diện `CSSStyleDeclaration.item()` trả về một tên thuộc tính CSS từ một {{domxref('CSSStyleDeclaration')}} theo chỉ mục.

Phương thức này không ném ngoại lệ miễn là bạn cung cấp đối số; chuỗi rỗng được trả về nếu chỉ mục nằm ngoài phạm vi và một {{jsxref("TypeError")}} được ném nếu không có đối số nào được cung cấp.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Chỉ mục của node cần lấy. Chỉ mục bắt đầu từ 0.

### Giá trị trả về

Một chuỗi là tên của thuộc tính CSS tại chỉ mục được chỉ định.

JavaScript có cú pháp đơn giản hơn để lấy một mục từ NodeList theo chỉ mục:

```js
const propertyName = style[index];
```

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu không có đối số nào được cung cấp.

## Ví dụ

```js
const style = document.getElementById("div1").style;
const propertyName = style.item(1); // hoặc style[1] - trả về kiểu thứ hai được liệt kê
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
