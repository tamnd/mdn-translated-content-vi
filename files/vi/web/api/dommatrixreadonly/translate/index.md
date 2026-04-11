---
title: "DOMMatrixReadOnly: translate() method"
short-title: translate()
slug: Web/API/DOMMatrixReadOnly/translate
page-type: web-api-instance-method
browser-compat: api.DOMMatrixReadOnly.translate
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `translate()` của giao diện {{domxref("DOMMatrixReadOnly")}} tạo một ma trận mới là kết quả của ma trận gốc được áp dụng phép dịch chuyển.

## Cú pháp

```js-nolint
translate(translateX, translateY)
translate(translateX, translateY, translateZ)
```

### Tham số

- `translateX`
  - : Một số đại diện cho hoành độ (tọa độ x) của vectơ dịch chuyển.
- `translateY`
  - : Một số đại diện cho tung độ (tọa độ y) của vectơ dịch chuyển.
- `translateZ` {{optional_inline}}
  - : Một số đại diện cho thành phần z của vectơ dịch chuyển. Nếu không được cung cấp, mặc định là 0. Nếu giá trị này khác 0, ma trận kết quả sẽ là 3D.

### Giá trị trả về

Trả về một [`DOMMatrix`](/en-US/docs/Web/API/DOMMatrix) chứa ma trận mới là kết quả của ma trận được dịch chuyển theo vectơ cho trước. Ma trận gốc không bị thay đổi.

Nếu phép dịch chuyển được áp dụng quanh trục z, ma trận kết quả sẽ là ma trận 3D 4x4.

## Ví dụ

SVG này chứa hai hình vuông, một đỏ và một xanh dương, mỗi hình được đặt tại gốc tọa độ tài liệu:

```html
<svg width="250" height="250" viewBox="0 0 50 50">
  <rect width="25" height="25" fill="red" />
  <rect id="transformed" width="25" height="25" fill="blue" />
</svg>
```

JavaScript sau đây trước tiên tạo một ma trận đơn vị, sau đó sử dụng phương thức `translate()` để tạo một ma trận mới đã được dịch chuyển, sau đó được áp dụng lên hình vuông xanh dương dưới dạng `transform`. Hình vuông đỏ được giữ nguyên.

```js
const matrix = new DOMMatrixReadOnly().translate(25, 25);

document
  .querySelector("#transformed")
  .setAttribute("transform", matrix.toString());
```

{{EmbedLiveSample('Examples', '250', '250')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
