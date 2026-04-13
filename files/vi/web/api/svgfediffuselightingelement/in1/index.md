---
title: "SVGFEDiffuseLightingElement: in1 property"
short-title: in1
slug: Web/API/SVGFEDiffuseLightingElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFEDiffuseLightingElement.in1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in1`** của giao diện {{domxref("SVGFEDiffuseLightingElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử {{SVGElement("feDiffuseLighting")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

### Truy cập thuộc tính `in` của phần tử `feDiffuseLighting`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="diffuseLightingFilter">
      <feDiffuseLighting
        in="SourceGraphic"
        result="diffuseLightingResult"
        lighting-color="white"
        surfaceScale="1">
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

Chúng ta có thể truy cập thuộc tính `in` của phần tử `feDiffuseLighting`.

```js
const diffuseLighting = document.querySelector("feDiffuseLighting");

console.log(diffuseLighting.in1.baseVal); // Output: "SourceGraphic"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
