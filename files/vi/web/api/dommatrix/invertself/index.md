---
title: "DOMMatrix: invertSelf() method"
short-title: invertSelf()
slug: Web/API/DOMMatrix/invertSelf
page-type: web-api-instance-method
browser-compat: api.DOMMatrix.invertSelf
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`invertSelf()`** của giao diện {{domxref("DOMMatrix")}} nghịch đảo ma trận gốc. Nếu ma trận không thể nghịch đảo, tất cả các thành phần của ma trận mới sẽ được đặt thành `NaN` và thuộc tính {{domxref("DOMMatrixReadOnly.is2D", "is2D")}} của nó được đặt thành `false`.

Để nghịch đảo ma trận mà không làm thay đổi nó, hãy xem {{domxref("DOMMatrixReadOnly.inverse()")}}

## Cú pháp

```js-nolint
invertSelf()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("DOMMatrix")}}.

## Ví dụ

Trong ví dụ này, chúng ta tạo một ma trận với góc xoay 30 độ. Sau đó nghịch đảo nó, kết quả là góc xoay -30 độ.

```js
const matrix = new DOMMatrix().rotate(30);
console.log(matrix.toString());
// output: matrix(0.866, 0.5, -0.5, 0.866, 0, 0)
matrix.invertSelf();
console.log(matrix.toString());
// output: matrix(0.866, -0.5, 0.5, 0.866, 0, 0)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.inverse()")}}
- CSS {{CSSxRef("transform-function/matrix", "matrix()")}} function
- CSS {{CSSxRef("transform-function/matrix3d", "matrix3d()")}} function
