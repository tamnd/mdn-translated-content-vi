---
title: primitiveUnits
slug: Web/SVG/Reference/Attribute/primitiveUnits
page-type: svg-attribute
browser-compat: svg.elements.filter.primitiveUnits
sidebar: svgref
---

Thuộc tính **`primitiveUnits`** chỉ định hệ tọa độ cho các giá trị độ dài khác nhau trong các filter primitive và cho các thuộc tính xác định vùng con của filter primitive.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("filter")}}

## Usage notes

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td><code>userSpaceOnUse</code> | <code>objectBoundingBox</code></td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td><code>userSpaceOnUse</code></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

- userSpaceOnUse
  - : Giá trị này cho biết mọi giá trị độ dài trong các định nghĩa filter đều biểu diễn giá trị trong hệ tọa độ người dùng hiện tại tại thời điểm phần tử {{SVGElement("filter")}} được tham chiếu (tức hệ tọa độ người dùng cho phần tử tham chiếu đến {{SVGElement("filter")}} thông qua thuộc tính {{SVGAttr("filter")}}).
- objectBoundingBox
  - : Giá trị này cho biết mọi giá trị độ dài trong các định nghĩa filter đều biểu diễn các phần hoặc phần trăm của hộp giới hạn trên phần tử đang tham chiếu.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
