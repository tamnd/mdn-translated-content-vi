---
title: "DOMMatrixReadOnly: rotate() method"
short-title: rotate()
slug: Web/API/DOMMatrixReadOnly/rotate
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.rotate
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `rotate()` của giao diện {{domxref("DOMMatrixReadOnly")}} trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách xoay ma trận nguồn quanh từng trục theo số độ được chỉ định. Ma trận gốc không bị thay đổi.

Để thay đổi ma trận khi xoay, hãy xem {{domxref("DOMMatrix.rotateSelf()")}}.

## Cú pháp

```js-nolint
rotate()
rotate(rotX)
rotate(rotX, rotY)
rotate(rotX, rotY, rotZ)
```

### Tham số

- `rotX`
  - : Một số; tọa độ x của vectơ biểu thị trục xoay. Nếu khác không, [`is2D`](/en-US/docs/Web/API/DOMMatrixReadOnly/is2D) là false.
- `rotY` {{optional_inline}}
  - : Một số; tọa độ y của vectơ biểu thị trục xoay. Nếu khác không, [`is2D`](/en-US/docs/Web/API/DOMMatrixReadOnly/is2D) là false.
- `rotZ` {{optional_inline}}
  - : Một số; tọa độ z của vectơ biểu thị trục xoay.

Nếu chỉ truyền `rotX`, thì `rotX` được dùng làm giá trị cho tọa độ z, và cả tọa độ x lẫn y đều được đặt thành không.

### Giá trị trả về

Một [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix).

## Ví dụ

```js
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.toString());
// output: "matrix(1, 0, 0, 1, 0, 0)"

const rotated = matrix.rotate(30); // xoay và gán
console.log(matrix.toString()); // ma trận gốc không thay đổi
// output: "matrix(1, 0, 0, 1, 0, 0)"
console.log(rotated.toString());
// output: "matrix(0.866, 0.5, -0.5, 0.866, 0, 0)"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix.rotateSelf()")}}
- {{domxref("DOMMatrixReadOnly.rotateAxisAngle()")}}
- {{domxref("DOMMatrixReadOnly.rotateFromVector()")}}
- CSS {{cssxref("transform")}} property and {{cssxref("transform-function/rotate3d", "rotate3d()")}} function
- CSS {{cssxref("rotate")}} property
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface and {{domxref("CanvasRenderingContext2D.rotate()", "rotate()")}} method
