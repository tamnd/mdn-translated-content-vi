---
title: fx
slug: Web/SVG/Reference/Attribute/fx
page-type: svg-attribute
browser-compat: svg.elements.radialGradient.fx
sidebar: svgref
---

Thuộc tính **`fx`** xác định tọa độ trục x của tiêu điểm cho một radial gradient.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("radialGradient")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 480 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient
      id="gradient1"
      cx="0.5"
      cy="0.5"
      r="0.5"
      fx="0.35"
      fy="0.35"
      fr="5%">
      <stop offset="0%" stop-color="white" />
      <stop offset="100%" stop-color="darkseagreen" />
    </radialGradient>
    <radialGradient
      id="gradient2"
      cx="0.5"
      cy="0.5"
      r="0.5"
      fx="0.75"
      fy="0.35"
      fr="5%">
      <stop offset="0%" stop-color="white" />
      <stop offset="100%" stop-color="darkseagreen" />
    </radialGradient>
  </defs>

  <circle cx="100" cy="100" r="100" fill="url(#gradient1)" />
  <circle cx="340" cy="100" r="100" fill="url(#gradient2)" />
</svg>
```

{{EmbedLiveSample("Example", "480", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>
        Trùng với giá trị trình bày của {{SVGAttr("cx")}} cho phần tử, bất kể giá trị của <code>cx</code> có được kế thừa hay không.
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>None</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
