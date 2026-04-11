---
title: "DOMMatrixReadOnly: isIdentity property"
short-title: isIdentity
slug: Web/API/DOMMatrixReadOnly/isIdentity
page-type: web-api-instance-property
browser-compat: api.DOMMatrixReadOnly.isIdentity
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`isIdentity`** của giao diện {{domxref("DOMMatrixReadOnly")}} là một Boolean có giá trị `true` nếu ma trận là [ma trận đơn vị](https://en.wikipedia.org/wiki/Identity_matrix).

Ma trận đơn vị là ma trận trong đó mọi giá trị đều là `0` _ngoại trừ_ những giá trị trên đường chéo chính từ góc trên bên trái đến góc dưới bên phải (nói cách khác, những vị trí mà độ lệch theo mỗi hướng bằng nhau).

## Giá trị

Một giá trị Boolean.

## Ví dụ

```js
// Khởi tạo ma trận 2D
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.isIdentity); // output: true

// Áp dụng phép biến đổi không có hiệu lực
console.log(matrix.translate(0).isIdentity); // output: true

// Áp dụng phép biến đổi có hiệu lực: xoay ma trận 30 độ
console.log(matrix.rotate(30).isIdentity); // output: false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix")}} interface
- {{domxref("CSSMatrixComponent")}} interface
- {{domxref("CanvasRenderingContext2D")}} interface
- CSS {{cssxref("transform-function/matrix()")}} function
- CSS {{cssxref("transform")}} property
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
