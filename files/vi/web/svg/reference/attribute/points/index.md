---
title: points
slug: Web/SVG/Reference/Attribute/points
page-type: svg-attribute
spec-urls:
  - https://svgwg.org/svg2-draft/shapes.html#PolygonElementPointsAttribute
  - https://svgwg.org/svg2-draft/shapes.html#PolylineElementPointsAttribute
sidebar: svgref
---

Thuộc tính **`points`** xác định một danh sách các điểm. Mỗi điểm được xác định bằng một cặp số biểu thị tọa độ X và Y trong hệ tọa độ người dùng. Nếu thuộc tính chứa số lượng tọa độ lẻ, tọa độ cuối cùng sẽ bị bỏ qua.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("polyline")}}
- {{SVGElement("polygon")}}

## Example

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="-10 -10 220 120" xmlns="http://www.w3.org/2000/svg">
  <!-- polyline là một hình mở -->
  <polyline stroke="black" fill="none" points="50,0 21,90 98,35 2,35 79,90" />

  <!-- polygon là một hình khép kín -->
  <polygon
    stroke="black"
    fill="none"
    transform="translate(100,0)"
    points="50,0 21,90 98,35 2,35 79,90" />

  <!--
  Thông thường, cách tốt nhất là tách tọa độ X và Y bằng dấu phẩy
  và tách các nhóm tọa độ bằng dấu cách.
  Điều đó giúp mọi thứ dễ đọc hơn cho con người.
  -->
</svg>
```

{{EmbedLiveSample("Example", '100%', 200)}}

## polyline

Với {{SVGElement('polyline')}}, `points` xác định một danh sách các điểm, mỗi điểm biểu thị một đỉnh của đường sẽ được vẽ. Mỗi điểm được xác định bằng một tọa độ X và Y trong hệ tọa độ người dùng.

> [!NOTE]
> polyline là một hình mở, nghĩa là điểm cuối không được nối với điểm đầu.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>[ {{cssxref("number")}}+ ]#</td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td><em>none</em></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="-10 -10 120 120" xmlns="http://www.w3.org/2000/svg">
  <!-- polyline là một hình mở -->
  <polyline stroke="black" fill="none" points="50,0 21,90 98,35 2,35 79,90" />
</svg>
```

{{EmbedLiveSample('polyline', '100%', 200)}}

## polygon

Với {{SVGElement('polygon')}}, `points` xác định một danh sách các điểm, mỗi điểm biểu thị một đỉnh của hình sẽ được vẽ. Mỗi điểm được xác định bằng một tọa độ X và Y trong hệ tọa độ người dùng.

> [!NOTE]
> polygon là một hình khép kín, nghĩa là điểm cuối được nối với điểm đầu.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>[ {{cssxref("number")}}+ ]#</td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td><em>none</em></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="-10 -10 120 120" xmlns="http://www.w3.org/2000/svg">
  <!-- polygon là một hình khép kín -->
  <polygon stroke="black" fill="none" points="50,0 21,90 98,35 2,35 79,90" />
</svg>
```

{{EmbedLiveSample('polygon', '100%', 200)}}

## Specifications

{{Specifications}}
