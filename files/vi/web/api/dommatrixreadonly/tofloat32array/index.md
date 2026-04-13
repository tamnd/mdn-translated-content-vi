---
title: "DOMMatrixReadOnly: toFloat32Array() method"
short-title: toFloat32Array()
slug: Web/API/DOMMatrixReadOnly/toFloat32Array
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.toFloat32Array
---

{{APIRef("DOM")}}

Phương thức **`toFloat32Array()`** của giao diện {{domxref("DOMMatrixReadOnly")}} trả về một {{jsxref("Float32Array")}} mới chứa tất cả 16 phần tử (`m11`, `m12`, `m13`, `m14`, `m21`, `m22`, `m23`, `m24`, `m31`, `m32`, `m33`, `m34`, `m41`, `m42`, `m43`, `m44`) tạo nên ma trận. Các phần tử được lưu vào mảng dưới dạng số thực dấu phẩy động độ chính xác đơn theo thứ tự cột chính (truy cập cộng cột, hay "colex"). (Nói cách khác, từ trên xuống dưới theo cột đầu tiên, rồi cột thứ hai, và cứ như vậy.)

Để dùng số thực dấu phẩy động độ chính xác kép, hãy xem {{domxref("DOMMatrixReadOnly.toFloat64Array()")}}.

## Cú pháp

```js-nolint
toFloat32Array()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Float32Array")}}; mảng gồm 16 giá trị phần tử của ma trận.

## Ví dụ

### Sử dụng cơ bản

```js
const matrix = new DOMMatrixReadOnly();
const float32 = matrix.translate(20, 30, 50).toFloat32Array();
console.log(float32); // Float64Array(16) [ 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 20, 30, 0, 1 ] ]
console.log(`m41: ${float32[12]}, m42: ${float32[13]}, m43: ${float32[14]}`); // m41: 20, m42: 30, M44: 40
```

### Độ chính xác đơn

Có nhiều cách để truy cập các giá trị của một ma trận. Ví dụ này xoay ma trận 30 độ, lưu trạng thái đã xoay dưới dạng đối tượng JSON bằng phương thức {{domxref("DOMMatrixReadOnly.toJSON()")}} và dưới dạng mảng độ chính xác đơn bằng phương thức `toFloat32Array()`.

```js
const matrix = new DOMMatrixReadOnly();
const json = matrix.rotate(30).toJSON();
const float32 = matrix.rotate(30).toFloat32Array();

console.log(`a: ${json["a"]}, b: ${json["b"]}`); // a: 0.8660254037844387, b: 0.49999999999999994
console.log(`a: ${float32[0]}, b: ${float32[1]}`); // a: 0.8660253882408142, b: 0.5
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.toFloat64Array()")}}
- {{domxref("DOMMatrix.setMatrixValue()")}}
