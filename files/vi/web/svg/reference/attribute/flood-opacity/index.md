---
title: flood-opacity
slug: Web/SVG/Reference/Attribute/flood-opacity
page-type: svg-attribute
browser-compat: svg.global_attributes.flood-opacity
sidebar: svgref
---

Thuộc tính **`flood-opacity`** chỉ ra giá trị độ mờ sẽ được dùng trên toàn bộ vùng con của filter primitive hiện tại.

> [!NOTE]
> Với vai trò là một presentation attribute, `flood-opacity` cũng có thuộc tính CSS tương ứng: {{cssxref("flood-opacity")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feFlood")}} và {{SVGElement("feDropShadow")}}

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
    <feFlood
      flood-color="seagreen"
      flood-opacity="1"
      x="0"
      y="0"
      width="200"
      height="200" />
  </filter>
  <filter id="flood2">
    <feFlood
      flood-color="seagreen"
      flood-opacity="0.3"
      x="0"
      y="0"
      width="200"
      height="200" />
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#flood1)" />
  <rect x="220" y="0" width="200" height="200" filter="url(#flood2)" />
</svg>
```

{{EmbedLiveSample("Example", "420", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;alpha-value></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị khởi đầu</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<alpha-value>`
  - : Một số hoặc phần trăm chỉ ra giá trị độ mờ sẽ được dùng trên toàn bộ vùng con của filter primitive hiện tại.
    Giá trị số `0` hoặc phần trăm `0%` đại diện cho màu hoàn toàn trong suốt, `1` hoặc `100%` đại diện cho màu hoàn toàn không trong suốt.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("flood-opacity")}}
- {{SVGAttr("flood-color")}}
