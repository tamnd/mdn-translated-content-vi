---
title: "DOMMatrixReadOnly: flipY() method"
short-title: flipY()
slug: Web/API/DOMMatrixReadOnly/flipY
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.flipY
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`flipY()`** của giao diện {{domxref("DOMMatrixReadOnly")}} tạo một ma trận mới là kết quả của ma trận gốc được lật quanh trục y. Điều này tương đương với việc nhân ma trận với `DOMMatrix(1, 0, 0, -1, 0, 0)`. Ma trận gốc không bị thay đổi.

## Cú pháp

```js-nolint
flipY()
```

### Tham số

Không có.

### Giá trị trả về

Một [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix).

## Ví dụ

### Lật một tam giác

Trong ví dụ này, SVG chứa hai [đường dẫn](/en-US/docs/Web/SVG/Reference/Attribute/d) hình tam giác giống hệt nhau; cả hai đều được vẽ có cùng kích thước và vị trí. Hộp xem có giá trị y âm cho thấy nội dung từ cả hai phía của trục y. Điều này cho phép tam giác được lật nằm trong vùng xem sau khi biến đổi.

#### HTML

```html
<svg height="200" width="100" viewBox="0 -100 100 200">
  <path fill="red" d="M 0 0 L 100 0 L 50 100 Z" />
  <path fill="blue" d="M 0 0 L 100 0 L 50 100 Z" id="flipped" />
</svg>
```

#### JavaScript

JavaScript tạo một [ma trận đơn vị](/en-US/docs/Web/API/DOMMatrixReadOnly/isIdentity), sau đó sử dụng phương thức `flipY()` để tạo một ma trận mới, sau đó được áp dụng lên tam giác xanh, đảo ngược nó qua trục y. Tam giác đỏ được giữ nguyên.

```js
const flipped = document.getElementById("flipped");
const matrix = new DOMMatrix();
const flippedMatrix = matrix.flipY();
flipped.setAttribute("transform", flippedMatrix.toString());
```

#### Kết quả

{{EmbedLiveSample('Inverting a triangle', '', '240')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.flipX()")}}
