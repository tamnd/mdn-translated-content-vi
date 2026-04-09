---
title: flood-color
slug: Web/SVG/Reference/Attribute/flood-color
page-type: svg-attribute
browser-compat: svg.global_attributes.flood-color
sidebar: svgref
---

Thuộc tính **`flood-color`** chỉ ra màu nào sẽ được dùng để lấp đầy subregion của primitive bộ lọc hiện tại.

> [!NOTE]
> Là một thuộc tính trình bày, `flood-color` cũng có một thuộc tính CSS tương ứng: {{cssxref("flood-color")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feFlood")}}
- {{SVGElement("feDropShadow")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="flood1">
    <feFlood flood-color="skyblue" x="0" y="0" width="200" height="200" />
  </filter>
  <filter id="flood2">
    <feFlood flood-color="seagreen" x="0" y="0" width="200" height="200" />
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#flood1)" />
  <rect x="220" y="0" width="200" height="200" filter="url(#flood2)" />
</svg>
```

{{EmbedLiveSample("Example", "420", "200")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("color")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị khởi tạo</th>
      <td><code>black</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("flood-color")}}
- {{SVGAttr("flood-opacity")}}
