---
title: "DOMMatrix: preMultiplySelf() method"
short-title: preMultiplySelf()
slug: Web/API/DOMMatrix/preMultiplySelf
page-type: web-api-instance-method
browser-compat: api.DOMMatrix.preMultiplySelf
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`preMultiplySelf()`** của giao diện {{domxref("DOMMatrix")}} sửa đổi ma trận bằng cách tiền nhân nó với `DOMMatrix` được chỉ định. Điều này tương đương với tích vô hướng `B⋅A`, trong đó ma trận `A` là ma trận nguồn và `B` là ma trận được truyền vào phương thức. Nếu không có ma trận nào được chỉ định làm thừa số, ma trận sẽ được nhân với một ma trận trong đó mọi phần tử đều là `0` _ngoại trừ_ góc dưới bên phải và phần tử ngay phía trên bên trái của nó: `m33` và `m34`. Các giá trị mặc định của chúng là `1`.

## Cú pháp

```js-nolint
preMultiplySelf()
preMultiplySelf(otherMatrix)
```

### Tham số

- `otherMatrix` {{optional_inline}}
  - : Ma trận thừa số [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix).

### Giá trị trả về

Trả về chính nó; [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix) được cập nhật với kết quả của các phép nhân đã áp dụng.

## Ví dụ

```js
const matrix = new DOMMatrix().translate(3, 22);
const otherMatrix = new DOMMatrix().translateSelf(15, 45);

console.log(matrix.toString()); // output: matrix(1, 0, 0, 1, 3, 22)
console.log(otherMatrix.toString()); // output: matrix(1, 0, 0, 1, 15, 45)

matrix.preMultiplySelf(otherMatrix);

console.log(matrix.toString()); // output: matrix(1, 0, 0, 1, 18, 67)
console.log(otherMatrix.toString()); // output: matrix(1, 0, 0, 1, 15, 45)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix.multiplySelf()")}}
- {{domxref("DOMMatrixReadOnly.multiply()")}}
- CSS {{CSSxRef("transform-function/matrix", "matrix()")}} function
- CSS {{CSSxRef("transform-function/matrix3d", "matrix3d()")}} function
