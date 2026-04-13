---
title: "DOMMatrixReadOnly: rotateAxisAngle() method"
short-title: rotateAxisAngle()
slug: Web/API/DOMMatrixReadOnly/rotateAxisAngle
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.rotateAxisAngle
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `rotateAxisAngle()` của giao diện {{domxref("DOMMatrixReadOnly")}} trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách xoay ma trận nguồn theo vectơ và góc cho trước. Ma trận gốc không bị thay đổi.

Để thay đổi ma trận khi xoay, hãy xem {{domxref("DOMMatrix.rotateAxisAngleSelf()")}}.

## Cú pháp

```js-nolint
rotateAxisAngle()
rotateAxisAngle(rotX)
rotateAxisAngle(rotX, rotY)
rotateAxisAngle(rotX, rotY, rotZ)
rotateAxisAngle(rotX, rotY, rotZ, angle)
```

### Tham số

- `rotX`
  - : Một số; tọa độ x của vectơ biểu thị trục xoay. Nếu khác không, {{domxref("DOMMatrixReadOnly.is2D", "is2D")}} là false.
- `rotY` {{optional_inline}}
  - : Một số; tọa độ y của vectơ biểu thị trục xoay. Nếu không được xác định, giá trị `rotX` sẽ được sử dụng. Nếu khác không, {{domxref("DOMMatrixReadOnly.is2D", "is2D")}} là false.
- `rotZ` {{optional_inline}}
  - : Một số; tọa độ z của vectơ biểu thị trục xoay. Nếu không được xác định, giá trị `rotX` sẽ được sử dụng.
- `angle` {{optional_inline}}
  - : Một số; góc xoay quanh vectơ trục, tính bằng độ.

### Giá trị trả về

Một [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix).

## Ví dụ

```js
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.rotateAxisAngle().toString()); // matrix(1, 0, 0, 1, 0, 0)
console.log(matrix.rotateAxisAngle(10, 20, 30).toString()); // matrix(1, 0, 0, 1, 0, 0)
console.log(matrix.rotateAxisAngle(10, 20, 30, 45).toString());
/* matrix3d(
    0.728, 0.609, -0.315, 0, 
    -0.525, 0.791, 0.315, 0, 
    0.441, -0.063, 0.895, 
    0, 0, 0, 0, 1) */
console.log(matrix.rotateAxisAngle(5, 5, 5, -45).toString());
/* matrix3d(
    0.805, -0.311, 0.506, 0, 
    0.506, 0.805, -0.311, 0, 
    -0.311, 0.506, 0.805, 0, 
    0, 0, 0, 1) */
console.log(matrix.toString()); // output: "matrix(1, 0, 0, 1, 0, 0)" (không thay đổi)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix.rotateAxisAngleSelf()")}}
- {{domxref("DOMMatrixReadOnly.rotate()")}}
- {{domxref("DOMMatrixReadOnly.rotateFromVector()")}}
- CSS {{cssxref("transform")}} property and {{cssxref("transform-function/rotate3d", "rotate3d()")}} function
- CSS {{cssxref("rotate")}} property
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface and {{domxref("CanvasRenderingContext2D.rotate()", "rotate()")}} method
