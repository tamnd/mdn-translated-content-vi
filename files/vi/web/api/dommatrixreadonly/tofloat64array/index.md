---
title: "DOMMatrixReadOnly: toFloat64Array() method"
short-title: toFloat64Array()
slug: Web/API/DOMMatrixReadOnly/toFloat64Array
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.toFloat64Array
---

{{APIRef("DOM")}}

Phương thức **`toFloat64Array()`** của giao diện {{domxref("DOMMatrixReadOnly")}} trả về một {{jsxref("Float64Array")}} mới chứa tất cả 16 phần tử (`m11`, `m12`, `m13`, `m14`, `m21`, `m22`, `m23`, `m24`, `m31`, `m32`, `m33`, `m34`, `m41`, `m42`, `m43`, `m44`) tạo nên ma trận. Các phần tử được lưu vào mảng dưới dạng số thực dấu phẩy động độ chính xác kép theo thứ tự cột chính (truy cập cộng cột, hay "colex"). (Nói cách khác, từ trên xuống dưới theo cột đầu tiên, rồi cột thứ hai, và cứ như vậy.)

## Cú pháp

```js-nolint
toFloat64Array()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Float64Array")}}; mảng gồm 16 giá trị phần tử của ma trận.

## Ví dụ

```js
const matrix = new DOMMatrixReadOnly();
let float64 = matrix.translate(20, 30, 50).toFloat64Array();
console.log(float64); // Float64Array(16) [ 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 20, 30, 0, 1 ] ]
console.log(`m41: ${float64[12]}, m42: ${float64[13]}, m43: ${float64[14]}`); // m41: 20, m42: 30, M44: 40

float64 = matrix.rotate(30).toFloat64Array();
console.log(float64);
console.log(`m11: ${float64[0]}, m12: ${float64[1]}`); // m11: 0.8660254037844387, m12: 0.49999999999999994
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.toFloat32Array()")}}
- {{domxref("DOMMatrix.setMatrixValue()")}}
