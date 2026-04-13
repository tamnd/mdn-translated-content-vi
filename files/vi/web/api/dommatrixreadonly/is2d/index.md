---
title: "DOMMatrixReadOnly: is2D property"
short-title: is2D
slug: Web/API/DOMMatrixReadOnly/is2D
page-type: web-api-instance-property
browser-compat: api.DOMMatrixReadOnly.is2D
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`is2D`** của giao diện {{domxref("DOMMatrixReadOnly")}} là cờ Boolean có giá trị `true` khi ma trận là 2D. Giá trị là `true` nếu ma trận được khởi tạo là ma trận 2D và chỉ có các phép biến đổi 2D được áp dụng. Ngược lại, ma trận được định nghĩa trong không gian 3D và `is2D` là `false`.

## Giá trị

Một giá trị Boolean.

## Ví dụ

```js
// Khởi tạo ma trận 2D
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.is2D); // output: true

// Biến đổi trong không gian 2D
console.log(matrix.rotate(30).is2D); // output: true

// Áp dụng phép biến đổi 3D
console.log(matrix.rotate(10, 20, 1).is2D); // output: false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSTransformValue.is2D")}}
- {{domxref("CSSTransformComponent.is2D")}}
- CSS {{cssxref("transform-function")}} functions
- CSS {{cssxref("transform")}} property
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface
