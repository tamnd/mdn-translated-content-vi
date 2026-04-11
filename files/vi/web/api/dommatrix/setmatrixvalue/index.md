---
title: "DOMMatrix: setMatrixValue() method"
short-title: setMatrixValue()
slug: Web/API/DOMMatrix/setMatrixValue
page-type: web-api-instance-method
browser-compat: api.DOMMatrix.setMatrixValue
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`setMatrixValue()`** của giao diện {{domxref("DOMMatrix")}} thay thế nội dung của ma trận bằng ma trận được mô tả bởi phép biến đổi hoặc các phép biến đổi được chỉ định, và trả về chính nó.

## Cú pháp

```js-nolint
setMatrixValue(transformList)
```

### Tham số

- `transformList`
  - : Một chuỗi. Giá trị của nó theo cùng cú pháp với giá trị thuộc tính CSS {{cssxref("transform")}}.

### Giá trị trả về

Trả về chính nó; [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix) với các giá trị đã được cập nhật.

## Ví dụ

Trong ví dụ này, chúng ta tạo một ma trận, áp dụng phép biến đổi 3D sử dụng phương thức {{domxref("DOMMatrix.translateSelf()")}}, hoàn nguyên về phép biến đổi 2D sử dụng phương thức `setMatrixValue()`, rồi hoàn nguyên lại về phép biến đổi 3D với một lần gọi phương thức `setMatrixValue()` khác.

```js
const matrix = new DOMMatrix();

console.log(matrix.toString()); // matrix(1, 0, 0, 1, 0, 0)
console.log(matrix.is2D); // true

matrix.translateSelf(30, 40, 50);
console.log(matrix.toString()); // matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 30, 40, 50, 1)
console.log(matrix.is2D); // false

matrix.setMatrixValue("matrix(1, 0, 0, 1, 15, 45)");
console.log(matrix.toString()); // output: matrix(1, 0, 0, 1, 15, 45)
console.log(matrix.is2D); // true

matrix.setMatrixValue(
  "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 30, 40, 50, 1)",
);
console.log(matrix.toString()); // matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 30, 40, 50, 1)
console.log(matrix.is2D); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix.translateSelf()")}}
- {{domxref("DOMMatrixReadOnly.is2D")}}
- CSS {{CSSxRef("transform-function/matrix", "matrix()")}} function
- CSS {{CSSxRef("transform-function/matrix3d", "matrix3d()")}} function
