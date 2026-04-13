---
title: "SVGFEDiffuseLightingElement: diffuseConstant property"
short-title: diffuseConstant
slug: Web/API/SVGFEDiffuseLightingElement/diffuseConstant
page-type: web-api-instance-property
browser-compat: api.SVGFEDiffuseLightingElement.diffuseConstant
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`diffuseConstant`** của giao diện {{domxref("SVGFEDiffuseLightingElement")}} phản ánh thuộc tính {{SVGAttr("diffuseConstant")}} của phần tử {{SVGElement("feDiffuseLighting")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `diffuseConstant`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="diffuseLightingFilter">
      <feDiffuseLighting
        in="SourceGraphic"
        diffuseConstant="1.5"
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

console.log(diffuseLighting.diffuseConstant.baseVal); // Output: 1.5
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
