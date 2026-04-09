---
title: requiredExtensions
slug: Web/SVG/Reference/Attribute/requiredExtensions
page-type: svg-attribute
browser-compat: svg.global_attributes.requiredExtensions
sidebar: svgref
---

Thuộc tính SVG **`requiredExtensions`** [conditional processing attribute](/en-US/docs/Web/SVG/Reference/Attribute#conditional_processing_attributes) là một danh sách các giá trị URL được phân tách bằng dấu cách, mỗi giá trị tham chiếu đến một phần mở rộng ngôn ngữ. Phần mở rộng ngôn ngữ là các khả năng mở rộng vượt ra ngoài những gì được định nghĩa bởi các đặc tả trình duyệt chuẩn.

Giá trị là một danh sách các tham chiếu URL, mỗi tham chiếu xác định các phần mở rộng cần thiết. Nếu tất cả các phần mở rộng được nêu trong danh sách đều được user agent hỗ trợ, phần tử sẽ được hiển thị như bình thường. Nếu thuộc tính có mặt nhưng giá trị là chuỗi rỗng, hoặc nếu bất kỳ phần mở rộng nào không được trình duyệt hỗ trợ, trình duyệt sẽ bỏ qua phần tử cùng với toàn bộ phần tử con của nó và không hiển thị chúng.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("a")}}
- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("circle")}}
- {{SVGElement("clipPath")}}
- {{SVGElement("defs")}}
- {{SVGElement("ellipse")}}
- {{SVGElement("foreignObject")}}
- {{SVGElement("g")}}
- {{SVGElement("image")}}
- {{SVGElement("line")}}
- {{SVGElement("mask")}}
- {{SVGElement("path")}}
- {{SVGElement("pattern")}}
- {{SVGElement("polygon")}}
- {{SVGElement("polyline")}}
- {{SVGElement("rect")}}
- {{SVGElement("set")}}
- {{SVGElement("svg")}}
- {{SVGElement("switch")}}
- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}
- {{SVGElement("use")}}

## Usage notes

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        <a href="/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts"><code>&lt;list-of-IRIs&gt;</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td>(none)</td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>No</td>
    </tr>
  </tbody>
</table>

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- {{SVGAttr("tabindex")}}
- {{SVGAttr("systemLanguage")}}
- {{SVGAttr("requiredFeatures")}}
