---
title: repeatDur
slug: Web/SVG/Reference/Attribute/repeatDur
page-type: svg-attribute
spec-urls: https://svgwg.org/specs/animations/#RepeatDurAttribute
sidebar: svgref
---

Thuộc tính **`repeatDur`** chỉ định tổng thời lượng để lặp lại một animation.

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
      repeatDur="5s" />
  </rect>
  <rect x="120" y="0" width="100" height="100">
    <animate
      attributeType="XML"
      attributeName="y"
      from="0"
      to="50"
      dur="1s"
      repeatDur="indefinite" />
  </rect>
</svg>
```

{{EmbedLiveSample("Example", "220", "150")}}

## Usage notes

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#clock-value"
            >&#x3C;clock-value></a
          ></code
        >
        | <code>indefinite</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Default values</th>
      <td><em>None</em></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>No</td>
    </tr>
  </tbody>
</table>

- `<clock-value>`
  - : Giá trị này chỉ định thời lượng trong thời gian trình bày để lặp lại animation.
- `indefinite`
  - : Giá trị này cho biết animation sẽ được lặp vô thời hạn (tức là cho đến khi tài liệu kết thúc).

## Specifications

{{Specifications}}
