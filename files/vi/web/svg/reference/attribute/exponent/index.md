---
title: exponent
slug: Web/SVG/Reference/Attribute/exponent
page-type: svg-attribute
spec-urls: https://drafts.csswg.org/filter-effects-1/#element-attrdef-fecomponenttransfer-exponent
sidebar: svgref
---

Thuộc tính **`exponent`** định nghĩa số mũ của hàm gamma.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feFuncA")}}
- {{SVGElement("feFuncB")}}
- {{SVGElement("feFuncG")}}
- {{SVGElement("feFuncR")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient
      id="gradient"
      gradientUnits="userSpaceOnUse"
      x1="0"
      y1="0"
      x2="200"
      y2="0">
      <stop offset="0" stop-color="red" />
      <stop offset="0.5" stop-color="lime" />
      <stop offset="1" stop-color="blue" />
    </linearGradient>
  </defs>

  <filter id="componentTransfer1" x="0" y="0" width="100%" height="100%">
    <feComponentTransfer>
      <feFuncR type="gamma" exponent="1" />
      <feFuncG type="gamma" exponent="1" />
      <feFuncB type="gamma" exponent="1" />
    </feComponentTransfer>
  </filter>
  <filter id="componentTransfer2" x="0" y="0" width="100%" height="100%">
    <feComponentTransfer>
      <feFuncR type="gamma" exponent="5" />
      <feFuncG type="gamma" exponent="5" />
      <feFuncB type="gamma" exponent="5" />
    </feComponentTransfer>
  </filter>

  <rect
    x="0"
    y="0"
    width="200"
    height="200"
    fill="url(#gradient)"
    filter="url(#componentTransfer1)" />
  <rect
    x="220"
    y="0"
    width="200"
    height="200"
    fill="url(#gradient)"
    filter="url(#componentTransfer2)" />
</svg>
```

{{EmbedLiveSample("Example", "480", "200")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("number")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<number>`
  - : Nếu thuộc tính {{SVGAttr("type")}} của phần tử component được đặt thành `gamma`, giá trị này chỉ định số mũ của hàm gamma

## Đặc tả

{{Specifications}}
