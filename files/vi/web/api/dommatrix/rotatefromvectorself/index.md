---
title: "DOMMatrix: rotateFromVectorSelf() method"
short-title: rotateFromVectorSelf()
slug: Web/API/DOMMatrix/rotateFromVectorSelf
page-type: web-api-instance-method
browser-compat: api.DOMMatrix.rotateFromVectorSelf
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `rotateFromVectorSelf()` của giao diện {{domxref("DOMMatrix")}} là phương thức biến đổi có thể thay đổi, sửa đổi một ma trận bằng cách xoay ma trận theo góc giữa vectơ được chỉ định và `(1, 0)`. Góc xoay được xác định bởi góc giữa vectơ `(1,0)T` và `(x,y)T` theo chiều kim đồng hồ, hoặc `(+/-)arctan(y/x)`. Nếu cả `x` và `y` đều là `0`, góc được xác định là `0` và ma trận không bị thay đổi.

Để xoay ma trận từ một vectơ mà không làm thay đổi nó, hãy xem {{domxref("DOMMatrixReadOnly.rotateFromVector()")}}, phương thức này tạo một ma trận xoay mới trong khi giữ nguyên ma trận gốc.

## Cú pháp

```js-nolint
rotateFromVectorSelf()
rotateFromVectorSelf(rotX)
rotateFromVectorSelf(rotX, rotY)
```

### Tham số

- `rotX` {{optional_inline}}
  - : Một số; tọa độ x của vectơ x,y xác định góc xoay. Nếu không được xác định, `0` được sử dụng.
- `rotY` {{optional_inline}}
  - : Một số; tọa độ y của vectơ x,y xác định góc xoay. Nếu không được xác định, `0` được sử dụng.

### Giá trị trả về

Trả về chính nó; [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix) đã được cập nhật.

## Ví dụ

```js
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.rotateFromVectorSelf().toString());
// output: matrix(1, 0, 0, 1, 0, 0) (không có phép xoay nào được áp dụng)
console.log(matrix.rotateFromVectorSelf(10, 20).toString());
// output: matrix(0.447, 0.894, -0.894, 0.447, 0, 0)
console.log(matrix.toString());
// output: matrix(0.447, 0.894, -0.894, 0.447, 0, 0) (giống như trên)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.rotateFromVector()")}}
- {{domxref("DOMMatrix.rotateSelf()")}}
- {{domxref("DOMMatrix.rotateAxisAngleSelf()")}}
- CSS {{cssxref("transform")}} property and {{cssxref("transform-function/rotate3d", "rotate3d()")}} function
- CSS {{cssxref("rotate")}} property
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface and {{domxref("CanvasRenderingContext2D.rotate()", "rotate()")}} method
