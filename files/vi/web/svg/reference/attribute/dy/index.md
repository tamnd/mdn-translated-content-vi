---
title: dy
slug: Web/SVG/Reference/Attribute/dy
page-type: svg-attribute
spec-urls:
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fedropshadow-dy
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-feoffset-dy
  - https://svgwg.org/svg2-draft/text.html#TextElementDYAttribute
sidebar: svgref
---

Thuộc tính **`dy`** cho biết một độ dịch chuyển theo trục y trên vị trí của một phần tử hoặc nội dung của nó.

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
  <line x1="10%" x2="10%" y1="0" y2="100%" />
  <line x1="0" x2="100%" y1="30%" y2="30%" />
  <line x1="0" x2="100%" y1="80%" y2="80%" />

  <!-- Some reference text -->
  <text x="10%" y="30%" fill="grey">SVG</text>

  <!-- The same text with a shift along the y-axis -->
  <text dy="50%" x="10%" y="30%">SVG</text>
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

Với {{SVGElement('feDropShadow')}}, `dy` xác định độ lệch y của bóng đổ. Đơn vị dùng để quy đổi giá trị thuộc tính được đặt bởi thuộc tính {{SVGAttr('primitiveUnits')}} của phần tử {{SVGElement('filter')}}.

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

Với {{SVGElement('feOffset')}}, `dy` xác định độ lệch y của đồ họa đầu vào của bộ lọc. Đơn vị dùng để quy đổi giá trị thuộc tính được đặt bởi thuộc tính {{SVGAttr('primitiveUnits')}} của phần tử {{SVGElement('filter')}}.

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

Với {{SVGElement('text')}}, nếu nó chứa một giá trị duy nhất, `dy` xác định độ dịch chuyển theo trục y cho tất cả glyph.

Nếu có nhiều giá trị, `dy` xác định độ dịch chuyển theo trục y cho từng glyph riêng lẻ tương đối với glyph đứng trước. Nếu có ít giá trị hơn glyph, các glyph còn lại dùng giá trị `0`. Nếu có nhiều giá trị hơn glyph, các giá trị thừa sẽ bị bỏ qua.

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
<svg viewBox="0 0 150 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Horizontal lines -->
  <line x1="0" x2="100%" y1="30" y2="30" />
  <line x1="0" x2="100%" y1="40" y2="40" />
  <line x1="0" x2="100%" y1="50" y2="50" />
  <line x1="0" x2="100%" y1="60" y2="60" />

  <!-- Vertical lines -->
  <line x1="10" x2="10" y1="0" y2="100%" />
  <line x1="50" x2="50" y1="0" y2="100%" />
  <line x1="90" x2="90" y1="0" y2="100%" />

  <!-- Behaviors change based on the number of values in the attributes -->
  <text dy="20" x="10" y="30">SVG</text>
  <text dy="0 10" x="50" y="30">SVG</text>
  <text dy="0 10 20" x="90" y="30">SVG</text>
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

Với {{SVGElement('tspan')}}, nếu nó chứa một giá trị duy nhất, `dy` xác định độ dịch chuyển theo trục y cho tất cả glyph xen kẽ.

Nếu có nhiều giá trị, `dy` xác định độ dịch chuyển theo trục y cho từng glyph riêng lẻ tương đối với glyph đứng trước. Nếu có ít giá trị hơn glyph, các glyph còn lại dùng giá trị `0`. Nếu có nhiều giá trị hơn glyph, các giá trị thừa sẽ bị bỏ qua.

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
