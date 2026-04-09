---
title: specularConstant
slug: Web/SVG/Reference/Attribute/specularConstant
page-type: svg-attribute
browser-compat: svg.elements.feSpecularLighting.specularConstant
sidebar: svgref
---

Thuộc tính **`specularConstant`** điều khiển tỷ lệ phản xạ của ánh sáng phản quang. Nó biểu diễn giá trị k<sub>s</sub> trong [mô hình chiếu sáng Phong](https://en.wikipedia.org/wiki/Phong_reflection_model). Giá trị càng lớn thì phản xạ càng mạnh.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feSpecularLighting")}}

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
  <filter id="specularLighting1" x="0" y="0" width="100%" height="100%">
    <feSpecularLighting in="SourceGraphic" specularConstant="1.2">
      <fePointLight x="60" y="60" z="20" />
    </feSpecularLighting>
  </filter>
  <filter id="specularLighting2" x="0" y="0" width="100%" height="100%">
    <feSpecularLighting in="SourceGraphic" specularConstant="0.8">
      <fePointLight x="60" y="60" z="20" />
    </feSpecularLighting>
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#specularLighting1)" />
  <rect
    x="220"
    y="0"
    width="200"
    height="200"
    filter="url(#specularLighting2)" />
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
      <td><code>1</code></td>
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

## Xem thêm

- [Mô tả mô hình phản xạ Phong trên Wikipedia](https://en.wikipedia.org/wiki/Phong_reflection_model)
