---
title: in2
slug: Web/SVG/Reference/Attribute/in2
page-type: svg-attribute
spec-urls:
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fedisplacementmap-in2
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fecomposite-in2
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-feblend-in2
sidebar: svgref
---

Thuộc tính **`in2`** xác định đầu vào thứ hai cho filter primitive đã cho. Nó hoạt động chính xác như thuộc tính {{SVGAttr("in")}}.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feBlend")}}
- {{SVGElement("feComposite")}}
- {{SVGElement("feDisplacementMap")}}

## feBlend

Với {{SVGElement("feBlend")}}, `in2` xác định ảnh đầu vào thứ hai cho thao tác hòa trộn.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>SourceGraphic</code> | <code>SourceAlpha</code> |
        <code>BackgroundImage</code> | <code>BackgroundAlpha</code> |
        <code>FillPaint</code> | <code>StrokePaint</code> |
        <code>&#x3C;filter-primitive-reference></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>
        <code>SourceGraphic</code> cho filter primitive đầu tiên, nếu không thì
        kết quả của filter primitive trước đó
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feComposite

Với {{SVGElement("feComposite")}}, `in2` xác định ảnh đầu vào thứ hai cho thao tác tổng hợp.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>SourceGraphic</code> | <code>SourceAlpha</code> |
        <code>BackgroundImage</code> | <code>BackgroundAlpha</code> |
        <code>FillPaint</code> | <code>StrokePaint</code> |
        <code>&#x3C;filter-primitive-reference></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>
        <code>SourceGraphic</code> cho filter primitive đầu tiên, nếu không thì
        kết quả của filter primitive trước đó
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feDisplacementMap

Với {{SVGElement("feDisplacementMap")}}, `in2` xác định ảnh đầu vào thứ hai, được dùng để dịch chuyển các pixel trong ảnh được định nghĩa trong thuộc tính {{SVGAttr("in")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>SourceGraphic</code> | <code>SourceAlpha</code> |
        <code>BackgroundImage</code> | <code>BackgroundAlpha</code> |
        <code>FillPaint</code> | <code>StrokePaint</code> |
        <code>&#x3C;filter-primitive-reference></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>
        <code>SourceGraphic</code> cho filter primitive đầu tiên, nếu không thì
        kết quả của filter primitive trước đó
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}
