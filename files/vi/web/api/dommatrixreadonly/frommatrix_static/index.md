---
title: "DOMMatrixReadOnly: fromMatrix() static method"
short-title: fromMatrix()
slug: Web/API/DOMMatrixReadOnly/fromMatrix_static
page-type: web-api-static-method
browser-compat: api.DOMMatrixReadOnly.fromMatrix_static
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức tĩnh **`fromMatrix()`** của giao diện {{domxref("DOMMatrixReadOnly")}} tạo một đối tượng {{domxref("DOMMatrixReadOnly")}} mới từ một ma trận hiện có hoặc một đối tượng cung cấp các giá trị cho các thuộc tính của nó.

## Cú pháp

```js-nolint
DOMMatrixReadOnly.fromMatrix()
DOMMatrixReadOnly.fromMatrix(other)
```

### Tham số

- `other` {{optional_inline}}
  - : Một {{domxref("DOMMatrix")}}, {{domxref("DOMMatrixReadOnly")}}, hoặc một đối tượng có cùng thuộc tính. Tất cả các thuộc tính mặc định là `0`. Các thuộc tính bao gồm:
    - `is2D`
      - : Một boolean. `true` nếu ma trận nên được tạo là ma trận 2D. Mặc định là `false` nếu ít nhất một trong `m13`, `m14`, `m23`, `m24`, `m31`, `m32`, `m34`, hoặc `m43` khác không, hoặc ít nhất một trong `m33` hoặc `m44` không phải là 1; ngược lại mặc định là `true`.
    - `m11`, `m12`, `m13`, `m14`, `m21`, `m22`, `m23`, `m24`, `m31`, `m32`, `m33`, `m34`, `m41`, `m42`, `m43`, `m44`
      - : Các số đại diện cho từng thành phần của ma trận 4x4, trong đó `m11` đến `m14` là cột đầu tiên, `m21` đến `m24` là cột thứ hai, và tiếp tục như vậy. `m11`, `m22`, `m33`, và `m44` mặc định là `1`, và tất cả các thành phần khác mặc định là `0`.

        Nếu `is2D` được đặt rõ ràng thành `true`, thì `m13`, `m14`, `m23`, `m24`, `m31`, `m32`, `m34`, hoặc `m43` phải bị bỏ qua hoặc được đặt thành `0`, và `m33` và `m44` phải bị bỏ qua hoặc được đặt thành `1`.

    - `a`, `b`, `c`, `d`, `e`, `f`
      - : Các bí danh cho `m11`, `m12`, `m21`, `m22`, `m41`, và `m42` tương ứng, để tiện lợi khi khởi tạo ma trận 2D. Nếu các bí danh này được cung cấp cùng với các đối tác `m`, giá trị của chúng phải bằng nhau.

### Giá trị trả về

Một đối tượng {{domxref("DOMMatrixReadOnly")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu các thuộc tính của đối tượng được cung cấp không nhất quán (ví dụ, nếu cả `a` và `m11` đều được cung cấp nhưng có giá trị khác nhau).

## Ví dụ

### Tạo ma trận từ một đối tượng

Ví dụ này tạo một `DOMMatrixReadOnly` bằng cách cung cấp các giá trị ma trận trong một đối tượng.

```js
const matrix = DOMMatrixReadOnly.fromMatrix({
  a: 1,
  b: 0,
  c: 0,
  d: 1,
  e: 50,
  f: 50,
  is2D: true,
});

console.log(matrix.toString());
// Output: matrix(1, 0, 0, 1, 50, 50)

console.log(matrix.is2D);
// Output: true
```

### Tạo ma trận từ một ma trận hiện có

Ví dụ này tạo một `DOMMatrixReadOnly` mới từ một `DOMMatrixReadOnly` hiện có.

```js
const matrix1 = new DOMMatrixReadOnly([1, 0, 0, 1, 100, 100]);
const matrix2 = DOMMatrixReadOnly.fromMatrix(matrix1);

console.log(matrix2.toString());
// Output: matrix(1, 0, 0, 1, 100, 100)
```

### Tạo ma trận đơn vị mặc định

Ví dụ này cho thấy cách gọi `fromMatrix()` không có đối số tạo ra ma trận đơn vị.

```js
const identityMatrix = DOMMatrixReadOnly.fromMatrix();

console.log(identityMatrix.toString());
// Output: matrix(1, 0, 0, 1, 0, 0)

console.log(identityMatrix.isIdentity);
// Output: true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.DOMMatrixReadOnly", "DOMMatrixReadOnly()")}} constructor
- {{domxref("DOMMatrixReadOnly.fromFloat32Array_static", "DOMMatrixReadOnly.fromFloat32Array()")}}
- {{domxref("DOMMatrixReadOnly.fromFloat64Array_static", "DOMMatrixReadOnly.fromFloat64Array()")}}
