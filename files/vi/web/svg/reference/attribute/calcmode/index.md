---
title: calcMode
slug: Web/SVG/Reference/Attribute/calcMode
page-type: svg-attribute
spec-urls: https://svgwg.org/specs/animations/#CalcModeAttribute
sidebar: svgref
---

Thuộc tính **`calcMode`** chỉ định chế độ {{Glossary("interpolation")}} cho hoạt ảnh.

Chế độ mặc định là `linear`, tuy nhiên nếu thuộc tính không hỗ trợ nội suy tuyến tính (ví dụ: với chuỗi), thuộc tính `calcMode` sẽ bị bỏ qua và nội suy rời rạc sẽ được dùng.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>discrete</code> | <code>linear</code> | <code>paced</code> |
        <code>spline</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>linear</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `discrete`
  - : Chỉ định rằng hàm hoạt ảnh sẽ nhảy từ giá trị này sang giá trị tiếp theo mà không có bất kỳ nội suy nào.
- `linear`
  - : Nội suy tuyến tính đơn giản giữa các giá trị được dùng để tính toán hàm hoạt ảnh. Trừ {{SVGElement("animateMotion")}}, đây là giá trị mặc định.
- `paced`
  - : Xác định nội suy để tạo ra tốc độ thay đổi đều đặn xuyên suốt hoạt ảnh. Chỉ hỗ trợ cho các giá trị xác định một khoảng số tuyến tính, và khi đó có thể tính được một khái niệm nào đó về "khoảng cách" giữa các điểm (ví dụ: vị trí, chiều rộng, chiều cao, v.v.). Nếu chỉ định paced, mọi {{SVGAttr("keyTimes")}} hoặc {{SVGAttr("keySplines")}} sẽ bị bỏ qua. Với {{SVGElement("animateMotion")}}, đây là giá trị mặc định.
- `spline`
  - : Nội suy từ một giá trị trong danh sách {{SVGAttr("values")}} sang giá trị tiếp theo theo một hàm thời gian được định nghĩa bởi một spline Bézier bậc ba. Các điểm của spline được định nghĩa trong thuộc tính {{SVGAttr("keyTimes")}}, và các điểm điều khiển cho mỗi khoảng được định nghĩa trong thuộc tính {{SVGAttr("keySplines")}}.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [SVG animation with SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL)
