---
title: "SVGGradientElement: href property"
short-title: href
slug: Web/API/SVGGradientElement/href
page-type: web-api-instance-property
browser-compat: api.SVGGradientElement.href
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`href`** của giao diện {{domxref("SVGGradientElement")}} phản ánh thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}} của phần tử đã cho.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

### Truy cập thuộc tính `href`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
  <defs>
    <linearGradient id="gradient1">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </linearGradient>
    <linearGradient id="gradient2" href="#gradient1" />
  </defs>
  <rect x="10" y="10" width="180" height="180" fill="url(#gradient2)" />
</svg>
```

```js
const gradient = document.getElementById("gradient2");
console.log(gradient.href.baseVal); // Output: "#gradient1"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
