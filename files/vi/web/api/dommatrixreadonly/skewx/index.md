---
title: "DOMMatrixReadOnly: skewX() method"
short-title: skewX()
slug: Web/API/DOMMatrixReadOnly/skewX
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.skewX
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `skewX()` của giao diện {{domxref("DOMMatrixReadOnly")}} trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách áp dụng phép biến đổi xiên được chỉ định lên ma trận nguồn dọc theo trục x. Ma trận gốc không bị thay đổi.

Để thay đổi ma trận khi làm xiên dọc theo trục x, hãy xem {{domxref("DOMMatrix.skewXSelf()")}}.

## Cú pháp

```js-nolint
skewX()
skewX(sX)
```

### Tham số

- `sX`
  - : Một số; góc tính bằng độ để làm xiên ma trận dọc theo trục x.

### Giá trị trả về

Một [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix).

## Ví dụ

```js
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.toString()); // không có phép biến đổi nào được áp dụng
// "matrix(1, 0, 0, 1, 0, 0)"

console.log(matrix.skewX(14).toString());
// "matrix(1, 0, 0.25, 1, 0, 0)"

console.log(matrix.toString()); // ma trận gốc không thay đổi
// "matrix(1, 0, 0, 1, 0, 0)"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.skewY()")}}
- {{domxref("DOMMatrix.skewXSelf()")}}
- CSS {{cssxref("transform")}} property and the {{cssxref("transform-function/skew", "skew()")}}, {{cssxref("transform-function/skewX", "skewX()")}}, and {{cssxref("transform-function/matrix", "matrix()")}} functions
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface's {{domxref("CanvasRenderingContext2D.transform()", "transform()")}} method
