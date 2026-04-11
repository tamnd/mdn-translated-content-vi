---
title: "SVGFETurbulenceElement: seed property"
short-title: seed
slug: Web/API/SVGFETurbulenceElement/seed
page-type: web-api-instance-property
browser-compat: api.SVGFETurbulenceElement.seed
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`seed`** của giao diện {{domxref("SVGFETurbulenceElement")}} phản ánh thuộc tính {{SVGAttr("seed")}} của phần tử {{SVGElement("feTurbulence")}} đã cho.

Nó đặt một số hạt giống ngẫu nhiên để tạo hiệu ứng nhiễu phân hình hoặc nhiễu loạn.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `seed`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="turbulenceFilter">
      <feTurbulence
        type="fractalNoise"
        baseFrequency="0.05"
        numOctaves="3"
        seed="1234" />
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

// Access the seed property
console.log(turbulenceElement.seed.baseVal); // Output: 1234
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
