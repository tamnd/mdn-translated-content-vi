---
title: "SVGTransform: setRotate() method"
short-title: setRotate()
slug: Web/API/SVGTransform/setRotate
page-type: web-api-instance-method
browser-compat: api.SVGTransform.setRotate
---

{{APIRef("SVG")}}

Phương thức `setRotate()` của giao diện {{domxref("SVGTransform")}} đặt kiểu biến đổi thành `SVG_TRANSFORM_ROTATE`, với tham số `angle` xác định góc quay và các tham số `cx`, `cy` xác định tâm quay tùy chọn.

## Cú pháp

```js-nolint
setRotate(angle, cx, cy)
```

### Tham số

- `angle`
  - : Một số thực xác định góc quay tính bằng độ.
- `cx` {{optional_inline}}
  - : Một số thực xác định tọa độ X của tâm quay. Mặc định là `0`.
- `cy` {{optional_inline}}
  - : Một số thực xác định tọa độ Y của tâm quay. Mặc định là `0`.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính hoặc đối tượng {{domxref("SVGTransform")}} là chỉ đọc.

## Ví dụ

### Quay một phần tử SVG

```js
// Chọn phần tử SVG và tạo đối tượng transform
const svgElement = document.querySelector("svg");
const transform = svgElement.createSVGTransform();

// Đặt góc quay 45 độ
transform.setRotate(45, 0, 0);

// Xuất ra góc quay
console.log(`Rotation Angle: ${transform.angle}`); // Đầu ra: 45
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform.angle")}}
