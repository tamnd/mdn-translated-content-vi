---
title: filterUnits
slug: Web/SVG/Reference/Attribute/filterUnits
page-type: svg-attribute
browser-compat: svg.elements.filter.filterUnits
sidebar: svgref
---

Thuộc tính **`filterUnits`** định nghĩa hệ tọa độ cho các thuộc tính {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}} và {{SVGAttr("height")}}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("filter")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>userSpaceOnUse</code> | <code>objectBoundingBox</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>objectBoundingBox</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `userSpaceOnUse`
  - : {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}} và {{SVGAttr("height")}} đại diện cho các giá trị trong hệ tọa độ hiện tại, kết quả của việc lấy hệ tọa độ người dùng hiện tại tại thời điểm phần tử {{SVGElement("filter")}} được tham chiếu (tức là hệ tọa độ người dùng của phần tử tham chiếu phần tử {{SVGElement("filter")}} qua thuộc tính {{SVGAttr("filter")}}).
- `objectBoundingBox`
  - : Trong trường hợp đó, {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}} và {{SVGAttr("height")}} đại diện cho các phân số hoặc phần trăm của bounding box trên phần tử tham chiếu.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
