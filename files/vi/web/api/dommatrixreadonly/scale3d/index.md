---
title: "DOMMatrixReadOnly: scale3d() method"
short-title: scale3d()
slug: Web/API/DOMMatrixReadOnly/scale3d
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.scale3d
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`scale3d()`** của giao diện {{domxref("DOMMatrixReadOnly")}} tạo một ma trận mới là kết quả của phép biến đổi thu phóng 3D được áp dụng lên ma trận. Nó trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách thu phóng ma trận 3D nguồn theo hệ số tỷ lệ cho trước lấy tâm tại điểm gốc tọa độ được chỉ định bởi các tham số gốc, với gốc tọa độ mặc định là `(0, 0, 0)`. Ma trận gốc không bị thay đổi.

Để thay đổi ma trận khi thu phóng 3D, hãy xem {{domxref("DOMMatrix.scale3dSelf()")}}

## Cú pháp

```js-nolint
scale3d()
scale3d(scale)
scale3d(scale, originX)
scale3d(scale, originX, originY)
scale3d(scale, originX, originY, originZ)
```

### Tham số

- `scale`
  - : Hệ số nhân; giá trị tỷ lệ. Nếu không có tỷ lệ nào được cung cấp, mặc định là `1`.
- `originX` {{optional_inline}}
  - : Tọa độ x của gốc biến đổi. Nếu không có gốc tọa độ nào được cung cấp, mặc định là `0`.
- `originY` {{optional_inline}}
  - : Tọa độ y của gốc biến đổi. Nếu không có gốc tọa độ nào được cung cấp, mặc định là `0`.
- `originZ` {{optional_inline}}
  - : Tọa độ z của gốc biến đổi. Nếu giá trị này là `0`, là mặc định nếu bị bỏ qua, ma trận kết quả có thể không phải 3D.

### Giá trị trả về

Một {{domxref("DOMMatrix")}}.

## Ví dụ

```js
const matrix = new DOMMatrix();
console.log(matrix.toString()); // không có phép biến đổi nào được áp dụng
// matrix(1, 0, 0, 1, 0, 0)

console.log(matrix.scale3d(2).toString());
/* matrix3d(
    2, 0, 0, 0, 
    0, 2, 0, 0, 
    0, 0, 2, 0, 
    0, 0, 0, 1) */
console.log(matrix.scale3d(0.5, 25, 25, 1.25).toString());
/* matrix3d(
    0.5, 0, 0, 0, 
    0, 0.5, 0, 0, 
    0, 0, 0.5, 0, 1
    2.5, 12.5, 0.625, 1) */
console.log(matrix.toString()); // ma trận gốc không thay đổi
// matrix(1, 0, 0, 1, 0, 0)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix.scale3dSelf()")}}
- {{domxref("DOMMatrixReadOnly.scale()")}}
- CSS {{cssxref("transform")}} property and {{cssxref("transform-function/scale3d", "scale3d()")}} and {{cssxref("transform-function/matrix3d", "matrix3d()")}} functions
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface's {{domxref("CanvasRenderingContext2D.transform()")}} method
