---
title: "DOMMatrixReadOnly: toString() method"
short-title: toString()
slug: Web/API/DOMMatrixReadOnly/toString
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.toString
---

{{APIRef("DOM")}}

Phương thức {{Glossary("stringifier")}} **`toString()`** của giao diện {{domxref("DOMMatrixReadOnly")}} trả về giá trị của ma trận dưới dạng chuỗi theo định dạng hàm CSS [transform function](/en-US/docs/Web/CSS/Reference/Values/transform-function) `matrix()` hoặc `matrix3d()`; danh sách các giá trị tọa độ phân cách bằng dấu phẩy gồm 6 hoặc 16 giá trị, được thêm tiền tố `"matrix(` hoặc `"matrix3d(` và hậu tố `)` tương ứng.

Đối với ma trận 2D, các phần tử [`a` đến `f`](/en-US/docs/Web/API/DOMMatrix#a) được liệt kê với tổng cộng sáu giá trị và dạng `matrix(a, b, c, d, e, f)`. Xem hàm CSS {{cssxref("transform-function/matrix", "matrix()")}} để biết chi tiết về cú pháp này.

Đối với ma trận 3D, chuỗi được trả về chứa tất cả [16 phần tử](/en-US/docs/Web/API/DOMMatrix#m11) và có dạng `matrix3d(m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, m41, m42, m43, m44)`. Xem hàm CSS {{cssxref("transform-function/matrix3d", "matrix3d()")}} để biết chi tiết về cú pháp ký hiệu 3D.

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi; danh sách các giá trị được phân cách bằng dấu phẩy, trong cú pháp hàm `matrix()` hoặc `matrix3d()`.

## Ví dụ

```js
const matrix = new DOMMatrixReadOnly();
console.log(matrix.translate(20, 30).toString()); // matrix(1, 0, 0, 1, 20, 30)
console.log(matrix.translate(30, 40, 50).toString()); // matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 30, 40, 50, 1)
console.log(matrix.skewY(15).skewX(5).rotate(3).translate(20, 50).toString());
// matrix(1.003, 0.321, 0.035, 1.01, 21.816, 56.824)
console.log(
  matrix.skewY(15).skewX(5).rotate(3).translate(20, 50, 60).toString(),
);
// matrix3d(1.003, 0.321, 0, 0, 0.0350, 1.008, 0, 0, 0, 0, 1, 0, 21.816, 56.824, 60, 1)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.toJSON()")}}
- {{domxref("DOMMatrix.setMatrixValue()")}}
