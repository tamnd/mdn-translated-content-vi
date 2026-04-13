---
title: "SVGTransform: setSkewX() method"
short-title: setSkewX()
slug: Web/API/SVGTransform/setSkewX
page-type: web-api-instance-method
browser-compat: api.SVGTransform.setSkewX
---

{{APIRef("SVG")}}

Phương thức `setSkewX()` của giao diện {{domxref("SVGTransform")}} đặt kiểu biến đổi thành `SVG_TRANSFORM_SKEWX`, với tham số `angle` xác định mức độ nghiêng theo trục X.

## Cú pháp

```js-nolint
setSkewX(angle)
```

### Tham số

- `angle`
  - : Một số thực xác định mức độ nghiêng tính bằng độ.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính hoặc đối tượng {{domxref("SVGTransform")}} là chỉ đọc.

## Ví dụ

### Nghiêng phần tử SVG theo trục X

```js
// Chọn phần tử SVG và tạo đối tượng transform
const svgElement = document.querySelector("svg");
const transform = svgElement.createSVGTransform();

// Áp dụng độ nghiêng 30 độ theo trục X
transform.setSkewX(30);

// Ghi lại góc biến đổi được áp dụng
console.log(`Skew Angle: ${transform.angle}`); // Đầu ra: 30
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform.angle")}}
