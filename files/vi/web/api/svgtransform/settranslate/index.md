---
title: "SVGTransform: setTranslate() method"
short-title: setTranslate()
slug: Web/API/SVGTransform/setTranslate
page-type: web-api-instance-method
browser-compat: api.SVGTransform.setTranslate
---

{{APIRef("SVG")}}

Phương thức `setTranslate()` của giao diện {{domxref("SVGTransform")}} đặt kiểu biến đổi thành `SVG_TRANSFORM_TRANSLATE`, với các tham số `tx` và `ty` xác định lượng dịch chuyển.

## Cú pháp

```js-nolint
setTranslate(tx, ty)
```

### Tham số

- `tx`
  - : Một số thực xác định lượng dịch chuyển theo trục X.
- `ty`
  - : Một số thực xác định lượng dịch chuyển theo trục Y.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính hoặc đối tượng {{domxref("SVGTransform")}} là chỉ đọc.

## Ví dụ

### Đặt giá trị dịch chuyển

```js
// Chọn phần tử SVG và tạo đối tượng transform
const svgElement = document.querySelector("svg");
const transform = svgElement.createSVGTransform();

// Đặt giá trị dịch chuyển cho biến đổi
transform.setTranslate(100, 50);

// Xuất ra chi tiết dịch chuyển
console.log(`X Translation:  ${transform.matrix.e}`); // Đầu ra: 100
console.log(`Y Translation: ${transform.matrix.f}`); // Đầu ra: 50
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
