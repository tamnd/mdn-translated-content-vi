---
title: "DOMMatrixReadOnly: multiply() method"
short-title: multiply()
slug: Web/API/DOMMatrixReadOnly/multiply
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.multiply
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`multiply()`** của giao diện {{domxref("DOMMatrixReadOnly")}} tạo và trả về một ma trận mới là tích vô hướng của ma trận và tham số `otherMatrix`. Nếu `otherMatrix` bị bỏ qua, ma trận sẽ được nhân với một ma trận trong đó mọi phần tử đều là `0` _ngoại trừ_ góc dưới bên phải và phần tử ngay phía trên bên trái của nó: `m33` và `m34`. Các giá trị mặc định của chúng là `1`. Ma trận gốc không bị thay đổi.

Để thay đổi ma trận khi nhân, hãy xem {{domxref("DOMMatrix.multiplySelf()")}}.

## Cú pháp

```js-nolint
multiply()
multiply(otherMatrix)
```

### Tham số

- `otherMatrix` {{optional_inline}}
  - : Ma trận thừa số [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix).

### Giá trị trả về

Một {{domxref("DOMMatrix")}}.

## Ví dụ

```js
const matrix = new DOMMatrixReadOnly().translate(13, 21);
const multipliedMatrix = matrix.multiply(matrix);
console.log(matrix.toString()); // output: matrix(1, 0, 0, 1, 13, 21)
console.log(multipliedMatrix.toString()); // output: matrix(1, 0, 0, 1, 26, 42)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix.multiplySelf()")}}
- {{domxref("DOMMatrix.preMultiplySelf()")}}
- CSS {{CSSxRef("transform-function/matrix", "matrix()")}} function
- CSS {{CSSxRef("transform-function/matrix3d", "matrix3d()")}} function
