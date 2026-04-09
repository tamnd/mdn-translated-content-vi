---
title: values
slug: Web/SVG/Reference/Attribute/values
page-type: svg-attribute
spec-urls:
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fecolormatrix-values
  - https://svgwg.org/specs/animations/#ValuesAttribute
sidebar: svgref
---

Thuộc tính `values` có nghĩa khác nhau tùy theo ngữ cảnh nó được dùng, hoặc nó định nghĩa một chuỗi giá trị được dùng trong suốt quá trình hoạt ảnh, hoặc nó là một danh sách số cho ma trận màu, được diễn giải khác nhau tùy theo kiểu thay đổi màu cần thực hiện.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("feColorMatrix")}}

## animate, animateMotion, animateTransform

Với {{SVGElement("animate")}}, {{SVGElement("animateMotion")}} và {{SVGElement("animateTransform")}}, `values` là một danh sách các giá trị định nghĩa chuỗi giá trị trong suốt quá trình hoạt ảnh. Nếu thuộc tính này được chỉ định, mọi giá trị thuộc tính {{SVGAttr("from")}}, {{SVGAttr("to")}} và {{SVGAttr("by")}} đặt trên phần tử sẽ bị bỏ qua.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts"
            >&#x3C;list-of-values></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>None</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `<list-of-values>`
  - : Giá trị này chứa một danh sách một hoặc nhiều giá trị được phân tách bằng dấu chấm phẩy. Kiểu của các giá trị được định nghĩa bởi các thuộc tính {{SVGAttr("href")}} và {{SVGAttr("attributeName")}}.

## feColorMatrix

Với phần tử {{SVGElement("feColorMatrix")}}, `values` là một danh sách các số được diễn giải khác nhau tùy theo giá trị của thuộc tính {{SVGAttr("type")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts"
            >&#x3C;list-of-numbers></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>
        <em
          >Nếu <code>type="matrix"</code>, ma trận đơn vị,<br />nếu
          <code>type="saturate"</code>, <code>1</code>, dẫn đến ma trận đơn vị,<br />nếu
          <code>type="hueRotate"</code>, <code>0</code>, dẫn đến ma trận đơn vị</em
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<list-of-numbers>`
  - : Giá trị này là một danh sách các số, được diễn giải khác nhau tùy theo giá trị của thuộc tính `type`:
    - Với `type="matrix"`, `values` là một danh sách 20 giá trị ma trận (a00 a01 a02 a03 a04 a10 a11 … a34), được phân tách bằng khoảng trắng và/hoặc dấu phẩy.
    - Với `type="saturate"`, `values` là một giá trị số thực đơn lẻ (0 đến 1).
    - Với `type="hueRotate"`, `values` là một giá trị số thực đơn lẻ (độ).
    - Với `type="luminanceToAlpha"`, `values` không áp dụng.

## Đặc tả

{{Specifications}}
