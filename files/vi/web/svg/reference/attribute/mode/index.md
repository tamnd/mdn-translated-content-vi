---
title: mode
slug: Web/SVG/Reference/Attribute/mode
page-type: svg-attribute
browser-compat: svg.elements.feBlend.mode
sidebar: svgref
---

Thuộc tính **`mode`** xác định chế độ hòa trộn trên filter primitive {{SVGElement("feBlend")}}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feBlend")}}

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
<svg viewBox="0 0 480 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="blending1" x="0" y="0" width="100%" height="100%">
    <feFlood
      result="floodFill"
      x="0"
      y="0"
      width="100%"
      height="100%"
      flood-color="seagreen"
      flood-opacity="1" />
    <feBlend in="SourceGraphic" in2="floodFill" mode="multiply" />
  </filter>
  <filter id="blending2" x="0" y="0" width="100%" height="100%">
    <feFlood
      result="floodFill"
      x="0"
      y="0"
      width="100%"
      height="100%"
      flood-color="seagreen"
      flood-opacity="1" />
    <feBlend in="SourceGraphic" in2="floodFill" mode="color-dodge" />
  </filter>

  <image
    href="mdn_logo_only_color.png"
    width="200"
    height="200"
    filter="url(#blending1)" />
  <image
    x="220"
    href="mdn_logo_only_color.png"
    width="200"
    height="200"
    filter="url(#blending2)" />
</svg>
```

{{EmbedLiveSample("Example", "480", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("blend-mode")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>normal</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

Để biết mô tả về các giá trị, xem {{cssxref("blend-mode")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
