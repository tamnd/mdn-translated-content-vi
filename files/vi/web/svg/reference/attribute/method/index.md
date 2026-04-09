---
title: method
slug: Web/SVG/Reference/Attribute/method
page-type: svg-attribute
spec-urls: https://svgwg.org/svg2-draft/text.html#TextPathElementMethodAttribute
sidebar: svgref
---

Thuộc tính **`method`** cho biết phương pháp mà văn bản nên được hiển thị dọc theo đường dẫn của phần tử {{SVGElement("textPath")}}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("textPath")}}

## textPath

Với {{SVGElement("textPath")}}, `method` cho biết phương pháp mà văn bản nên được hiển thị dọc theo đường dẫn.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>align</code> | <code>stretch</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>align</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- align
  - : Giá trị này cho biết các ký tự nên được hiển thị sao cho chúng không bị kéo giãn hoặc biến dạng. Các ký tự được xoay, thu phóng và kéo giãn khi chúng được hiển thị. Kết quả là, với các phông chữ có ký tự liên kết (ví dụ: phông chữ viết tay), các liên kết có thể không thẳng hàng đúng cách khi văn bản được hiển thị dọc theo đường dẫn.
- stretch
  - : Giá trị này cho biết đường bao ký tự sẽ được chuyển thành path, rồi sau đó được kéo giãn và có thể bị biến dạng. Với cách tiếp cận này, các ký tự liên kết, như trong phông chữ viết tay, sẽ giữ được liên kết của chúng.

## Thông số kỹ thuật

{{Specifications}}
