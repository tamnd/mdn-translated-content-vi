---
title: "SVGAnimatedRect: thuộc tính animVal"
short-title: animVal
slug: Web/API/SVGAnimatedRect/animVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedRect.animVal
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`animVal`** của giao diện {{domxref("SVGAnimatedRect")}} đại diện cho giá trị hoạt hình hiện tại của thuộc tính `viewBox` của phần tử SVG dưới dạng đối tượng {{domxref("DOMRectReadOnly")}} chỉ đọc. Nó cung cấp quyền truy cập vào trạng thái động của hình chữ nhật, bao gồm các giá trị `x`, `y`, `width` và `height` trong quá trình hoạt hình.

Nếu không có hoạt hình nào được áp dụng, thuộc tính `animVal` phản ánh giá trị thuộc tính {{SVGAttr("viewBox")}} của phần tử SVG và sẽ giống với {{domxref("SVGAnimatedRect.baseVal")}}.

## Giá trị

Một đối tượng {{domxref("DOMRectReadOnly")}} đại diện cho giá trị hoạt hình của thuộc tính `viewBox`.

## Ví dụ

```html
<svg viewBox="0 0 200 100" id="mySvg">
  <rect width="100" height="100" fill="blue" />
</svg>
```

```js
const svgElement = document.getElementById("mySvg");
const animatedRect = svgElement.viewBox.animVal;

// Ghi giá trị hoạt hình (giả sử có hoạt hình được áp dụng)
console.log(animatedRect.x);
console.log(animatedRect.y);
console.log(animatedRect.width);
console.log(animatedRect.height);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("viewBox")}}
- {{domxref("DOMRectReadOnly")}}
