---
title: intercept
slug: Web/SVG/Reference/Attribute/intercept
page-type: svg-attribute
browser-compat: svg.elements.feFuncR
spec-urls: https://drafts.csswg.org/filter-effects-1/#element-attrdef-fecomponenttransfer-intercept
sidebar: svgref
---

Thuộc tính **`intercept`** xác định intercept của hàm tuyến tính của các chuyển đổi thành phần màu khi thuộc tính {{SVGAttr("type")}} được đặt thành `linear`.

Hàm `linear` được định nghĩa là `slope * color + intercept`, trong đó `color` là giá trị màu, `intercept` cung cấp một giá trị cơ sở cho kết quả, và [`slope`](/en-US/docs/Web/SVG/Reference/Attribute/slope) là một hệ số tỉ lệ.

Thuộc tính `intercept` được hỗ trợ bởi các phần tử con của filter primitive {{SVGElement("feComponentTransfer")}} và được dùng với các phần tử hàm chuyển đổi thành phần SVG sau khi `type="linear"` được đặt:

- {{SVGElement("feFuncA")}}
- {{SVGElement("feFuncB")}}
- {{SVGElement("feFuncG")}}
- {{SVGElement("feFuncR")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("number")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<number>`
  - : Giá trị này cho biết intercept của các hàm chuyển đổi thành phần tuyến tính.

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
      <feFuncR type="linear" intercept="0" />
      <feFuncG type="linear" intercept="0" />
      <feFuncB type="linear" intercept="0" />
    </feComponentTransfer>
  </filter>
  <filter id="componentTransfer2" x="0" y="0" width="100%" height="100%">
    <feComponentTransfer>
      <feFuncR type="linear" intercept="0.3" />
      <feFuncG type="linear" intercept="0.1" />
      <feFuncB type="linear" intercept="0.8" />
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

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
