---
title: "DOMMatrix: translateSelf() method"
short-title: translateSelf()
slug: Web/API/DOMMatrix/translateSelf
page-type: web-api-instance-method
browser-compat: api.DOMMatrix.translateSelf
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `translateSelf()` của giao diện {{domxref("DOMMatrix")}} là phương thức biến đổi có thể thay đổi, sửa đổi một ma trận. Nó áp dụng các vectơ được chỉ định và trả về ma trận đã được cập nhật. Vectơ mặc định là `[0, 0, 0]`.

Để dịch chuyển ma trận mà không làm thay đổi nó, hãy xem {{domxref("DOMMatrixReadOnly.translate()")}}

## Cú pháp

```js-nolint
translateSelf(translateX, translateY)
translateSelf(translateX, translateY, translateZ)
```

### Tham số

- `translateX`
  - : Một số đại diện cho hoành độ (tọa độ x) của vectơ dịch chuyển.
- `translateY`
  - : Một số đại diện cho tung độ (tọa độ y) của vectơ dịch chuyển.
- `translateZ` {{optional_inline}}
  - : Một số đại diện cho thành phần z của vectơ dịch chuyển. Nếu không được cung cấp, mặc định là 0. Nếu giá trị này khác 0, ma trận kết quả sẽ là 3D.

### Giá trị trả về

Trả về chính nó; [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix) đã được dịch chuyển theo vectơ cho trước.

## Ví dụ

```js
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.toString()); // output: "matrix(1, 0, 0, 1, 0, 0)"
matrix.translateSelf(25, 25); // thay đổi nó
console.log(matrix); // output: "matrix(1, 0, 0, 1, 25, 25)"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.translate()")}}
- CSS {{cssxref("transform")}} property
- CSS {{cssxref("translate")}} property
- CSS {{cssxref("transform-function")}} functions
  - {{cssxref("transform-function/translate", "translate()")}}
  - {{cssxref("transform-function/translate3d", "translate3d()")}}
  - {{cssxref("transform-function/translateX", "translateX()")}}
  - {{cssxref("transform-function/translateY", "translateY()")}}
  - {{cssxref("transform-function/translateZ", "translateZ()")}}
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface methods
  - {{domxref("CanvasRenderingContext2D.translate()")}}
  - {{domxref("CanvasRenderingContext2D.transform()")}}
  - {{domxref("CanvasRenderingContext2D.setTransform()")}}
  - {{domxref("CanvasRenderingContext2D.resetTransform()")}}
