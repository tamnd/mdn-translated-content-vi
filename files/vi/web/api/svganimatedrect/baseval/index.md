---
title: "SVGAnimatedRect: thuộc tính baseVal"
short-title: baseVal
slug: Web/API/SVGAnimatedRect/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedRect.baseVal
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`baseVal`** của giao diện {{domxref("SVGAnimatedRect")}} đại diện cho giá trị không hoạt hình hiện tại của thuộc tính `viewBox` của phần tử SVG.

Thuộc tính này phản ánh giá trị thuộc tính {{SVGAttr("viewBox")}} của phần tử SVG dưới dạng đối tượng {{domxref("DOMRect")}} chỉ đọc. Nó cung cấp quyền truy cập vào hình chữ nhật tĩnh được xác định bởi thuộc tính `viewBox`, bao gồm các giá trị `x`, `y`, `width` và `height`.

## Giá trị

Một đối tượng {{domxref("DOMRect")}} đại diện cho giá trị không hoạt hình hiện tại của thuộc tính `viewBox`.

## Ví dụ

```html
<svg viewBox="0 0 200 100" id="mySvg">
  <rect width="100" height="100" fill="blue" />
</svg>
```

```js
const svgElement = document.getElementById("mySvg");
const animatedRect = svgElement.viewBox.baseVal;

// Truy cập giá trị cơ sở không hoạt hình
console.log(animatedRect.x); // 0
console.log(animatedRect.y); // 0
console.log(animatedRect.width); // 200
console.log(animatedRect.height); // 100
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("viewBox")}}
- {{domxref("DOMRect")}}
