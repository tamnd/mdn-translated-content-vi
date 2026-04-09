---
title: patternContentUnits
slug: Web/SVG/Reference/Attribute/patternContentUnits
page-type: svg-attribute
browser-compat: svg.elements.pattern.patternContentUnits
sidebar: svgref
---

Thuộc tính **`patternContentUnits`** chỉ định hệ tọa độ nào sẽ được dùng cho nội dung của phần tử {{ SVGElement("pattern") }}.

> [!NOTE]
> Thuộc tính này không có tác dụng nếu thuộc tính {{ SVGAttr("viewBox") }} được chỉ định trên phần tử {{ SVGElement("pattern") }}.

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
  <!--
  A pattern tile that content coordinates and values are
  computed against the current coordinate user space.
  Note that the size of the tile is computed against
  the bounding box of the target element
  -->
  <pattern
    id="p1"
    width="20%"
    height="20%"
    patternContentUnits="userSpaceOnUse">
    <circle cx="10" cy="10" r="10" />
  </pattern>

  <!--
  A pattern tile that content coordinates and values are
  computed against the bounding box of the target element.
  Note that the size of the tile is also computed against
  the bounding box of the target element
  -->
  <pattern
    id="p2"
    width="20%"
    height="20%"
    patternContentUnits="objectBoundingBox">
    <circle cx=".1" cy=".1" r=".1" />
  </pattern>

  <!-- Left square with user space tiles -->
  <rect x="10" y="10" width="80" height="80" fill="url(#p1)" />

  <!-- Right square with bounding box tiles -->
  <rect x="110" y="10" width="80" height="80" fill="url(#p2)" />
</svg>
```

{{EmbedLiveSample('Examples', 150, '100%')}}

## Các phần tử

Bạn có thể dùng thuộc tính này với các phần tử SVG được mô tả trong các phần bên dưới.

### `<pattern>`

Đối với {{SVGElement('pattern')}}, `patternContentUnits` xác định hệ tọa độ được dùng cho nội dung của phần tử.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>userSpaceOnUse</code> | <code>objectBoundingBox</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>userSpaceOnUse</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `userSpaceOnUse`
  - : Giá trị này cho biết mọi tọa độ bên trong phần tử {{SVGElement('pattern')}} đều tham chiếu đến hệ tọa độ người dùng như được định nghĩa khi tile pattern được tạo.
- `objectBoundingBox`
  - : Giá trị này cho biết mọi tọa độ bên trong phần tử {{SVGElement('pattern')}} đều tương đối với hộp bao của phần tử mà pattern được áp dụng lên. Một hộp bao có thể được xem như thể nội dung của {{ SVGElement("pattern") }} được ràng buộc với một {{ SVGAttr("viewBox") }} `"0 0 1 1"` cho một tile pattern có chiều rộng và chiều cao bằng 100%.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
