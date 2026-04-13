---
title: "DOMMatrixReadOnly: DOMMatrixReadOnly() constructor"
short-title: DOMMatrixReadOnly()
slug: Web/API/DOMMatrixReadOnly/DOMMatrixReadOnly
page-type: web-api-constructor
browser-compat: api.DOMMatrixReadOnly.DOMMatrixReadOnly
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Hàm khởi tạo **`DOMMatrixReadOnly()`** tạo một đối tượng {{domxref("DOMMatrixReadOnly")}} mới biểu diễn ma trận 4x4, phù hợp cho các phép toán 2D và 3D.

## Cú pháp

```js-nolint
new DOMMatrixReadOnly()
new DOMMatrixReadOnly(initString)
new DOMMatrixReadOnly(initArray)
```

### Tham số

- `initString` {{optional_inline}}
  - : Một chuỗi biểu diễn ma trận 2D hoặc 3D theo định dạng CSS {{cssxref("transform-function/matrix", "matrix()")}} hoặc {{cssxref("transform-function/matrix3d", "matrix3d()")}}.
- `initArray` {{optional_inline}}
  - : Một mảng chứa 6 hoặc 16 số theo thứ tự cột chính. Các độ dài mảng khác sẽ ném ra {{jsxref("TypeError")}}.
    - Mảng 6 phần tử được hiểu là các thành phần ma trận `[m11, m12, m21, m22, m41, m42]`, tạo ma trận 2D.
    - Mảng 16 phần tử được hiểu là các thành phần ma trận `[m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, m41, m42, m43, m44]`, tạo ma trận 3D.

    Nếu tham số này bị bỏ qua, ma trận đơn vị sẽ được tạo, tương đương với `[1, 0, 0, 1, 0, 0]`.

    Nếu tham số này được cung cấp dưới dạng {{jsxref("Float32Array")}} hoặc {{jsxref("Float64Array")}}, hãy cân nhắc sử dụng các phương thức tĩnh hiệu quả hơn {{domxref("DOMMatrixReadOnly.fromFloat32Array_static", "DOMMatrixReadOnly.fromFloat32Array()")}} hoặc {{domxref("DOMMatrixReadOnly.fromFloat64Array_static", "DOMMatrixReadOnly.fromFloat64Array()")}} thay thế.

### Giá trị trả về

Một đối tượng {{domxref("DOMMatrixReadOnly")}} mới.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu tham số không phải là chuỗi hoặc mảng có độ dài khác 6 hoặc 16.
- {{jsxref("SyntaxError")}}
  - : Được ném ra nếu tham số chuỗi không ở định dạng CSS {{cssxref("transform-function/matrix", "matrix()")}} hoặc {{cssxref("transform-function/matrix3d", "matrix3d()")}} hợp lệ.

## Ví dụ

### Tạo DOMMatrixReadOnly từ chuỗi

```js
const matrixFromString = new DOMMatrixReadOnly("matrix(1, 0, 0, 1, 10, 20)");
console.log(matrixFromString.toJSON());
// Output: {a: 1, b: 0, c: 0, d: 1, e: 10, f: 20}
```

### Tạo DOMMatrixReadOnly từ mảng

```js
const matrixFromArray = new DOMMatrixReadOnly([1, 0, 0, 1, 10, 20]);
console.log(matrixFromArray.toJSON());
// Output: {a: 1, b: 0, c: 0, d: 1, e: 10, f: 20}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.fromFloat32Array_static", "DOMMatrixReadOnly.fromFloat32Array()")}}
- {{domxref("DOMMatrixReadOnly.fromFloat64Array_static", "DOMMatrixReadOnly.fromFloat64Array()")}}
- {{domxref("DOMMatrixReadOnly.fromMatrix_static", "DOMMatrixReadOnly.fromMatrix()")}}
