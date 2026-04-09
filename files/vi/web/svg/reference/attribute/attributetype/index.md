---
title: attributeType
slug: Web/SVG/Reference/Attribute/attributeType
page-type: svg-attribute
browser-compat: svg.elements.animate.attributeType
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`attributeType`** chỉ định không gian tên mà thuộc tính đích và các giá trị liên quan của nó được định nghĩa trong đó.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("set")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 250 250" xmlns="http://www.w3.org/2000/svg">
  <rect x="50" y="50" width="100" height="100">
    <animate
      attributeType="XML"
      attributeName="y"
      from="0"
      to="50"
      dur="5s"
      repeatCount="indefinite" />
  </rect>
</svg>
```

{{EmbedLiveSample("Example", "400", "250")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>CSS</code> | <code>XML</code> | <code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `CSS`
  - : Giá trị này chỉ định rằng giá trị của {{SVGAttr("attributeName")}} là tên của một thuộc tính CSS được định nghĩa là có thể animate.
- `XML`
  - : Giá trị này chỉ định rằng giá trị của {{SVGAttr("attributeName")}} là tên của một thuộc tính XML được định nghĩa là có thể animate trong không gian tên XML mặc định của phần tử đích.
- `auto`
  - : Giá trị này chỉ định rằng triển khai nên khớp {{SVGAttr("attributeName")}} với một thuộc tính của phần tử đích. User agent sẽ tìm trước trong danh sách các thuộc tính CSS để tìm một tên thuộc tính khớp, và nếu không có, sẽ tìm trong không gian tên XML mặc định của phần tử.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hoạt ảnh SVG với SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL)
