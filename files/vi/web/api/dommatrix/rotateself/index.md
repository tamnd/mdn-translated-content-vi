---
title: "DOMMatrix: rotateSelf() method"
short-title: rotateSelf()
slug: Web/API/DOMMatrix/rotateSelf
page-type: web-api-instance-method
browser-compat: api.DOMMatrix.rotateSelf
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `rotateSelf()` của giao diện {{domxref("DOMMatrix")}} là phương thức biến đổi có thể thay đổi, sửa đổi một ma trận. Nó xoay ma trận nguồn quanh từng trục theo số độ được chỉ định và trả về ma trận đã được xoay.

Để xoay ma trận mà không làm thay đổi nó, hãy xem {{domxref("DOMMatrixReadOnly.rotate()")}}

## Cú pháp

```js-nolint
rotateSelf()
rotateSelf(rotX)
rotateSelf(rotX, rotY)
rotateSelf(rotX, rotY, rotZ)
```

### Tham số

- `rotX`
  - : Một số; tọa độ x của vectơ biểu thị trục xoay.
- `rotY` {{optional_inline}}
  - : Một số; tọa độ y của vectơ biểu thị trục xoay.
- `rotZ` {{optional_inline}}
  - : Một số; tọa độ z của vectơ biểu thị trục xoay.

Nếu chỉ một tham số được truyền vào, `rotZ` là giá trị của `rotX`, và cả `rotX` lẫn `rotY` đều là `0`, và phép xoay là xoay 2D. Nếu `rotX` và `rotY` khác không, [`is2D`](/en-US/docs/Web/API/DOMMatrixReadOnly/is2D) là `false`.

### Giá trị trả về

Trả về chính nó; [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix) đã được xoay theo các vectơ cho trước.

## Ví dụ

```js
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.toString()); // output: "matrix(1, 0, 0, 1, 0, 0)"
matrix.rotateSelf(30); // thay đổi nó
console.log(matrix); // output: "matrix(0.866, 0.5, -0.5, 0.866, 0, 0)"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.rotate()")}}
- CSS {{cssxref("transform")}} property
- CSS {{cssxref("rotate")}} property
- CSS {{cssxref("transform-function")}} functions
  - {{cssxref("transform-function/rotate", "rotate()")}}
  - {{cssxref("transform-function/rotate3d", "rotate3d()")}}
  - {{cssxref("transform-function/rotateX", "rotateX()")}}
  - {{cssxref("transform-function/rotateY", "rotateY()")}}
  - {{cssxref("transform-function/rotateZ", "rotateZ()")}}
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface methods
  - {{domxref("CanvasRenderingContext2D.rotate()")}}
  - {{domxref("CanvasRenderingContext2D.transform()")}}
  - {{domxref("CanvasRenderingContext2D.setTransform()")}}
  - {{domxref("CanvasRenderingContext2D.resetTransform()")}}
