---
title: elevation
slug: Web/SVG/Reference/Attribute/elevation
page-type: svg-attribute
browser-compat: svg.elements.feDistantLight.elevation
sidebar: svgref
---

Thuộc tính **`elevation`** chỉ định góc phương của nguồn sáng từ mặt phẳng XY hướng tới trục Z, tính bằng độ. Lưu ý rằng trục Z dương hướng về phía người xem nội dung.

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
      <feDistantLight elevation="0" />
    </feDiffuseLighting>
  </filter>
  <filter id="distantLight2">
    <feDiffuseLighting>
      <feDistantLight elevation="45" />
    </feDiffuseLighting>
  </filter>

  <circle cx="100" cy="100" r="80" filter="url(#distantLight1)" />
  <circle cx="340" cy="100" r="80" filter="url(#distantLight2)" />
</svg>
```

{{EmbedLiveSample("Example", "420", "200")}}

## Ghi chú sử dụng

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

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
