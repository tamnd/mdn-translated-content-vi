---
title: style
slug: Web/SVG/Reference/Attribute/style
page-type: svg-attribute
browser-compat: svg.global_attributes.style
sidebar: svgref
---

Thuộc tính **`style`** cho phép bạn tạo kiểu cho một phần tử bằng các khai báo {{Glossary("CSS")}}. Nó hoạt động giống hệt [thuộc tính `style` trong HTML](/en-US/docs/Web/HTML/Reference/Global_attributes/style).

Bạn có thể dùng thuộc tính này với bất kỳ phần tử SVG nào.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 60" xmlns="http://www.w3.org/2000/svg">
  <rect
    width="80"
    height="40"
    x="10"
    y="10"
    style="fill: skyblue; stroke: cadetblue; stroke-width: 2;" />
</svg>
```

{{EmbedLiveSample("Example", "200", "120")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;style></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `<style>`
  - : Cú pháp của dữ liệu style phụ thuộc vào ngôn ngữ stylesheet. Theo mặc định, ngôn ngữ stylesheet là [CSS](/en-US/docs/Web/CSS).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("style")}}
- [Thuộc tính `style` trong HTML](/en-US/docs/Web/HTML/Reference/Global_attributes/style)
