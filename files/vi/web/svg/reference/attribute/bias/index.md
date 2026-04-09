---
title: bias
slug: Web/SVG/Reference/Attribute/bias
page-type: svg-attribute
browser-compat: svg.elements.feConvolveMatrix.bias
sidebar: svgref
---

Thuộc tính **`bias`** dịch chuyển phạm vi của bộ lọc. Sau khi áp dụng {{SVGAttr("kernelMatrix")}} của phần tử {{SVGElement("feConvolveMatrix")}} vào ảnh đầu vào để thu được một số, và áp dụng thuộc tính {{SVGAttr("divisor")}}, thuộc tính `bias` sẽ được cộng vào từng thành phần. Điều này cho phép biểu diễn các giá trị nếu không sẽ bị giới hạn về 0 hoặc 1.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feConvolveMatrix")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <a href="/en-US/docs/Web/SVG/Guides/Content_type#number">&#x3C;number></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

Một ứng dụng của `bias` là khi mong muốn giá trị xám 0.5 là đáp ứng bằng 0 của bộ lọc.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
