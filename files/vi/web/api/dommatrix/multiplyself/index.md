---
title: "DOMMatrix: multiplySelf() method"
short-title: multiplySelf()
slug: Web/API/DOMMatrix/multiplySelf
page-type: web-api-instance-method
browser-compat: api.DOMMatrix.multiplySelf
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`multiplySelf()`** của giao diện {{domxref("DOMMatrix")}} nhân một ma trận với tham số `otherMatrix`, tính tích vô hướng của ma trận gốc và ma trận được chỉ định: `A⋅B`. Nếu không có ma trận nào được chỉ định làm thừa số, ma trận sẽ được nhân với một ma trận trong đó mọi phần tử đều là `0` _ngoại trừ_ góc dưới bên phải và phần tử ngay phía trên bên trái của nó: `m33` và `m34`. Các giá trị mặc định của chúng là `1`.

Để nhân ma trận mà không làm thay đổi nó, hãy xem {{domxref("DOMMatrixReadOnly.multiply()")}}.

## Cú pháp

```js-nolint
multiplySelf()
multiplySelf(otherMatrix)
```

### Tham số

- `otherMatrix` {{optional_inline}}
  - : Ma trận thừa số [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix).

### Giá trị trả về

Trả về chính nó; [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix) được cập nhật với kết quả của các phép nhân đã áp dụng.

## Ví dụ

```js
const matrix = new DOMMatrix().rotate(30);

console.log(matrix.toString());
// output: matrix(0.866, 0.5, -0.5, 0.866, 0, 0)

matrix.multiplySelf(matrix);

console.log(matrix.toString());
// output: matrix(0.5, 0.866, -0.866, 0.5, 0, 0) (xoay 60 độ)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.multiply()")}}
- {{domxref("DOMMatrix.preMultiplySelf()")}}
- CSS {{CSSxRef("transform-function/matrix", "matrix()")}} function
- CSS {{CSSxRef("transform-function/matrix3d", "matrix3d()")}} function
