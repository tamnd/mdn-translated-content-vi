---
title: "DOMMatrixReadOnly: flipX() method"
short-title: flipX()
slug: Web/API/DOMMatrixReadOnly/flipX
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.flipX
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`flipX()`** của giao diện {{domxref("DOMMatrixReadOnly")}} tạo một ma trận mới là kết quả của ma trận gốc được lật quanh trục x. Điều này tương đương với việc nhân ma trận với `DOMMatrix(-1, 0, 0, 1, 0, 0)`. Ma trận gốc không bị thay đổi.

## Cú pháp

```js-nolint
flipX()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix).

## Ví dụ

### Lật một tam giác

Trong ví dụ này, SVG chứa hai đường dẫn hình tam giác, cả hai đều được vẽ tại cùng một vị trí. Lưu ý rằng tọa độ x của thuộc tính viewBox là âm, cho thấy nội dung từ cả hai phía của trục x.

#### HTML

```html
<svg width="100" height="100" viewBox="-50 0 100 100">
  <path fill="red" d="M 0 50 L 50 0 L 50 100 Z" />
  <path id="flipped" fill="blue" d="M 0 50 L 50 0 L 50 100 Z" />
</svg>
```

#### JavaScript

JavaScript trước tiên tạo một ma trận đơn vị, sau đó sử dụng phương thức `flipX()` để tạo một ma trận mới, sau đó được áp dụng lên tam giác xanh, đảo ngược nó qua trục x. Tam giác đỏ được giữ nguyên.

```js
const flipped = document.getElementById("flipped");
const matrix = new DOMMatrixReadOnly();
const flippedMatrix = matrix.flipX();
flipped.setAttribute("transform", flippedMatrix.toString());
```

#### Kết quả

{{EmbedLiveSample('Inverting a triangle')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.flipY()")}}
