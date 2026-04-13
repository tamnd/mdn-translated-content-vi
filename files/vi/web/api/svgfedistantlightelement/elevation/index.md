---
title: "SVGFEDistantLightElement: thuộc tính elevation"
short-title: elevation
slug: Web/API/SVGFEDistantLightElement/elevation
page-type: web-api-instance-property
browser-compat: api.SVGFEDistantLightElement.elevation
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`elevation`** của giao diện {{domxref("SVGFEDistantLightElement")}} phản ánh thuộc tính {{SVGAttr("elevation")}} của phần tử {{SVGElement("feDistantLight")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `elevation`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="lightingFilter">
      <feDistantLight azimuth="45" elevation="30" />
      <feDiffuseLighting result="light" lighting-color="white" surfaceScale="2">
        <feDistantLight azimuth="45" elevation="30" />
      </feDiffuseLighting>
    </filter>
  </defs>
  <rect
    x="50"
    y="50"
    width="100"
    height="100"
    fill="yellow"
    filter="url(#lightingFilter)" />
</svg>
```

```js
const distantLight = document.querySelector("feDistantLight");

console.log(distantLight.elevation.baseVal); // Đầu ra: 30
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
