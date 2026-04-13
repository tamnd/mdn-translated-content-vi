---
title: "SVGFEDiffuseLightingElement: surfaceScale property"
short-title: surfaceScale
slug: Web/API/SVGFEDiffuseLightingElement/surfaceScale
page-type: web-api-instance-property
browser-compat: api.SVGFEDiffuseLightingElement.surfaceScale
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`surfaceScale`** của giao diện {{domxref("SVGFEDiffuseLightingElement")}} phản ánh thuộc tính {{SVGAttr("surfaceScale")}} của phần tử {{SVGElement("feDiffuseLighting")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `surfaceScale`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="diffuseLightingFilter">
      <feDiffuseLighting
        in="SourceGraphic"
        surfaceScale="2"
        lighting-color="white">
        <feDistantLight azimuth="45" elevation="55" />
      </feDiffuseLighting>
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="lightblue"
    filter="url(#diffuseLightingFilter)" />
</svg>
```

```js
const diffuseLighting = document.querySelector("feDiffuseLighting");

console.log(diffuseLighting.surfaceScale.baseVal); // Output: 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
