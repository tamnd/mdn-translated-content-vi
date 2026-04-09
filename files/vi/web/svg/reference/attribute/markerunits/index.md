---
title: markerUnits
slug: Web/SVG/Reference/Attribute/markerUnits
page-type: svg-attribute
browser-compat: svg.elements.marker.markerUnits
sidebar: svgref
---

Thuộc tính **`markerUnits`** xác định hệ tọa độ cho các thuộc tính {{SVGAttr("markerWidth")}} và {{SVGAttr("markerHeight")}} cũng như nội dung của {{SVGElement("marker")}}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("marker")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>userSpaceOnUse</code> | <code>strokeWidth</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>strokeWidth</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `userSpaceOnUse`
  - : Giá trị này chỉ định rằng các thuộc tính `markerWidth` và `markerHeight` cùng nội dung của phần tử `<marker>` biểu diễn các giá trị trong hệ tọa độ người dùng hiện tại áp dụng cho đối tượng đồ họa tham chiếu tới marker (tức là hệ tọa độ người dùng của phần tử tham chiếu tới phần tử `<marker>` thông qua thuộc tính `marker`, `marker-start`, `marker-mid`, hoặc `marker-end`).
- `strokeWidth`
  - : Giá trị này chỉ định rằng các thuộc tính `markerWidth` và `markerHeight` cùng nội dung của phần tử `<marker>` biểu diễn các giá trị trong một hệ tọa độ mà một đơn vị đơn lẻ bằng kích thước theo đơn vị người dùng của độ rộng nét hiện tại (xem thuộc tính {{SVGAttr("stroke-width")}}) áp dụng cho đối tượng đồ họa tham chiếu tới marker.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("marker")}}
- {{SVGAttr("markerWidth")}}
- {{SVGAttr("markerHeight")}}
- {{SVGAttr("stroke-width")}}
