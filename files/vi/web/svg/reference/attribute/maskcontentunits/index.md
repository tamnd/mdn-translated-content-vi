---
title: maskContentUnits
slug: Web/SVG/Reference/Attribute/maskContentUnits
page-type: svg-attribute
browser-compat: svg.elements.mask.maskContentUnits
sidebar: svgref
---

Thuộc tính **`maskContentUnits`** chỉ định hệ tọa độ nào sẽ được dùng cho nội dung của phần tử {{ SVGElement("mask") }}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement('mask')}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <mask id="myMask1" maskContentUnits="userSpaceOnUse">
    <rect fill="black" x="0" y="0" width="100%" height="100%" />
    <circle fill="white" cx="50" cy="50" r="35" />
  </mask>

  <mask id="myMask2" maskContentUnits="objectBoundingBox">
    <rect fill="black" x="0" y="0" width="100%" height="100%" />
    <circle fill="white" cx=".5" cy=".5" r=".35" />
  </mask>

  <!-- Some reference rect to materialized the mask -->
  <rect id="r1" x="0" y="0" width="45" height="45" />
  <rect id="r2" x="0" y="55" width="45" height="45" />
  <rect id="r3" x="55" y="55" width="45" height="45" />
  <rect id="r4" x="55" y="0" width="45" height="45" />

  <!-- The first 3 rect are masked with useSpaceOnUse units -->
  <use mask="url(#myMask1)" href="#r1" fill="red" />
  <use mask="url(#myMask1)" href="#r2" fill="red" />
  <use mask="url(#myMask1)" href="#r3" fill="red" />

  <!-- The last rect is masked with objectBoundingBox units -->
  <use mask="url(#myMask2)" href="#r4" fill="red" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 200)}}

## mask

Đối với {{SVGElement("mask")}}, `maskContentUnits` xác định hệ tọa độ được dùng cho nội dung của phần tử.

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
  - : Giá trị này cho biết rằng mọi tọa độ bên trong phần tử {{SVGElement('mask')}} đều tham chiếu tới hệ tọa độ người dùng như được định nghĩa khi mask được tạo.
- `objectBoundingBox`
  - : Giá trị này cho biết rằng mọi tọa độ bên trong phần tử {{SVGElement('mask')}} đều tương đối với hộp bao của phần tử mà mask được áp dụng lên. Một hộp bao có thể được xem như thể nội dung của {{ SVGElement("mask") }} được ràng buộc với một {{ SVGAttr("viewBox") }} `"0 0 1 1"` cho một tile mask có chiều rộng và chiều cao bằng 100%.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
