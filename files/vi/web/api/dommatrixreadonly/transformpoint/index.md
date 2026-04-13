---
title: "DOMMatrixReadOnly: transformPoint() method"
short-title: transformPoint()
slug: Web/API/DOMMatrixReadOnly/transformPoint
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.transformPoint
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`transformPoint`** của giao diện {{domxref("DOMMatrixReadOnly")}} tạo một đối tượng {{domxref("DOMPoint")}} mới, biến đổi một điểm được chỉ định bằng ma trận. Cả ma trận lẫn điểm gốc đều không bị thay đổi.

Bạn cũng có thể tạo một `DOMPoint` mới bằng cách áp dụng ma trận lên một điểm với phương thức {{domxref("DOMPointReadOnly.matrixTransform()")}}.

## Cú pháp

```js-nolint
transformPoint()
transformPoint(point)
```

### Tham số

- `point`
  - : Một thực thể {{domxref("DOMPoint")}} hoặc {{domxref("DOMPointReadOnly")}}, hoặc một đối tượng chứa tối đa bốn thuộc tính sau:
    - `x`
      - : Tọa độ `x` của điểm trong không gian dưới dạng số. Giá trị mặc định là `0`.
    - `y`
      - : Tọa độ `y` của điểm trong không gian dưới dạng số. Giá trị mặc định là `0`.
    - `z`
      - : Tọa độ `z`, hay độ sâu, của điểm trong không gian dưới dạng số. Giá trị mặc định là `0`; giá trị dương gần người dùng hơn và giá trị âm lùi ra phía sau màn hình.
    - `w`
      - : Giá trị phối cảnh `w` của điểm, dưới dạng số. Giá trị mặc định là `1`.

### Giá trị trả về

Một {{domxref("DOMPoint")}}.

## Ví dụ

### Biến đổi 2D

```js
const matrix = new DOMMatrixReadOnly();
const point = new DOMPointReadOnly(10, 20); // DOMPointReadOnly {x: 10, y: 20, z: 0, w: 1}
let newPoint = matrix.transformPoint(point); // DOMPoint {x: 10, y: 20, z: 0, w: 1}
```

### Biến đổi 3D

Trong ví dụ này, chúng ta áp dụng một điểm 3D lên một ma trận 3D:

```js
// Ma trận với translate(22, 37, 10) được áp dụng
const matrix3D = new DOMMatrixReadOnly([
  1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 22, 37, 10, 1,
]);
const point3D = new DOMPointReadOnly(5, 10, 3); // DOMPointReadOnly {x: 5, y: 10, z: 3, w: 1}
const transformedPoint3D = point3D.matrixTransform(matrix3D); // DOMPoint {x: 27, y: 47, z: 13, w: 1}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPointReadOnly.matrixTransform()")}}
- CSS {{cssxref("transform-function/matrix", "matrix()")}} and {{cssxref("transform-function/matrix3d", "matrix3d()")}} functions
