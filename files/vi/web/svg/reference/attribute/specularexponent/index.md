---
title: specularExponent
slug: Web/SVG/Reference/Attribute/specularExponent
page-type: svg-attribute
spec-urls:
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fespecularlighting-specularexponent
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fespotlight-specularexponent
sidebar: svgref
---

Thuộc tính **`specularExponent`** điều khiển độ hội tụ của nguồn sáng. Giá trị càng lớn thì ánh sáng càng sáng.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feSpotLight")}}

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
    <feSpecularLighting in="SourceGraphic" specularExponent="1">
      <fePointLight x="60" y="60" z="20" />
    </feSpecularLighting>
  </filter>
  <filter id="diffuseLighting2" x="0" y="0" width="100%" height="100%">
    <feSpecularLighting in="SourceGraphic" specularExponent="5">
      <fePointLight x="60" y="60" z="20" />
    </feSpecularLighting>
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

Với {{SVGElement("feSpecularLighting")}}, `specularExponent` xác định giá trị số mũ cho thành phần phản quang.

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

## feSpotLight

Với {{SVGElement("feSpotLight")}}, `specularExponent` xác định giá trị số mũ điều khiển độ hội tụ của nguồn sáng.

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

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Mô tả mô hình phản xạ Phong trên Wikipedia](https://en.wikipedia.org/wiki/Phong_reflection_model)
