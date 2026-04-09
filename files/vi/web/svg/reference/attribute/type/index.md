---
title: type
slug: Web/SVG/Reference/Attribute/type
page-type: svg-attribute
sidebar: svgref
---

Thuộc tính `type` là một thuộc tính chung và có ý nghĩa khác nhau tùy theo ngữ cảnh nó được dùng.

- Với phần tử {{SVGElement("animateTransform")}}, nó định nghĩa kiểu biến đổi mà giá trị của nó thay đổi theo thời gian.
- Với phần tử {{SVGElement("feColorMatrix")}}, nó cho biết kiểu của phép toán ma trận. Từ khóa `matrix` cho biết sẽ cung cấp một ma trận giá trị đầy đủ 5x4. Các từ khóa khác là các lối tắt tiện dụng để thực hiện những phép biến đổi màu thường dùng mà không cần chỉ định một ma trận đầy đủ.
- Với các phần tử {{SVGElement("feFuncR")}}, {{SVGElement("feFuncG")}}, {{SVGElement("feFuncB")}} và {{SVGElement("feFuncA")}}, nó cho biết kiểu của hàm chuyển đổi thành phần.
- Với phần tử {{SVGElement("feTurbulence")}}, nó cho biết primitive bộ lọc nên thực hiện hàm nhiễu hay hàm turbulence.
- Với các phần tử {{SVGElement("style")}} và {{SVGElement("script")}}, nó định nghĩa kiểu nội dung của phần tử.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animateTransform")}}
- {{SVGElement("feColorMatrix")}}
- {{SVGElement("feFuncA")}}
- {{SVGElement("feFuncB")}}
- {{SVGElement("feFuncG")}}
- {{SVGElement("feFuncR")}}
- {{SVGElement("feTurbulence")}}
- {{SVGElement("script")}}
- {{SVGElement("style")}}

## Ngữ cảnh sử dụng

### Với phần tử &lt;animateTransform&gt;

Phần tử SVG: {{SVGElement("animateTransform")}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Danh mục</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong><code>translate</code></strong> | <code>scale</code> |
        <code>rotate</code> | <code>skewX</code> | <code>skewY</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Tài liệu chuẩn tắc</th>
      <td>
        <a
          href="https://svgwg.org/specs/animations/#AnimateTransformElementTypeAttribute"
          >Scalable Vector Graphics (SVG) 2</a
        >
      </td>
    </tr>
  </tbody>
</table>

### Với phần tử &lt;feColorMatrix&gt;

Phần tử SVG: {{SVGElement("feColorMatrix")}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Danh mục</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong><code>matrix</code></strong> | <code>saturate</code> |
        <code>hueRotate</code> | <code>luminanceToAlpha</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Tài liệu chuẩn tắc</th>
      <td>
        <a
          href="https://drafts.csswg.org/filter-effects-1/#element-attrdef-fecolormatrix-type"
          rel="external"
          >Filter Effects Module Level 1</a
        >
      </td>
    </tr>
  </tbody>
</table>

### Với các phần tử &lt;feFuncR&gt;, &lt;feFuncG&gt;, &lt;feFuncB&gt; và &lt;feFuncA&gt;

Phần tử SVG: {{SVGElement("feFuncR")}}, {{SVGElement("feFuncG")}}, {{SVGElement("feFuncB")}}, {{SVGElement("feFuncA")}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Danh mục</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>identity</code> | <code>table</code> | <code>discrete</code> |
        <code>linear</code> | <code>gamma</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Tài liệu chuẩn tắc</th>
      <td>
        <a
          href="https://drafts.csswg.org/filter-effects-1/#element-attrdef-fecomponenttransfer-type"
          rel="external"
          >Filter Effects Module Level 1</a
        >
      </td>
    </tr>
  </tbody>
</table>

### Với phần tử &lt;feTurbulence&gt;

Phần tử SVG: {{SVGElement("feTurbulence")}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Danh mục</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>fractalNoise</code> | <strong><code>turbulence</code></strong>
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Tài liệu chuẩn tắc</th>
      <td>
        <a
          href="https://drafts.csswg.org/filter-effects-1/#element-attrdef-feturbulence-type"
          rel="external"
          >Filter Effects Module Level 1</a
        >
      </td>
    </tr>
  </tbody>
</table>

### Với các phần tử &lt;style&gt; và &lt;script&gt;

Phần tử SVG: {{SVGElement("style")}}, {{SVGElement("script")}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Danh mục</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td>&#x3C;media-type></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Tài liệu chuẩn tắc</th>
      <td>
        <a
          href="https://svgwg.org/svg2-draft/interact.html#ScriptElementTypeAttribute"
          rel="external"
          >Scalable Vector Graphics (SVG) 2</a
        ><br /><a
          href="https://svgwg.org/svg2-draft/styling.html#StyleElementTypeAttribute"
          rel="external"
          >Scalable Vector Graphics (SVG) 2</a
        >
      </td>
    </tr>
  </tbody>
</table>
