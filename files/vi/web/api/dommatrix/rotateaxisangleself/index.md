---
title: "DOMMatrix: rotateAxisAngleSelf() method"
short-title: rotateAxisAngleSelf()
slug: Web/API/DOMMatrix/rotateAxisAngleSelf
page-type: web-api-instance-method
browser-compat: api.DOMMatrix.rotateAxisAngleSelf
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `rotateAxisAngleSelf()` của giao diện {{domxref("DOMMatrix")}} là phương thức biến đổi xoay ma trận nguồn theo vectơ và góc cho trước, trả về ma trận đã được thay đổi.

Để xoay ma trận mà không làm thay đổi nó, hãy xem {{domxref("DOMMatrixReadOnly.rotateAxisAngle()")}}, phương thức này tạo một ma trận xoay mới trong khi giữ nguyên ma trận gốc.

## Cú pháp

```js-nolint
rotateAxisAngleSelf()
rotateAxisAngleSelf(rotX)
rotateAxisAngleSelf(rotX, rotY)
rotateAxisAngleSelf(rotX, rotY, rotZ)
rotateAxisAngleSelf(rotX, rotY, rotZ, angle)
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

Nếu cả `rotY` và `rotZ` đều thiếu, `rotZ` được đặt thành giá trị của `rotX`, và cả `rotX` lẫn `rotY` đều là `0`.

### Giá trị trả về

Một [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix).

## Ví dụ

```js
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.rotateAxisAngleSelf(10, 20, 30, 45).toString());
/* "matrix3d(
    0.728, 0.609, -0.315, 0, 
    -0.525, 0.791, 0.315, 0, 
    0.441, -0.063, 0.895, 
    0, 0, 0, 0, 1)" */
console.log(matrix.toString());
/* "matrix3d(
    0.728, 0.609, -0.315, 0, 
    -0.525, 0.791, 0.315, 0, 
    0.441, -0.063, 0.895, 0, 
    0, 0, 0, 1)" */
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.rotateAxisAngle()")}}
- {{domxref("DOMMatrix.rotateSelf()")}}
- {{domxref("DOMMatrix.rotateFromVectorSelf()")}}
- CSS {{cssxref("transform")}} property and {{cssxref("transform-function/rotate3d", "rotate3d()")}} function
- CSS {{cssxref("rotate")}} property
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface and {{domxref("CanvasRenderingContext2D.rotate()", "rotate()")}} method
