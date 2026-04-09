---
title: clipPathUnits
slug: Web/SVG/Reference/Attribute/clipPathUnits
page-type: svg-attribute
spec-urls: https://drafts.csswg.org/css-masking-1/#element-attrdef-clippath-clippathunits
sidebar: svgref
---

Thuộc tính **`clipPathUnits`** chỉ định hệ tọa độ nào sẽ được dùng cho nội dung của phần tử {{ SVGElement("clipPath") }}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement('clipPath')}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100">
  <clipPath id="myClip1" clipPathUnits="userSpaceOnUse">
    <circle cx="50" cy="50" r="35" />
  </clipPath>

  <clipPath id="myClip2" clipPathUnits="objectBoundingBox">
    <circle cx=".5" cy=".5" r=".35" />
  </clipPath>

  <!-- Some reference rect to materialized to clip path -->
  <rect id="r1" x="0" y="0" width="45" height="45" />
  <rect id="r2" x="0" y="55" width="45" height="45" />
  <rect id="r3" x="55" y="55" width="45" height="45" />
  <rect id="r4" x="55" y="0" width="45" height="45" />

  <!-- The first 3 rect are clipped with userSpaceOnUse units -->
  <use clip-path="url(#myClip1)" href="#r1" fill="red" />
  <use clip-path="url(#myClip1)" href="#r2" fill="red" />
  <use clip-path="url(#myClip1)" href="#r3" fill="red" />

  <!-- The last rect is clipped with objectBoundingBox units -->
  <use clip-path="url(#myClip2)" href="#r4" fill="red" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 200)}}

## clipPath

Đối với {{SVGElement('clipPath')}}, `clipPathUnits` xác định hệ tọa độ được dùng cho nội dung của phần tử.

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

- userSpaceOnUse
  - : Giá trị này cho biết rằng mọi tọa độ bên trong phần tử {{SVGElement('clipPath')}} đều tham chiếu đến hệ tọa độ người dùng như được định nghĩa khi đường cắt được tạo.
- objectBoundingBox
  - : Giá trị này cho biết rằng mọi tọa độ bên trong phần tử {{SVGElement('clipPath')}} đều tương đối với hộp bao của phần tử mà đường cắt được áp dụng lên. Điều đó có nghĩa là gốc của hệ tọa độ là góc trên bên trái của hộp bao đối tượng và chiều rộng và chiều cao của hộp bao đối tượng được xem như có độ dài bằng 1 đơn vị.

## Thông số kỹ thuật

{{Specifications}}
