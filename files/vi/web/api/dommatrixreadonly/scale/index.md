---
title: "DOMMatrixReadOnly: scale() method"
short-title: scale()
slug: Web/API/DOMMatrixReadOnly/scale
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.scale
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`scale()`** của giao diện {{domxref("DOMMatrixReadOnly")}} tạo một ma trận mới là kết quả của ma trận gốc được áp dụng phép biến đổi thu phóng.

## Cú pháp

```js-nolint
scale(scaleX)
scale(scaleX, scaleY)
scale(scaleX, scaleY, scaleZ)
scale(scaleX, scaleY, scaleZ, originX)
scale(scaleX, scaleY, scaleZ, originX, originY)
scale(scaleX, scaleY, scaleZ, originX, originY, originZ)
```

### Tham số

- `scaleX`
  - : Hệ số nhân cho giá trị tỷ lệ trên trục x.
- `scaleY` {{optional_inline}}
  - : Hệ số nhân cho giá trị tỷ lệ trên trục y. Nếu không được cung cấp, mặc định là giá trị của `scaleX`.
- `scaleZ` {{optional_inline}}
  - : Hệ số nhân cho giá trị tỷ lệ trên trục z. Nếu giá trị này khác 1, ma trận kết quả sẽ là 3D.
- `originX` {{optional_inline}}
  - : Tọa độ x của gốc biến đổi. Nếu không có gốc tọa độ nào được cung cấp, mặc định là 0.
- `originY` {{optional_inline}}
  - : Tọa độ y của gốc biến đổi. Nếu không có gốc tọa độ nào được cung cấp, mặc định là 0.
- `originZ` {{optional_inline}}
  - : Tọa độ z của gốc biến đổi. Nếu không có gốc tọa độ nào được cung cấp, mặc định là 0. Nếu giá trị này khác 0, ma trận kết quả sẽ là 3D.

### Giá trị trả về

Trả về một [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix) chứa ma trận mới là kết quả của ma trận được thu phóng theo hệ số cho trước trên các chiều x và y, lấy tâm tại gốc tọa độ được cho. Ma trận gốc không bị thay đổi.

Nếu thu phóng được áp dụng quanh trục z, ma trận kết quả sẽ là ma trận 3D 4x4.

## Ví dụ

SVG này chứa ba hình vuông, một đỏ, một xanh dương và một xanh lá, mỗi hình được đặt tại gốc tọa độ tài liệu:

```html
<svg width="250" height="250" viewBox="0 0 25 25">
  <rect width="25" height="25" fill="red" />
  <rect id="transformed" width="25" height="25" fill="blue" />
  <rect id="transformedOrigin" width="25" height="25" fill="green" />
</svg>
```

JavaScript này trước tiên tạo một ma trận đơn vị, sau đó sử dụng phương thức `scale()` để tạo một ma trận mới với một tham số.

Chúng ta kiểm tra xem trình duyệt có hỗ trợ phương thức `scale()` với sáu tham số hay không bằng cách tạo ma trận mới với ba tham số và quan sát thuộc tính `is2D` của nó. Nếu là `false`, tham số thứ ba đã được trình duyệt chấp nhận là tham số `scaleZ`, biến nó thành ma trận 3D.

Sau đó chúng ta tạo một ma trận mới được thu phóng xung quanh một gốc tọa độ nhất định, sử dụng ba hoặc sáu tham số tùy thuộc vào hỗ trợ của trình duyệt.

Các ma trận mới này sau đó được áp dụng lên hình vuông xanh dương và xanh lá dưới dạng `transform`, thay đổi kích thước và vị trí của chúng. Hình vuông đỏ được giữ nguyên.

```js
const matrix = new DOMMatrixReadOnly();
const scaledMatrix = matrix.scale(0.5);

let scaledMatrixWithOrigin = matrix.scale(0.5, 25, 25);

// nếu trình duyệt đã hiểu các tham số này là scaleX, scaleY, scaleZ, ma trận kết quả là 3D
const browserExpectsSixParamScale = !scaledMatrixWithOrigin.is2D;
if (browserExpectsSixParamScale) {
  scaledMatrixWithOrigin = matrix.scale(0.5, 0.5, 1, 25, 25, 0);
}

document
  .querySelector("#transformed")
  .setAttribute("transform", scaledMatrix.toString());
document
  .querySelector("#transformedOrigin")
  .setAttribute("transform", scaledMatrixWithOrigin.toString());
```

{{EmbedLiveSample('Examples', '250', '250')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
