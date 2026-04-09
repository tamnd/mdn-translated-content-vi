---
title: surfaceScale
slug: Web/SVG/Reference/Attribute/surfaceScale
page-type: svg-attribute
spec-urls:
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fediffuselighting-surfacescale
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fespecularlighting-surfacescale
sidebar: svgref
---

Thuộc tính **`surfaceScale`** biểu thị độ cao của bề mặt cho một primitive lọc chiếu sáng.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feDiffuseLighting")}}
- {{SVGElement("feSpecularLighting")}}

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
  <filter id="diffuseLighting1" x="0" y="0" width="100%" height="100%">
    <feDiffuseLighting in="SourceGraphic" surfaceScale="1">
      <fePointLight x="60" y="60" z="20" />
    </feDiffuseLighting>
  </filter>
  <filter id="diffuseLighting2" x="0" y="0" width="100%" height="100%">
    <feDiffuseLighting in="SourceGraphic" surfaceScale="15">
      <fePointLight x="60" y="60" z="20" />
    </feDiffuseLighting>
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#diffuseLighting1)" />
  <rect
    x="220"
    y="0"
    width="200"
    height="200"
    filter="url(#diffuseLighting2)" />
</svg>
```

{{EmbedLiveSample("Example", "420", "200")}}

## feSpecularLighting

Với {{SVGElement("feSpecularLighting")}}, `surfaceScale` xác định độ cao của bề mặt.

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
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

## feDiffuseLighting

Với {{SVGElement("feDiffuseLighting")}}, `surfaceScale` xác định độ cao của bề mặt.

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
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Xem thêm

- [Mô tả mô hình phản xạ Phong trên Wikipedia](https://en.wikipedia.org/wiki/Phong_reflection_model)
