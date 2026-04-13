---
title: "SVGTransform: setSkewY() method"
short-title: setSkewY()
slug: Web/API/SVGTransform/setSkewY
page-type: web-api-instance-method
browser-compat: api.SVGTransform.setSkewY
---

{{APIRef("SVG")}}

Phương thức `setSkewY()` của giao diện {{domxref("SVGTransform")}} đặt kiểu biến đổi thành `SVG_TRANSFORM_SKEWY`, với tham số `angle` xác định mức độ nghiêng theo trục Y.

## Cú pháp

```js-nolint
setSkewY(angle)
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

### Nghiêng phần tử SVG theo trục Y

```js
// Chọn phần tử SVG và tạo đối tượng transform
const svgElement = document.querySelector("svg");
const transform = svgElement.createSVGTransform();

// Áp dụng độ nghiêng 30 độ theo trục Y
transform.setSkewY(30);

// Ghi lại góc biến đổi được áp dụng
console.log(`Skew Angle: ${transform.angle}`); // Đầu ra: 30
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform.angle")}}
