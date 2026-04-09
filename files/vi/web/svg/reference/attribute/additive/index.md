---
title: additive
slug: Web/SVG/Reference/Attribute/additive
page-type: svg-attribute
spec-urls: https://svgwg.org/specs/animations/#AdditiveAttribute
sidebar: svgref
---

Thuộc tính **`additive`** kiểm soát việc một hoạt ảnh có tính cộng thêm hay không.

Thường hữu ích khi định nghĩa hoạt ảnh như một độ lệch hoặc chênh lệch so với giá trị của thuộc tính, thay vì bằng các giá trị tuyệt đối.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>replace</code> | <code>sum</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>replace</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `sum`
  - : Chỉ định rằng hoạt ảnh sẽ được cộng vào giá trị nền của thuộc tính và các hoạt ảnh ưu tiên thấp hơn khác.
- `replace`
  - : Chỉ định rằng hoạt ảnh sẽ ghi đè giá trị nền của thuộc tính và các hoạt ảnh ưu tiên thấp hơn khác. Đây là giá trị mặc định, tuy nhiên hành vi cũng bị ảnh hưởng bởi các thuộc tính giá trị hoạt ảnh {{SVGAttr("by")}} và {{SVGAttr("to")}}, như mô tả trong [SMIL Animation: How from, to and by attributes affect additive behavior](https://www.w3.org/TR/smil-animation/#FromToByAndAdditive).

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Hoạt ảnh SVG với SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL)
