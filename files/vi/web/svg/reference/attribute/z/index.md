---
title: z
slug: Web/SVG/Reference/Attribute/z
page-type: svg-attribute
spec-urls:
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fepointlight-z
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fespotlight-z
sidebar: svgref
---

Thuộc tính **`z`** xác định vị trí dọc theo trục z cho một nguồn sáng trong hệ tọa độ được thiết lập bởi thuộc tính {{SVGAttr("primitiveUnits")}} trên phần tử {{SVGElement("filter")}}, với giả định rằng trong hệ tọa độ ban đầu, trục z dương hướng ra phía người đang xem nội dung và rằng một đơn vị trên trục z bằng một đơn vị trên trục x và y.

## Phần tử

Bạn có thể dùng thuộc tính này với các phần tử SVG được mô tả trong các phần bên dưới.

### `<fePointLight>`

Với {{SVGElement("fePointLight")}}, `z` xác định vị trí dọc theo trục z cho nguồn sáng trong hệ tọa độ được thiết lập bởi thuộc tính {{SVGAttr("primitiveUnits")}} trên phần tử {{SVGElement("filter")}}.

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
      <td>Có</td>
    </tr>
  </tbody>
</table>

### `<feSpotLight>`

Với {{SVGElement("feSpotLight")}}, `z` xác định vị trí dọc theo trục z cho nguồn sáng trong hệ tọa độ được thiết lập bởi thuộc tính {{SVGAttr("primitiveUnits")}} trên phần tử {{SVGElement("filter")}}.

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
      <td>Có</td>
    </tr>
  </tbody>
</table>

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
    <feDiffuseLighting in="SourceGraphic">
      <fePointLight x="60" y="60" z="10" />
    </feDiffuseLighting>
  </filter>
  <filter id="diffuseLighting2" x="0" y="0" width="100%" height="100%">
    <feDiffuseLighting in="SourceGraphic">
      <fePointLight x="340" y="60" z="50" />
    </feDiffuseLighting>
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#diffuseLighting1)" />
  <rect
    x="200"
    y="0"
    width="200"
    height="200"
    filter="url(#diffuseLighting2)" />
</svg>
```

{{EmbedLiveSample("Examples", "420", "200")}}

## Thông số kỹ thuật

{{Specifications}}
