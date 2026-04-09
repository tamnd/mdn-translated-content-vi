---
title: patternUnits
slug: Web/SVG/Reference/Attribute/patternUnits
page-type: svg-attribute
browser-compat: svg.elements.pattern.patternUnits
sidebar: svgref
---

Thuộc tính **`patternUnits`** cho biết hệ tọa độ nào được dùng cho các thuộc tính hình học của phần tử {{ SVGElement("pattern") }}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement('pattern')}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Tất cả các thuộc tính hình học đều tương đối với không gian người dùng hiện tại -->
  <pattern
    id="p1"
    x="12.5"
    y="12.5"
    width="25"
    height="25"
    patternUnits="userSpaceOnUse">
    <circle cx="10" cy="10" r="10" />
  </pattern>

  <!-- Tất cả các thuộc tính hình học đều tương đối với hộp giới hạn đích -->
  <pattern
    id="p2"
    x=".125"
    y=".125"
    width=".25"
    height=".25"
    patternUnits="objectBoundingBox">
    <circle cx="10" cy="10" r="10" />
  </pattern>

  <!-- Ô vuông bên trái dùng các ô theo không gian người dùng -->
  <rect x="10" y="10" width="80" height="80" fill="url(#p1)" />

  <!-- Ô vuông bên phải dùng các ô theo hộp giới hạn -->
  <rect x="110" y="10" width="80" height="80" fill="url(#p2)" />
</svg>
```

{{EmbedLiveSample("Examples", '100%', 200)}}

## Elements

Bạn có thể dùng thuộc tính này với các phần tử SVG được mô tả ở các mục bên dưới.

### `<pattern>`

Với {{SVGElement('pattern')}}, `patternUnits` xác định hệ tọa độ dùng cho các thuộc tính hình học ({{ SVGAttr("x") }}, {{ SVGAttr("y") }}, {{ SVGAttr("width") }} và {{ SVGAttr("height") }}) của phần tử.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td><code>userSpaceOnUse</code> | <code>objectBoundingBox</code></td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td><code>objectBoundingBox</code></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

- `userSpaceOnUse`
  - : Giá trị này cho biết mọi tọa độ của các thuộc tính hình học đều tham chiếu đến hệ tọa độ người dùng tại thời điểm phần tử được áp dụng.
- `objectBoundingBox`
  - : Giá trị này cho biết mọi tọa độ của các thuộc tính hình học biểu diễn các phần hoặc phần trăm của hộp giới hạn của phần tử mà pattern được áp dụng lên. Hộp giới hạn có thể được xem như thể nội dung của {{ SVGElement("pattern") }} được gắn với một {{ SVGAttr("viewBox") }} `"0 0 1 1"`.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
