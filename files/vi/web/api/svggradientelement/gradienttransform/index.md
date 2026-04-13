---
title: "SVGGradientElement: gradientTransform property"
short-title: gradientTransform
slug: Web/API/SVGGradientElement/gradientTransform
page-type: web-api-instance-property
browser-compat: api.SVGGradientElement.gradientTransform
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`gradientTransform`** của giao diện {{domxref("SVGGradientElement")}} phản ánh thuộc tính {{SVGAttr("gradientTransform")}} của phần tử đã cho.

## Giá trị

Một {{domxref("SVGAnimatedTransformList")}}.

## Ví dụ

### Truy cập thuộc tính `gradientTransform`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
  <defs>
    <linearGradient id="gradient3" gradientTransform="rotate(45)">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </linearGradient>
  </defs>
  <rect x="10" y="10" width="180" height="180" fill="url(#gradient3)" />
</svg>
```

```js
// Truy cập thuộc tính gradientTransform
const gradient = document.getElementById("gradient3");
console.dir(gradient.gradientTransform.baseVal);
// Output: SVGTransformList object
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
