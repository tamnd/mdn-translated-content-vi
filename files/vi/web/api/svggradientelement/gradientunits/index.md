---
title: "SVGGradientElement: gradientUnits property"
short-title: gradientUnits
slug: Web/API/SVGGradientElement/gradientUnits
page-type: web-api-instance-property
browser-compat: api.SVGGradientElement.gradientUnits
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`gradientUnits`** của giao diện {{domxref("SVGGradientElement")}} phản ánh thuộc tính {{SVGAttr("gradientUnits")}} của phần tử đã cho. Nó nhận một trong các hằng số `SVG_UNIT_TYPE_*` được định nghĩa trong {{domxref("SVGUnitTypes")}}.

## Giá trị

Một {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `gradientUnits`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
  <defs>
    <linearGradient id="gradient1" gradientUnits="userSpaceOnUse">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </linearGradient>
  </defs>
  <rect x="10" y="10" width="180" height="180" fill="url(#gradient1)" />
</svg>
```

```js
const gradient = document.getElementById("gradient1");
console.log(gradient.gradientUnits.baseVal); // Output: 1 (SVG_UNIT_TYPE_USERSPACEONUSE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
