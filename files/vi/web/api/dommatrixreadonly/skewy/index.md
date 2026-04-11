---
title: "DOMMatrixReadOnly: skewY() method"
short-title: skewY()
slug: Web/API/DOMMatrixReadOnly/skewY
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.skewY
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `skewY()` của giao diện {{domxref("DOMMatrixReadOnly")}} trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách áp dụng phép biến đổi xiên được chỉ định lên ma trận nguồn dọc theo trục y. Ma trận gốc không bị thay đổi.

Để thay đổi ma trận khi làm xiên dọc theo trục y, hãy xem {{domxref("DOMMatrix.skewYSelf()")}}.

## Cú pháp

```js-nolint
skewY()
skewY(sY)
```

### Tham số

- `sY`
  - : Một số; góc tính bằng độ để làm xiên ma trận dọc theo trục y.

### Giá trị trả về

Một [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix).

## Ví dụ

```js
const matrix = new DOMMatrix(); // tạo một ma trận
console.log(matrix.toString()); // giá trị gốc
// "matrix(1, 0, 0, 1, 0, 0)"

console.log(matrix.skewY(14).toString()); // làm xiên dọc theo trục y
// "matrix(1, -0.25, 0, 1, 0, 0)"

console.log(matrix.toString()); // ma trận gốc không thay đổi
// "matrix(1, 0, 0, 1, 0, 0)"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix.skewYSelf()")}}
- {{domxref("DOMMatrixReadOnly.skewX()")}}
- CSS {{cssxref("transform")}} property and the {{cssxref("transform-function/skew", "skew()")}}, {{cssxref("transform-function/skewY", "skewY()")}}, and {{cssxref("transform-function/matrix", "matrix()")}} functions
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface's {{domxref("CanvasRenderingContext2D.transform()", "transform()")}} method
