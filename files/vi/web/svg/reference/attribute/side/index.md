---
title: side
slug: Web/SVG/Reference/Attribute/side
page-type: svg-attribute
status:
  - experimental
browser-compat: svg.elements.textPath.side
sidebar: svgref
---

{{SeeCompatTable}}

Thuộc tính **`side`** xác định phía của một đường dẫn mà văn bản được đặt lên trên đó (tương đối với hướng của đường dẫn).

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("textPath")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}

text {
  font:
    25px "Helvetica",
    "Arial",
    sans-serif;
}
```

```html
<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg">
  <text>
    <textPath href="#circle1" side="left">Text left from the path</textPath>
  </text>
  <text>
    <textPath href="#circle2" side="right">Text right from the path</textPath>
  </text>

  <circle
    id="circle1"
    cx="100"
    cy="100"
    r="70"
    fill="transparent"
    stroke="silver" />
  <circle
    id="circle2"
    cx="320"
    cy="100"
    r="70"
    fill="transparent"
    stroke="silver" />
</svg>
```

{{EmbedLiveSample("Example", "420", "220")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>left</code> | <code>right</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>left</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `left`
  - : Giá trị này đặt văn bản ở phía bên trái của đường dẫn (tương đối với hướng của đường dẫn).
- `right`
  - : Giá trị này đặt văn bản ở phía bên phải của đường dẫn (tương đối với hướng của đường dẫn). Điều này thực chất đảo ngược hướng của đường dẫn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
