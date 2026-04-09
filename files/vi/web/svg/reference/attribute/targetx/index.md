---
title: targetX
slug: Web/SVG/Reference/Attribute/targetX
page-type: svg-attribute
browser-compat: svg.elements.feConvolveMatrix.targetX
sidebar: svgref
---

Thuộc tính **`targetX`** xác định vị trí theo chiều ngang của ma trận chập tương đối với một pixel đích nhất định trong ảnh đầu vào. Cột ngoài cùng bên trái của ma trận là cột số không. Giá trị phải thỏa mãn: `0` <= `targetX` < `x` của {{SVGAttr("order")}}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feConvolveMatrix")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("integer")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>floor(<code>x</code> of {{SVGAttr("order")}} / 2)</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

- `<integer>`
  - : Giá trị này biểu thị vị trí theo chiều ngang của ma trận chập tương đối với một pixel đích nhất định trong ảnh đầu vào.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("targetY")}}
