---
title: "DOMMatrix: fromFloat32Array() static method"
short-title: fromFloat32Array()
slug: Web/API/DOMMatrix/fromFloat32Array_static
page-type: web-api-static-method
browser-compat: api.DOMMatrix.fromFloat32Array_static
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức tĩnh **`fromFloat32Array()`** của giao diện {{domxref("DOMMatrix")}} tạo một đối tượng {{domxref("DOMMatrix")}} mới từ một mảng các giá trị số thực dấu phẩy động độ chính xác đơn (32-bit).

Nếu mảng có 6 giá trị, kết quả là ma trận 2D; nếu mảng có 16 giá trị, kết quả là ma trận 3D. Ngược lại, ngoại lệ {{jsxref("TypeError")}} sẽ được ném ra.

## Cú pháp

```js-nolint
DOMMatrix.fromFloat32Array(array)
```

### Tham số

- `array`
  - : Một {{jsxref("Float32Array")}} với 6 hoặc 16 phần tử theo thứ tự cột chính.

### Giá trị trả về

Một đối tượng {{domxref("DOMMatrix")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu độ dài của tham số `array` không phải là 6 hoặc 16.

## Ví dụ

### Tạo ma trận 2D từ Float32Array

Ví dụ này tạo một ma trận 2D từ `Float32Array` có 6 phần tử.

```js
const float32Array = new Float32Array([1, 0, 0, 1, 10, 20]);
const matrix2D = DOMMatrix.fromFloat32Array(float32Array);

console.log(matrix2D.toString());
// Output: matrix(1, 0, 0, 1, 10, 20)

console.log(matrix2D.is2D);
// Output: true
```

### Tạo ma trận 3D từ Float32Array

Ví dụ này tạo một ma trận 3D từ `Float32Array` có 16 phần tử.

```js
const float32Array = new Float32Array([
  1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 10, 20, 30, 1,
]);
const matrix3D = DOMMatrix.fromFloat32Array(float32Array);

console.log(matrix3D.is2D);
// Output: false

console.log(matrix3D.m41, matrix3D.m42, matrix3D.m43);
// Output: 10 20 30
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix/DOMMatrix", "DOMMatrix()")}}
- {{domxref("DOMMatrixReadOnly.toFloat32Array()")}}
- {{domxref("DOMMatrixReadOnly.toFloat64Array()")}}
- {{domxref("DOMMatrix.fromFloat64Array_static", "DOMMatrix.fromFloat64Array()")}}
- {{domxref("DOMMatrix.fromMatrix_static", "DOMMatrix.fromMatrix()")}}
