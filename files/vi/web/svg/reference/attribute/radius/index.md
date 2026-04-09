---
title: radius
slug: Web/SVG/Reference/Attribute/radius
page-type: svg-attribute
browser-compat: svg.elements.feMorphology.radius
sidebar: svgref
---

Thuộc tính **`radius`** biểu thị bán kính (hoặc các bán kính) cho phép toán trên một filter primitive {{SVGElement("feMorphology")}} nhất định.

Nếu cung cấp hai số, số đầu tiên biểu thị bán kính x và số thứ hai là bán kính y. Nếu cung cấp một số, giá trị đó sẽ được dùng cho cả x và y. Các giá trị nằm trong hệ tọa độ do thuộc tính {{SVGAttr("primitiveUnits")}} trên phần tử {{SVGElement("filter")}} thiết lập.

Giá trị âm hoặc bằng 0 sẽ vô hiệu hóa hiệu ứng của filter primitive đó (tức là kết quả là ảnh đầu vào của bộ lọc).

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feMorphology")}}

## Usage notes

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        <a href="/en-US/docs/Web/SVG/Guides/Content_type#number-optional-number"
          >&#x3C;number-optional-number></a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
