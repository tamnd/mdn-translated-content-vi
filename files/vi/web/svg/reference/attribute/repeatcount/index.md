---
title: repeatCount
slug: Web/SVG/Reference/Attribute/repeatCount
page-type: svg-attribute
browser-compat: svg.elements.animate.repeatCount
sidebar: svgref
---

Thuộc tính **`repeatCount`** cho biết số lần một animation sẽ diễn ra.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("set")}}

## Example

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 220 150" xmlns="http://www.w3.org/2000/svg">
  <rect x="0" y="0" width="100" height="100">
    <animate
      attributeType="XML"
      attributeName="y"
      from="0"
      to="50"
      dur="1s"
      repeatCount="5" />
  </rect>
  <rect x="120" y="0" width="100" height="100">
    <animate
      attributeType="XML"
      attributeName="y"
      from="0"
      to="50"
      dur="1s"
      repeatCount="indefinite" />
  </rect>
</svg>
```

{{EmbedLiveSample("Example", "220", "150")}}

## Usage notes

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>{{cssxref("number")}} | <code>indefinite</code></td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td><em>None</em></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>No</td>
    </tr>
  </tbody>
</table>

- `<number>`
  - : Giá trị này chỉ định số lần lặp. Nó có thể bao gồm các lần lặp một phần được biểu diễn bằng giá trị phân số. Một giá trị phân số mô tả một phần của simple duration. Giá trị phải lớn hơn `0`.
- `indefinite`
  - : Giá trị này cho biết animation sẽ được lặp vô thời hạn (tức là cho đến khi tài liệu kết thúc).

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
