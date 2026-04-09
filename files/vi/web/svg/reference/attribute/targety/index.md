---
title: targetY
slug: Web/SVG/Reference/Attribute/targetY
page-type: svg-attribute
browser-compat: svg.elements.feConvolveMatrix.targetY
sidebar: svgref
---

Thuộc tính **`targetY`** xác định vị trí theo chiều dọc của ma trận chập tương đối với một pixel đích nhất định trong ảnh đầu vào. Hàng trên cùng của ma trận là hàng số không. Giá trị phải thỏa mãn: `0` <= `targetY` < `y` của {{SVGAttr("order")}}.

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
      <td><code>floor(<code>y</code> of {{SVGAttr("order")}} / 2)</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

- `<integer>`
  - : Giá trị này biểu thị vị trí theo chiều dọc của ma trận chập tương đối với một pixel đích nhất định trong ảnh đầu vào.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("targetX")}}
