---
title: operator
slug: Web/SVG/Reference/Attribute/operator
page-type: svg-attribute
spec-urls:
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-femorphology-operator
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fecomposite-operator
sidebar: svgref
---

Thuộc tính **`operator`** có hai ý nghĩa tùy theo ngữ cảnh được dùng. Hoặc nó xác định thao tác kết hợp hay biến hình sẽ được thực hiện.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feComposite")}}
- {{SVGElement("feMorphology")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
  font:
    20px "Helvetica",
    "Arial",
    sans-serif;
}
```

```html
<svg viewBox="0 0 120 70" xmlns="http://www.w3.org/2000/svg">
  <filter id="erode">
    <feMorphology operator="erode" radius="0.4" />
  </filter>
  <filter id="dilate">
    <feMorphology operator="dilate" radius="0.8" />
  </filter>

  <text x="0" y="15">Văn bản thường</text>
  <text x="0" y="40" filter="url(#erode)">Văn bản mảnh</text>
  <text x="0" y="65" filter="url(#dilate)">Văn bản đậm</text>
</svg>
```

{{EmbedLiveSample("Example", "240", "200")}}

## feComposite

Đối với {{SVGElement("feComposite")}}, `operator` xác định phép kết hợp sẽ được thực hiện.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>over</code> | <code>in</code> | <code>out</code> |
        <code>atop</code> | <code>xor</code> | <code>lighter</code> |
        <code>arithmetic</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>over</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `over`
  - : Giá trị này cho biết rằng đồ họa nguồn được định nghĩa trong thuộc tính {{SVGAttr("in")}} được đặt lên trên đồ họa đích được định nghĩa trong thuộc tính {{SVGAttr("in2")}}.
- `in`
  - : Giá trị này cho biết rằng các phần của đồ họa nguồn được định nghĩa trong thuộc tính `in` chồng lấp với đồ họa đích được định nghĩa trong thuộc tính `in2` sẽ thay thế đồ họa đích.
- `out`
  - : Giá trị này cho biết rằng các phần của đồ họa nguồn được định nghĩa trong thuộc tính `in` nằm ngoài đồ họa đích được định nghĩa trong thuộc tính `in2` sẽ được hiển thị.
- `atop`
  - : Giá trị này cho biết rằng các phần của đồ họa nguồn được định nghĩa trong thuộc tính `in`, chồng lấp với đồ họa đích được định nghĩa trong thuộc tính `in2`, sẽ thay thế đồ họa đích. Các phần của đồ họa đích không chồng lấp với đồ họa nguồn sẽ không bị thay đổi.
- `xor`
  - : Giá trị này cho biết rằng các vùng không chồng lấp của đồ họa nguồn được định nghĩa trong thuộc tính `in` và đồ họa đích được định nghĩa trong thuộc tính `in2` sẽ được kết hợp.
- `lighter`
  - : Giá trị này cho biết rằng tổng của đồ họa nguồn được định nghĩa trong thuộc tính `in` và đồ họa đích được định nghĩa trong thuộc tính `in2` sẽ được hiển thị.
- `arithmetic`
  - : Giá trị này cho biết rằng đồ họa nguồn được định nghĩa trong thuộc tính `in` và đồ họa đích được định nghĩa trong thuộc tính `in2` được kết hợp bằng công thức sau:

    `result = k1*i1*i2 + k2*i1 + k3*i2 + k4`

    trong đó:
    `i1` và `i2` chỉ các giá trị kênh pixel tương ứng của ảnh đầu vào, ánh xạ tới `in` và `in2` tương ứng, và {{SVGAttr("k1")}}, {{SVGAttr("k2")}}, {{SVGAttr("k3")}}, và {{SVGAttr("k4")}} chỉ các giá trị của các thuộc tính cùng tên.

## feMorphology

Đối với {{SVGElement("feMorphology")}}, `operator` xác định có erode (tức làm mảnh) hay dilate (làm dày) đồ họa nguồn.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>erode</code> | <code>dilate</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>erode</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `erode`
  - : Giá trị này làm mảnh đồ họa nguồn được định nghĩa trong thuộc tính {{SVGAttr("in")}}.
- `dilate`
  - : Giá trị này làm dày đồ họa nguồn được định nghĩa trong thuộc tính `in`.

## Thông số kỹ thuật

{{Specifications}}
