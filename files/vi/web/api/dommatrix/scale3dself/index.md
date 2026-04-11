---
title: "DOMMatrix: scale3dSelf() method"
short-title: scale3dSelf()
slug: Web/API/DOMMatrix/scale3dSelf
page-type: web-api-instance-method
browser-compat: api.DOMMatrix.scale3dSelf
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`scale3dSelf()`** của giao diện {{domxref("DOMMatrix")}} là phương thức biến đổi có thể thay đổi, sửa đổi một ma trận bằng cách áp dụng hệ số tỷ lệ được chỉ định cho cả ba trục, lấy tâm tại gốc tọa độ cho trước với gốc tọa độ mặc định là `(0, 0, 0)`, trả về ma trận 3D đã được thu phóng.

Để thu phóng 3D một ma trận mà không làm thay đổi nó, hãy xem {{domxref("DOMMatrixReadOnly.scale3d()")}}, phương thức này tạo một ma trận thu phóng mới trong khi giữ nguyên ma trận gốc.

## Cú pháp

```js-nolint
scale3dSelf()
scale3dSelf(scale)
scale3dSelf(scale, originX)
scale3dSelf(scale, originX, originY)
scale3dSelf(scale, originX, originY, originZ)
```

### Tham số

- `scale`
  - : Hệ số nhân; giá trị tỷ lệ. Nếu không có tỷ lệ nào được cung cấp, mặc định là `1`. Nếu tỷ lệ khác 1, thuộc tính {{domxref("DOMMatrixReadOnly.is2D", "is2D")}} của ma trận hiện tại sẽ được đặt thành `false`.
- `originX` {{optional_inline}}
  - : Tọa độ x của gốc biến đổi. Nếu không có gốc tọa độ nào được cung cấp, mặc định là `0`.
- `originY` {{optional_inline}}
  - : Tọa độ y của gốc biến đổi. Nếu không có gốc tọa độ nào được cung cấp, mặc định là `0`.
- `originZ` {{optional_inline}}
  - : Tọa độ z của gốc biến đổi. Nếu không có gốc tọa độ nào được cung cấp, mặc định là `0`.

### Giá trị trả về

Trả về chính nó; một {{domxref("DOMMatrix")}}.

## Ví dụ

```js
const matrix = new DOMMatrix();
console.log(matrix.scale3dSelf(2).toString());
/* matrix3d(
    2, 0, 0, 0, 
    0, 2, 0, 0, 
    0, 0, 2, 0, 
    0, 0, 0, 1) */
console.log(matrix.scale3dSelf(3.1, 25, 25, 1.25).toString());
/* matrix3d(
    6.2, 0, 0, 0,
    0, 6.2, 0, 0, 
    0, 0, 6.2, 0, 
    -105, -105, -5.25, 1) */
console.log(matrix.toString());
/* matrix3d(
    6.2, 0, 0, 0, 
    0, 6.2, 0, 0, 
    0, 0, 6.2, 0, 
    -105, -105, -5.25, 1) (giống như trên) */
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.scale3d()")}}
- {{domxref("DOMMatrix.scaleSelf()")}}
- CSS {{cssxref("transform")}} property and the {{cssxref("transform-function/scale3d", "scale3d()")}} and {{cssxref("transform-function/matrix3d", "matrix3d()")}} functions
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface {{domxref("CanvasRenderingContext2D.transform()", "transform()")}} method
