---
title: "DOMPointReadOnly: matrixTransform() method"
short-title: matrixTransform()
slug: Web/API/DOMPointReadOnly/matrixTransform
page-type: web-api-instance-method
browser-compat: api.DOMPointReadOnly.matrixTransform
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`matrixTransform()`** của giao diện {{domxref("DOMPointReadOnly")}} áp dụng một phép biến đổi ma trận được chỉ định dưới dạng đối tượng lên đối tượng DOMPointReadOnly, tạo và trả về một đối tượng `DOMPointReadOnly` mới. Cả ma trận lẫn điểm đều không bị thay đổi.

Nếu ma trận được truyền vào là 2D ({{domxref("DOMMatrixReadOnly.is2D", "is2D")}} là `true`) thì đây là phép biến đổi 2D và tọa độ `z` của điểm sẽ là `0`, phối cảnh `w` của điểm sẽ là `1`. Ngược lại đây là phép biến đổi 3D.

Bạn cũng có thể tạo một `DOMPoint` mới với một điểm và ma trận bằng phương thức {{domxref("DOMMatrixReadOnly.transformPoint()")}}.

## Cú pháp

```js-nolint
matrixTransform()
matrixTransform(matrix)
```

### Tham số

- `matrix`
  - : Một đối tượng {{domxref("DOMMatrix")}} hoặc {{domxref("DOMMatrixReadOnly")}}.

### Giá trị trả về

Một đối tượng {{domxref("DOMPoint")}} mới.

## Ví dụ

### Biến đổi 2D

Trong ví dụ này, chúng ta áp dụng một phép biến đổi ma trận 2D lên `DOMPointReadOnly`, tạo ra một `DOMPoint` mới:

```js
const originalPoint = new DOMPointReadOnly(10, 20); // DOMPointReadOnly {x: 10, y: 20, z: 0, w: 1}
const matrix = new DOMMatrix([1, 0, 0, 1, 15, 30]);

const transformedPoint = originalPoint.matrixTransform(matrix); // DOMPoint {x: 25, y: 50, z: 0, w: 1}

console.log(transformedPoint.toJSON()); // output: {x: 25, y: 50, z: 0, w: 1}
```

### Biến đổi 3D

Trong ví dụ này, chúng ta áp dụng một phép biến đổi ma trận 3D lên `DOMPointReadOnly`:

```js
const point = new DOMPointReadOnly(5, 10); // DOMPointReadOnly {x: 5, y: 10, z: 0, w: 1}
const matrix3D = new DOMMatrix().translate(0, 0, 10);
const transformedPoint = point.matrixTransform(matrix3D); // DOMPoint {x: 5, y: 10, z: 10, w: 1}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPoint")}}
- {{domxref("DOMMatrix")}}
- {{domxref("DOMMatrixReadOnly.transformPoint()")}}
- Các hàm CSS {{cssxref("transform-function/matrix", "matrix()")}} và {{cssxref("transform-function/matrix3d", "matrix3d()")}}
