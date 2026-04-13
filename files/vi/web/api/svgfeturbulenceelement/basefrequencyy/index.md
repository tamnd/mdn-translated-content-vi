---
title: "SVGFETurbulenceElement: baseFrequencyY property"
short-title: baseFrequencyY
slug: Web/API/SVGFETurbulenceElement/baseFrequencyY
page-type: web-api-instance-property
browser-compat: api.SVGFETurbulenceElement.baseFrequencyY
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`baseFrequencyY`** của giao diện {{domxref("SVGFETurbulenceElement")}} phản ánh thành phần Y của thuộc tính {{SVGAttr("baseFrequency")}} của phần tử {{SVGElement("feTurbulence")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedInteger")}}.

## Ví dụ

### Truy cập thuộc tính `baseFrequencyY`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="turbulenceFilter">
      <feTurbulence
        type="fractalNoise"
        baseFrequency="0.5 0.25"
        numOctaves="4" />
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

// Access the baseFrequencyY property
console.log(turbulenceElement.baseFrequencyY.baseVal); // Output: 0.25
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
