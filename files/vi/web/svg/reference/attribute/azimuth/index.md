---
title: azimuth
slug: Web/SVG/Reference/Attribute/azimuth
page-type: svg-attribute
browser-compat: svg.elements.feDistantLight.azimuth
sidebar: svgref
---

Thuộc tính **`azimuth`** chỉ định góc phương vị của nguồn sáng trên mặt phẳng XY (theo chiều kim đồng hồ), tính bằng độ từ trục x.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feDistantLight")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 440 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="distantLight1">
    <feDiffuseLighting>
      <feDistantLight azimuth="0" />
    </feDiffuseLighting>
  </filter>
  <filter id="distantLight2">
    <feDiffuseLighting>
      <feDistantLight azimuth="240" />
    </feDiffuseLighting>
  </filter>

  <circle cx="100" cy="100" r="80" filter="url(#distantLight1)" />
  <circle cx="340" cy="100" r="80" filter="url(#distantLight2)" />
</svg>
```

{{EmbedLiveSample("Example", "420", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("number")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>0</td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
