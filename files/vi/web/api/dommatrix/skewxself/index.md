---
title: "DOMMatrix: skewXSelf() method"
short-title: skewXSelf()
slug: Web/API/DOMMatrix/skewXSelf
page-type: web-api-instance-method
browser-compat: api.DOMMatrix.skewXSelf
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `skewXSelf()` của giao diện {{domxref("DOMMatrix")}} là phương thức biến đổi có thể thay đổi, sửa đổi một ma trận. Nó làm xiên ma trận nguồn bằng cách áp dụng phép biến đổi xiên được chỉ định dọc theo trục X và trả về ma trận đã bị xiên.

Để làm xiên ma trận dọc theo trục X mà không làm thay đổi nó, hãy xem {{domxref("DOMMatrixReadOnly.skewX()")}}

## Cú pháp

```js-nolint
skewXSelf()
skewXSelf(sX)
```

### Tham số

- `sX`
  - : Một số; góc tính bằng độ để làm xiên ma trận dọc theo trục X.

### Giá trị trả về

Trả về chính nó; [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix) đã bị xiên dọc theo trục X theo góc cho trước.

## Ví dụ

```js
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.toString()); // output: "matrix(1, 0, 0, 1, 0, 0)"
matrix.skewXSelf(14); // thay đổi nó
console.log(matrix); // output: "matrix(1, 0, 0.25, 1, 0, 0)"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.skewX()")}}
- CSS {{cssxref("transform")}} property
- CSS {{cssxref("transform-function")}} functions
  - {{cssxref("transform-function/skew", "skew()")}}
  - {{cssxref("transform-function/skewX", "skewX()")}}
  - {{cssxref("transform-function/skewY", "skewY()")}}
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface methods
  - {{domxref("CanvasRenderingContext2D.transform()")}}
  - {{domxref("CanvasRenderingContext2D.setTransform()")}}
  - {{domxref("CanvasRenderingContext2D.resetTransform()")}}
