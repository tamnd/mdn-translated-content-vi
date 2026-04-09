---
title: diffuseConstant
slug: Web/SVG/Reference/Attribute/diffuseConstant
page-type: svg-attribute
browser-compat: svg.elements.feDiffuseLighting.diffuseConstant
sidebar: svgref
---

Thuộc tính **`diffuseConstant`** biểu thị giá trị k<sub>d</sub> trong [mô hình chiếu sáng Phong](https://en.wikipedia.org/wiki/Phong_reflection_model). Trong SVG, đây có thể là bất kỳ số không âm nào.

Thuộc tính này được dùng để xác định giá trị RGB cuối cùng của một pixel cho trước. Ánh sáng-color càng sáng thì số này càng nên nhỏ.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feDiffuseLighting")}}

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
  <filter id="diffuseLighting1" x="0" y="0" width="100%" height="100%">
    <feDiffuseLighting in="SourceGraphic" diffuseConstant="1">
      <fePointLight x="60" y="60" z="20" />
    </feDiffuseLighting>
  </filter>
  <filter id="diffuseLighting2" x="0" y="0" width="100%" height="100%">
    <feDiffuseLighting in="SourceGraphic" diffuseConstant="2">
      <fePointLight x="60" y="60" z="20" />
    </feDiffuseLighting>
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#diffuseLighting1)" />
  <rect
    x="220"
    y="0"
    width="200"
    height="200"
    filter="url(#diffuseLighting2)" />
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
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Mô tả mô hình phản xạ Phong trên Wikipedia](https://en.wikipedia.org/wiki/Phong_reflection_model)
