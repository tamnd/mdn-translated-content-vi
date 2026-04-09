---
title: color
slug: Web/SVG/Reference/Attribute/color
page-type: svg-attribute
browser-compat: svg.global_attributes.color
sidebar: svgref
---

Thuộc tính **`color`** được dùng để cung cấp một giá trị gián tiếp tiềm năng, `currentColor`, cho các thuộc tính {{SVGAttr("fill")}}, {{SVGAttr("stroke")}}, {{SVGAttr("stop-color")}}, {{SVGAttr("flood-color")}}, và {{SVGAttr("lighting-color")}}.

> [!NOTE]
> Với vai trò là một presentation attribute, `color` cũng có thuộc tính CSS tương ứng: {{cssxref("color")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Về mặt kỹ thuật, `color` có thể được áp dụng cho bất kỳ phần tử nào, nhưng nó không có tác dụng trực tiếp lên các phần tử SVG.

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code><a href="/en-US/docs/Web/CSS/Reference/Values/color_value">&#x3C;color></a></code>
        | <code>inherit</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>Tùy vào user agent</td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

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
  <g color="green">
    <rect width="50" height="50" fill="currentColor" />
    <circle
      r="25"
      cx="70"
      cy="70"
      stroke="currentColor"
      fill="none"
      stroke-width="5" />
  </g>
</svg>
```

{{EmbedLiveSample("Example", "100%", "110")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("color")}}
