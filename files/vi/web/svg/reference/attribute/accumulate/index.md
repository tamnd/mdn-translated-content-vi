---
title: accumulate
slug: Web/SVG/Reference/Attribute/accumulate
page-type: svg-attribute
spec-urls: https://svgwg.org/specs/animations/#AccumulateAttribute
sidebar: svgref
---

Thuộc tính **`accumulate`** kiểm soát việc một hoạt ảnh có tính tích lũy hay không.

Điều này thường hữu ích khi các hoạt ảnh lặp lại cần dựa trên kết quả trước đó, tích lũy qua từng vòng lặp. Thuộc tính này cho hoạt ảnh biết liệu giá trị có được cộng vào giá trị của thuộc tính hoạt ảnh trước đó ở mỗi lần lặp hay không.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>none</code> | <code>sum</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>none</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `sum`
  - : Chỉ định rằng mỗi lần lặp lại sau lần đầu tiên sẽ dựa trên giá trị cuối cùng của lần lặp trước đó.
- `none`
  - : Chỉ định rằng các lần lặp lại không có tính tích lũy.

Thuộc tính này bị bỏ qua nếu giá trị thuộc tính đích không hỗ trợ phép cộng, hoặc nếu phần tử hoạt ảnh không lặp lại.

Thuộc tính này sẽ bị bỏ qua nếu hàm hoạt ảnh chỉ được chỉ định bằng thuộc tính {{SVGAttr("to")}}.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Hoạt ảnh SVG với SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL)
