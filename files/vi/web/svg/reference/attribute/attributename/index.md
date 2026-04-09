---
title: attributeName
slug: Web/SVG/Reference/Attribute/attributeName
page-type: svg-attribute
spec-urls: https://svgwg.org/specs/animations/#AttributeNameAttribute
sidebar: svgref
---

Thuộc tính **`attributeName`** chỉ ra tên của thuộc tính CSS hoặc thuộc tính của phần tử đích sẽ được thay đổi trong quá trình hoạt ảnh.

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
      <td><code>&#x3C;name></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `<name>`
  - : Giá trị này chỉ ra tên của thuộc tính CSS hoặc thuộc tính của phần tử đích sẽ được animate.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Hoạt ảnh SVG với SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL)
