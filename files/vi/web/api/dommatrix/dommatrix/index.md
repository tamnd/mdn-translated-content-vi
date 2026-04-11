---
title: "DOMMatrix: DOMMatrix() constructor"
short-title: DOMMatrix()
slug: Web/API/DOMMatrix/DOMMatrix
page-type: web-api-constructor
browser-compat: api.DOMMatrix.DOMMatrix
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Hàm khởi tạo **`DOMMatrix()`** tạo một đối tượng {{domxref("DOMMatrix")}} mới biểu diễn ma trận 4x4, phù hợp cho các phép toán 2D và 3D.

## Cú pháp

```js-nolint
new DOMMatrix()
new DOMMatrix(initString)
new DOMMatrix(initArray)
```

### Tham số

- `initString` {{optional_inline}}
  - : Một chuỗi biểu diễn ma trận 2D hoặc 3D theo định dạng CSS {{cssxref("transform-function/matrix", "matrix()")}} hoặc {{cssxref("transform-function/matrix3d", "matrix3d()")}}.
- `initArray` {{optional_inline}}
  - : Một mảng chứa 6 hoặc 16 số theo thứ tự cột chính. Các độ dài mảng khác sẽ ném ra {{jsxref("TypeError")}}.
    - Mảng 6 phần tử được hiểu là các thành phần ma trận `[m11, m12, m21, m22, m41, m42]`, tạo ma trận 2D.
    - Mảng 16 phần tử được hiểu là các thành phần ma trận `[m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, m41, m42, m43, m44]`, tạo ma trận 3D.

    Nếu tham số này bị bỏ qua, ma trận đơn vị sẽ được tạo, tương đương với `[1, 0, 0, 1, 0, 0]`.

    Nếu tham số này được cung cấp dưới dạng {{jsxref("Float32Array")}} hoặc {{jsxref("Float64Array")}}, hãy cân nhắc sử dụng các phương thức tĩnh hiệu quả hơn {{domxref("DOMMatrix.fromFloat32Array_static", "DOMMatrix.fromFloat32Array()")}} hoặc {{domxref("DOMMatrix.fromFloat64Array_static", "DOMMatrix.fromFloat64Array()")}} thay thế.

### Giá trị trả về

Một đối tượng {{domxref("DOMMatrix")}} mới.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu tham số không phải là chuỗi hoặc mảng có độ dài khác 6 hoặc 16.
- {{jsxref("SyntaxError")}}
  - : Được ném ra nếu tham số chuỗi không ở định dạng CSS {{cssxref("transform-function/matrix", "matrix()")}} hoặc {{cssxref("transform-function/matrix3d", "matrix3d()")}} hợp lệ.

## Ví dụ

Ví dụ này tạo một DOMMatrix để sử dụng làm đối số khi gọi {{domxref("DOMPointReadOnly.matrixTransform()")}}.

```js
const point = new DOMPoint(5, 4);
const scaleX = 2;
const scaleY = 3;
const translateX = 12;
const translateY = 8;
const angle = Math.PI / 2;
const matrix = new DOMMatrix([
  Math.cos(angle) * scaleX,
  Math.sin(angle) * scaleX,
  -Math.sin(angle) * scaleY,
  Math.cos(angle) * scaleY,
  translateX,
  translateY,
]);
const transformedPoint = point.matrixTransform(matrix);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix.fromFloat32Array_static", "DOMMatrix.fromFloat32Array()")}}
- {{domxref("DOMMatrix.fromFloat64Array_static", "DOMMatrix.fromFloat64Array()")}}
- {{domxref("DOMMatrix.fromMatrix_static", "DOMMatrix.fromMatrix()")}}
