---
title: "SVGTransform: angle property"
short-title: angle
slug: Web/API/SVGTransform/angle
page-type: web-api-instance-property
browser-compat: api.SVGTransform.angle
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`angle`** của giao diện {{domxref("SVGTransform")}} đại diện cho góc của phép biến đổi tính bằng độ.

Đối với `SVG_TRANSFORM_ROTATE`, `SVG_TRANSFORM_SKEWX` và `SVG_TRANSFORM_SKEWY`, `angle` phản ánh góc quay hoặc nghiêng của phép biến đổi.

Đối với `SVG_TRANSFORM_MATRIX`, `SVG_TRANSFORM_TRANSLATE` và `SVG_TRANSFORM_SCALE`, `angle` sẽ bằng không.

## Giá trị

Một `integer`; giá trị góc tính bằng độ dưới dạng số thực.

## Ví dụ

### Truy cập thuộc tính `angle`

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <rect id="rect" x="50" y="50" width="100" height="100" fill="green" />
</svg>
```

```js
const rect = document.getElementById("rect");
const transformList = rect.transform.baseVal;

// Tạo và thêm phép biến đổi quay
const rotateTransform = rect.ownerSVGElement.createSVGTransform();
rotateTransform.setRotate(45, 100, 100); // Quay 45 độ
transformList.appendItem(rotateTransform);

// Truy cập thuộc tính angle
console.log(transformList.getItem(0).angle); // Đầu ra: 45
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
