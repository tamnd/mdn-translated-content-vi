---
title: x2
slug: Web/SVG/Reference/Attribute/x2
page-type: svg-attribute
browser-compat:
  - svg.elements.line.x2
  - svg.elements.linearGradient.x2
sidebar: svgref
---

Thuộc tính **`x2`** được dùng để chỉ định tọa độ x thứ hai cho việc vẽ một phần tử SVG cần nhiều hơn một tọa độ. Những phần tử chỉ cần một tọa độ sẽ dùng thuộc tính {{SVGAttr("x")}} thay thế.

## Phần tử

Bạn có thể dùng thuộc tính này với các phần tử SVG được mô tả trong các phần bên dưới.

### `<line>`

Với {{SVGElement('line')}}, `x2` xác định tọa độ x của điểm kết thúc của đường thẳng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length"
            >&#x3C;length></a
          ></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
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

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 10 10" xmlns="http://www.w3.org/2000/svg">
  <line x1="5" x2="1" y1="1" y2="9" stroke="red" />
  <line x1="5" x2="5" y1="1" y2="9" stroke="green" />
  <line x1="5" x2="9" y1="1" y2="9" stroke="blue" />
</svg>
```

{{EmbedLiveSample('line', '100%', 200)}}

### `<linearGradient>`

Với {{SVGElement('linearGradient')}}, `x2` xác định tọa độ x của điểm kết thúc của _vector gradient_ dùng để ánh xạ các giá trị điểm dừng gradient. Hành vi chính xác của thuộc tính này bị ảnh hưởng bởi thuộc tính {{SVGAttr('gradientUnits')}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length"
            >&#x3C;length></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>100%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 20 10" xmlns="http://www.w3.org/2000/svg">
  <!--
  Theo mặc định, vector gradient kết thúc ở giới hạn
  bên phải của hộp giới hạn của hình dạng mà nó được áp dụng.
  -->
  <linearGradient x2="100%" id="g0">
    <stop offset="0" stop-color="black" />
    <stop offset="100%" stop-color="red" />
  </linearGradient>

  <rect x="1" y="1" width="8" height="8" fill="url(#g0)" />

  <!--
  Ở đây vector gradient kết thúc ở 20% của giới hạn
  bên trái của hộp giới hạn của hình dạng mà nó được áp dụng.
  -->
  <linearGradient x2="20%" id="g1">
    <stop offset="0" stop-color="black" />
    <stop offset="100%" stop-color="red" />
  </linearGradient>

  <rect x="11" y="1" width="8" height="8" fill="url(#g1)" />
</svg>
```

{{EmbedLiveSample('linearGradient', '100%', 200)}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 25 25" xmlns="http://www.w3.org/2000/svg">
  <line x1="2" x2="2" y1="5" y2="20" stroke="red" />
  <line x1="2" x2="12" y1="5" y2="20" stroke="green" />
  <line x1="2" x2="22" y1="5" y2="20" stroke="blue" />
</svg>
```

{{EmbedLiveSample("Examples", '100%', 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
