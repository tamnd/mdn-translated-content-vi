---
title: "SVGFETurbulenceElement: stitchTiles property"
short-title: stitchTiles
slug: Web/API/SVGFETurbulenceElement/stitchTiles
page-type: web-api-instance-property
browser-compat: api.SVGFETurbulenceElement.stitchTiles
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`stitchTiles`** của giao diện {{domxref("SVGFETurbulenceElement")}} phản ánh thuộc tính {{SVGAttr("stitchTiles")}} của phần tử {{SVGElement("feTurbulence")}} đã cho. Nhận một trong các hằng số `SVG_STITCHTYPE_*` được định nghĩa trên giao diện này.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `stitchTiles`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="turbulenceFilter">
      <feTurbulence
        type="fractalNoise"
        baseFrequency="0.05"
        numOctaves="3"
        stitchTiles="stitch" />
    </filter>
  </defs>

  <rect
    x="20"
    y="20"
    width="160"
    height="160"
    fill="lightblue"
    filter="url(#turbulenceFilter)" />
</svg>
```

```js
// Select the feTurbulence element
const turbulenceElement = document.querySelector("feTurbulence");

// Access the stitchTiles property
console.log(turbulenceElement.stitchTiles.baseVal); // Output: 1 (SVG_STITCHTYPE_STITCH)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
