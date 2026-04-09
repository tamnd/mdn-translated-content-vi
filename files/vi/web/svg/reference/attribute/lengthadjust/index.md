---
title: lengthAdjust
slug: Web/SVG/Reference/Attribute/lengthAdjust
page-type: svg-attribute
browser-compat:
  - svg.elements.text.lengthAdjust
  - svg.elements.tspan.lengthAdjust
sidebar: svgref
---

Thuộc tính `lengthAdjust` điều khiển cách văn bản được kéo giãn vào độ dài do thuộc tính {{SVGAttr("textLength")}} xác định.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg width="300" height="150" xmlns="http://www.w3.org/2000/svg">
  <g font-face="sans-serif">
    <text x="0" y="20" textLength="300" lengthAdjust="spacing">
      Kéo giãn chỉ bằng khoảng cách.
    </text>
    <text x="0" y="50" textLength="300" lengthAdjust="spacingAndGlyphs">
      Kéo giãn bằng cả khoảng cách lẫn glyph.
    </text>
    <text x="0" y="80" textLength="100" lengthAdjust="spacing">
      Thu nhỏ chỉ bằng khoảng cách.
    </text>
    <text x="0" y="110" textLength="100" lengthAdjust="spacingAndGlyphs">
      Thu nhỏ bằng cả khoảng cách lẫn glyph.
    </text>
  </g>
</svg>
```

{{EmbedLiveSample("Example", "420", "150")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>spacing</code> | <code>spacingAndGlyphs</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>spacing</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
