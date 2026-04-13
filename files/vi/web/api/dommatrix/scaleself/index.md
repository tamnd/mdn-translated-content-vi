---
title: "DOMMatrix: scaleSelf() method"
short-title: scaleSelf()
slug: Web/API/DOMMatrix/scaleSelf
page-type: web-api-instance-method
browser-compat: api.DOMMatrix.scaleSelf
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức **`scaleSelf()`** của giao diện {{domxref("DOMMatrix")}} là phương thức biến đổi có thể thay đổi, sửa đổi một ma trận bằng cách áp dụng hệ số tỷ lệ được chỉ định, lấy tâm tại gốc tọa độ cho trước với gốc tọa độ mặc định là `(0, 0)`, trả về ma trận đã được thu phóng.

Để thu phóng ma trận mà không làm thay đổi nó, hãy xem {{domxref("DOMMatrixReadOnly.scale()")}}, phương thức này tạo một ma trận thu phóng mới trong khi giữ nguyên ma trận gốc.

## Cú pháp

```js-nolint
scaleSelf()
scaleSelf(scaleX)
scaleSelf(scaleX, scaleY)
scaleSelf(scaleX, scaleY, scaleZ)
scaleSelf(scaleX, scaleY, scaleZ, originX)
scaleSelf(scaleX, scaleY, scaleZ, originX, originY)
scaleSelf(scaleX, scaleY, scaleZ, originX, originY, originZ)
```

### Tham số

- `scaleX` {{optional_inline}}
  - : Hệ số nhân cho giá trị tỷ lệ trên trục x. Nếu không được cung cấp, mặc định là `1`.
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

Trả về chính nó; một {{domxref("DOMMatrix")}}.

Nếu thu phóng được áp dụng quanh trục z, ma trận sẽ là ma trận 3D 4x4.

## Ví dụ

SVG này chứa hai hình vuông bán trong suốt, một đỏ và một xanh, mỗi hình được đặt tại gốc tọa độ tài liệu:

```html
<svg viewBox="0 0 50 50" height="200">
  <rect width="25" height="25" fill="#ff000099" />
  <rect id="transformed" width="25" height="25" fill="#0000ff99" />
</svg>
```

JavaScript này trước tiên tạo một ma trận, sau đó thu phóng ma trận thành ma trận giảm một nửa chiều rộng và tăng gấp đôi chiều cao, sử dụng phương thức `scaleSelf()`.

Ma trận sau đó được áp dụng lên hình vuông xanh dương dưới dạng `transform`, thay đổi kích thước và vị trí của nó. Hình vuông đỏ không bị thay đổi.

```js
const matrix = new DOMMatrix();
matrix.scaleSelf(0.5, 2);

document
  .querySelector("#transformed")
  .setAttribute("transform", matrix.toString());
```

{{EmbedLiveSample('Examples', '', '220')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.scale()")}}
- {{domxref("DOMMatrix.scale3dSelf()")}}
- CSS {{cssxref("transform")}} property and the {{cssxref("transform-function/scale", "scaleSelf()")}} and {{cssxref("transform-function/matrix", "matrix()")}} functions
- [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) module
- SVG [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform) attribute
- {{domxref("CanvasRenderingContext2D")}} interface {{domxref("CanvasRenderingContext2D.transform()", "transform()")}} method
