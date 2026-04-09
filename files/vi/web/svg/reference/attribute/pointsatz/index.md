---
title: pointsAtZ
slug: Web/SVG/Reference/Attribute/pointsAtZ
page-type: svg-attribute
browser-compat: svg.elements.feSpotLight.pointsAtZ
sidebar: svgref
---

Thuộc tính **`pointsAtZ`** biểu thị vị trí z trong hệ tọa độ được thiết lập bởi thuộc tính {{SVGAttr("primitiveUnits")}} trên phần tử {{SVGElement("filter")}} tại điểm mà nguồn sáng đang hướng tới, với giả định rằng trong hệ tọa độ cục bộ ban đầu, trục z dương hướng ra phía người đang xem nội dung và với giả định rằng một đơn vị dọc theo trục z bằng một đơn vị theo x và y.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feSpotLight")}}

## Example

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="lighting1" x="0" y="0" width="100%" height="100%">
    <feDiffuseLighting in="SourceGraphic">
      <feSpotLight x="100" y="100" z="50" pointsAtZ="0" />
    </feDiffuseLighting>
  </filter>
  <filter id="lighting2" x="0" y="0" width="100%" height="100%">
    <feDiffuseLighting in="SourceGraphic">
      <feSpotLight x="100" y="100" z="50" pointsAtZ="80" />
    </feDiffuseLighting>
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#lighting1)" />
  <rect x="220" y="0" width="200" height="200" filter="url(#lighting2)" />
</svg>
```

{{EmbedLiveSample("Example", "220", "220")}}

## Usage notes

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Default value</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Value</th>
      <td>{{cssxref("number")}}</td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
