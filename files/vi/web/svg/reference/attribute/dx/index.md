---
title: dx
slug: Web/SVG/Reference/Attribute/dx
page-type: svg-attribute
spec-urls:
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fedropshadow-dx
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-feoffset-dx
  - https://svgwg.org/svg2-draft/text.html#TextElementDXAttribute
sidebar: svgref
---

Thuộc tính **`dx`** cho biết một độ dịch chuyển theo trục x trên vị trí của một phần tử hoặc nội dung của nó.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('feDropShadow')}}
- {{SVGElement('feOffset')}}
- {{SVGElement('text')}}
- {{SVGElement('tspan')}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Lines materialized the position of the glyphs -->
  <line x1="0" x2="100%" y1="50%" y2="50%" />
  <line x1="10%" x2="10%" y1="0" y2="100%" />
  <line x1="60%" x2="60%" y1="0" y2="100%" />

  <!-- Some reference text -->
  <text x="10%" y="50%" fill="grey">SVG</text>

  <!-- The same text with a shift along the x-axis -->
  <text dx="50%" x="10%" y="50%">SVG</text>
</svg>
```

```css
line {
  stroke: red;
  stroke-width: 0.5px;
  stroke-dasharray: 3px;
}
```

{{EmbedLiveSample("Example", '100%', 200)}}

## feDropShadow

Với {{SVGElement('feDropShadow')}}, `dx` xác định độ lệch x của bóng đổ. Đơn vị dùng để quy đổi giá trị thuộc tính được đặt bởi thuộc tính {{SVGAttr('primitiveUnits')}} của phần tử {{SVGElement('filter')}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number">&#x3C;number></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>2</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feOffset

Với {{SVGElement('feOffset')}}, `dx` xác định độ lệch x của đồ họa đầu vào của bộ lọc. Đơn vị dùng để quy đổi giá trị thuộc tính được đặt bởi thuộc tính {{SVGAttr('primitiveUnits')}} của phần tử {{SVGElement('filter')}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number">&#x3C;number></a></strong
        >
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

## text

Với {{SVGElement('text')}}, nếu nó chứa một giá trị duy nhất, `dx` xác định độ dịch chuyển theo trục x cho tất cả các glyph.

Nếu có nhiều giá trị, `dx` xác định độ dịch chuyển theo trục x cho từng glyph riêng lẻ tương đối với glyph đứng trước. Nếu có ít giá trị hơn glyph, các glyph còn lại dùng giá trị `0`. Nếu có nhiều giá trị hơn glyph, các giá trị thừa sẽ bị bỏ qua.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        Danh sách (<strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length"
            >&#x3C;length></a
          ></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >)
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Lines materialized the position of the glyphs -->
  <line x1="0" x2="100%" y1="25%" y2="25%" />
  <line x1="0" x2="100%" y1="50%" y2="50%" />
  <line x1="0" x2="100%" y1="75%" y2="75%" />

  <line x1="10%" x2="10%" y1="0" y2="100%" />
  <line x1="30%" x2="30%" y1="0" y2="100%" />
  <line x1="60%" x2="60%" y1="0" y2="100%" />

  <!-- Behaviors change based on the number
       of values in the attributes -->
  <text dx="20%" x="10%" y="25%">SVG</text>
  <text dx="0 10%" x="10%" y="50%">SVG</text>
  <text dx="0 10% 20%" x="10%" y="75%">SVG</text>
</svg>
```

```css
line {
  stroke: red;
  stroke-width: 0.5px;
  stroke-dasharray: 3px;
}
```

{{EmbedLiveSample('text', '100%', 100)}}

## tspan

Với {{SVGElement('tspan')}}, nếu nó chứa một giá trị duy nhất, `dx` xác định độ dịch chuyển theo trục x cho tất cả glyph xen kẽ.

Nếu có nhiều giá trị, `dx` xác định độ dịch chuyển theo trục x cho từng glyph riêng lẻ tương đối với glyph đứng trước. Nếu có ít giá trị hơn glyph, các glyph còn lại dùng giá trị `0`. Nếu có nhiều giá trị hơn glyph, các giá trị thừa sẽ bị bỏ qua.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        Danh sách (<strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length"
            >&#x3C;length></a
          ></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >)
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}
