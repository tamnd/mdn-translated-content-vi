---
title: "SVGFETurbulenceElement: type property"
short-title: type
slug: Web/API/SVGFETurbulenceElement/type
page-type: web-api-instance-property
browser-compat: api.SVGFETurbulenceElement.type
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("SVGFETurbulenceElement")}} phản ánh thuộc tính {{SVGAttr("type")}} của phần tử {{SVGElement("feTurbulence")}} đã cho. Nhận một trong các hằng số `SVG_TURBULENCE_TYPE_*` được định nghĩa trên giao diện này.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `type`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="turbulenceFilter">
      <feTurbulence
        type="fractalNoise"
        baseFrequency="0.05"
        numOctaves="3"
        result="turbulence" />
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

// Access the type property
console.log(turbulenceElement.type.baseVal); // Output: 1 (SVG_TURBULENCE_TYPE_FRACTALNOISE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
