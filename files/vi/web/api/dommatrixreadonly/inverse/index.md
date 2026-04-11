---
title: "DOMMatrixReadOnly: inverse() method"
short-title: inverse()
slug: Web/API/DOMMatrixReadOnly/inverse
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.inverse
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`inverse()`** của giao diện {{domxref("DOMMatrixReadOnly")}} tạo một ma trận mới là nghịch đảo của ma trận gốc. Nếu ma trận không thể nghịch đảo, tất cả các thành phần của ma trận mới sẽ được đặt thành `NaN` và thuộc tính {{domxref("DOMMatrixReadOnly.is2D", "is2D")}} của nó được đặt thành `false`. Ma trận gốc không bị thay đổi.

Để thay đổi ma trận khi nghịch đảo, hãy xem {{domxref("DOMMatrix.invertSelf()")}}.

## Cú pháp

```js-nolint
inverse()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("DOMMatrix")}}.

## Ví dụ

```js
const matrix = new DOMMatrixReadOnly().rotate(30);
const invertedMatrix = matrix.inverse();
console.log(matrix.toString());
// output: matrix(0.866, 0.5, -0.5, 0.866, 0, 0)
console.log(invertedMatrix.toString());
// output: matrix(0.866, -0.5, 0.5, 0.866, 0, 0)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix.invertSelf()")}}
- {{domxref("DOMMatrixReadOnly.flipX()")}}
- {{domxref("DOMMatrixReadOnly.flipY()")}}
- CSS {{CSSxRef("transform-function/matrix", "matrix()")}} function
- CSS {{CSSxRef("transform-function/matrix3d", "matrix3d()")}} function
