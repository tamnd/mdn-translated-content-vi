---
title: "SVGFEBlendElement: mode property"
short-title: mode
slug: Web/API/SVGFEBlendElement/mode
page-type: web-api-instance-property
browser-compat: api.SVGFEBlendElement.mode
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`mode`** của giao diện {{domxref("SVGFEBlendElement")}} phản ánh thuộc tính {{SVGAttr("mode")}} của phần tử đã cho. Nhận một trong các hằng số `SVG_FEBLEND_MODE_*` được định nghĩa trên giao diện này.

## Giá trị

Một {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `mode`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="blend-filter">
    <feBlend in="SourceGraphic" in2="SourceAlpha" mode="multiply" />
    <feBlend in="SourceGraphic" in2="BackgroundImage" mode="screen" />
  </filter>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="red"
    filter="url(#blend-filter)" />
  <circle cx="100" cy="100" r="50" fill="blue" filter="url(#blend-filter)" />
</svg>
```

```js
const blends = document.querySelectorAll("feBlend");

console.log(blends[0].mode.baseVal); // Output: 2 (SVG_FEBLEND_MODE_MULTIPLY)
console.log(blends[1].mode.baseVal); // Output: 3 (SVG_FEBLEND_MODE_SCREEN)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
