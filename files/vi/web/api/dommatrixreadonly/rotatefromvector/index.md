---
title: "DOMMatrixReadOnly: rotateFromVector() method"
short-title: rotateFromVector()
slug: Web/API/DOMMatrixReadOnly/rotateFromVector
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.rotateFromVector
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `rotateFromVector()` của giao diện {{domxref("DOMMatrixReadOnly")}} trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách xoay ma trận nguồn theo góc giữa vectơ được chỉ định và `(1, 0)`. Góc xoay được xác định bởi góc giữa vectơ `(1,0)T` và `(x,y)T` theo chiều kim đồng hồ, hoặc `(+/-)arctan(y/x)`. Nếu cả `x` và `y` đều là `0`, góc được xác định là `0`. Ma trận gốc không bị thay đổi.

Để thay đổi ma trận khi xoay theo góc giữa vectơ được chỉ định và `(1, 0)`, hãy xem {{domxref("DOMMatrix.rotateFromVectorSelf()")}}.

## Cú pháp

```js-nolint
rotateFromVector()
rotateFromVector(rotX)
rotateFromVector(rotX, rotY)
```

### Tham số

- `rotX` {{optional_inline}}
  - : Một số; tọa độ x của vectơ x,y xác định góc xoay. Nếu không được xác định, `0` được sử dụng.
- `rotY` {{optional_inline}}
  - : Một số; tọa độ y của vectơ x,y xác định góc xoay. Nếu không được xác định, `0` được sử dụng.

### Giá trị trả về

Một [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix).

## Ví dụ

```js
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.toString()); // giá trị gốc
// output: "matrix(1, 0, 0, 1, 0, 0)"

console.log(matrix.rotateFromVector().toString()); // mặc định là `0`
// output: matrix(1, 0, 0, 1, 0, 0)

console.log(matrix.rotateFromVector(10, 20).toString());
// matrix(0.447, 0.894, -0.894, 0.447, 0, 0)

console.log(matrix.rotateFromVector(-5, 5).toString());
// matrix(-0.707, 0.707, -0.707, -0.707, 0, 0)

console.log(matrix.toString()); // ma trận không thay đổi
// output: "matrix(1, 0, 0, 1, 0, 0)"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix.rotateFromVectorSelf()")}}
- {{domxref("DOMMatrixReadOnly.rotate()")}}
- {{domxref("DOMMatrixReadOnly.rotateAxisAngle()")}}
- CSS {{cssxref("transform")}} property and {{cssxref("transform-function/rotate3d", "rotate3d()")}} function
- CSS {{cssxref("rotate")}} property
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface and {{domxref("CanvasRenderingContext2D.rotate()", "rotate()")}} method
