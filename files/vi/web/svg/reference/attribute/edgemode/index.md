---
title: edgeMode
slug: Web/SVG/Reference/Attribute/edgeMode
page-type: svg-attribute
spec-urls: https://drafts.csswg.org/filter-effects-1/#element-attrdef-feconvolvematrix-edgemode
sidebar: svgref
---

Thuộc tính **`edgeMode`** xác định cách mở rộng ảnh đầu vào khi cần bằng các giá trị màu để các thao tác ma trận có thể được áp dụng khi kernel nằm tại hoặc gần mép của ảnh đầu vào.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feConvolveMatrix")}}
- {{SVGElement("feGaussianBlur")}}

## feConvolveMatrix

Với {{SVGElement("feConvolveMatrix")}}, `edgeMode` xác định cách mở rộng ảnh đầu vào khi cần bằng các giá trị màu để các thao tác ma trận có thể được áp dụng khi kernel nằm tại hoặc gần mép của ảnh đầu vào.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>duplicate</code> | <code>wrap</code> | <code>none</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>duplicate</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `duplicate`
  - : Giá trị này cho biết ảnh đầu vào được mở rộng dọc theo mỗi cạnh khi cần bằng cách sao chép các giá trị màu ở cạnh đã cho của ảnh đầu vào.
- `wrap`
  - : Giá trị này cho biết ảnh đầu vào được mở rộng bằng cách lấy các giá trị màu từ cạnh đối diện của ảnh.
- `none`
  - : Giá trị này cho biết ảnh đầu vào được mở rộng bằng các giá trị pixel bằng 0 cho R, G, B và A.

## feGaussianBlur

Với {{SVGElement("feGaussianBlur")}}, `edgeMode` xác định cách mở rộng ảnh đầu vào khi cần bằng các giá trị màu để các thao tác ma trận có thể được áp dụng khi kernel nằm tại hoặc gần mép của ảnh đầu vào.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>duplicate</code> | <code>wrap</code> | <code>none</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>none</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `duplicate`
  - : Giá trị này cho biết ảnh đầu vào được mở rộng dọc theo mỗi cạnh khi cần bằng cách sao chép các giá trị màu ở cạnh đã cho của ảnh đầu vào.
- `wrap`
  - : Giá trị này cho biết ảnh đầu vào được mở rộng bằng cách lấy các giá trị màu từ cạnh đối diện của ảnh.
- `none`
  - : Giá trị này cho biết ảnh đầu vào được mở rộng bằng các giá trị pixel bằng 0 cho R, G, B và A.

## Thông số kỹ thuật

{{Specifications}}
