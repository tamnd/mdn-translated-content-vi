---
title: "SVGTransform: setScale() method"
short-title: setScale()
slug: Web/API/SVGTransform/setScale
page-type: web-api-instance-method
browser-compat: api.SVGTransform.setScale
---

{{APIRef("SVG")}}

Phương thức `setScale()` của giao diện {{domxref("SVGTransform")}} đặt kiểu biến đổi thành `SVG_TRANSFORM_SCALE`, với các tham số `sx` và `sy` xác định lượng co giãn.

## Cú pháp

```js-nolint
setScale(sx, sy)
```

### Tham số

- `sx`
  - : Một số thực xác định lượng co giãn theo trục X.
- `sy`
  - : Một số thực xác định lượng co giãn theo trục Y.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính hoặc đối tượng {{domxref("SVGTransform")}} là chỉ đọc.

## Ví dụ

### Co giãn một phần tử SVG

```js
// Chọn phần tử SVG và tạo đối tượng transform
const svgElement = document.querySelector("svg");
const transform = svgElement.createSVGTransform();

// Đặt giá trị co giãn cho biến đổi
transform.setScale(2, 3);

// Xuất ra chi tiết co giãn
console.log(`Scale X: ${transform.matrix.a}`); // Đầu ra: 2
console.log(`Scale Y: ${transform.matrix.d}`); // Đầu ra: 3
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
