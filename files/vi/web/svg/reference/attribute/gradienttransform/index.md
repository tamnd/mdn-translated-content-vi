---
title: gradientTransform
slug: Web/SVG/Reference/Attribute/gradientTransform
page-type: svg-attribute
browser-compat:
  - svg.elements.linearGradient.gradientTransform
  - svg.elements.radialGradient.gradientTransform
sidebar: svgref
---

Thuộc tính **`gradientTransform`** chứa định nghĩa của một phép biến đổi bổ sung tùy chọn từ hệ tọa độ gradient sang hệ tọa độ đích (tức là, userSpaceOnUse hoặc objectBoundingBox). Điều này cho phép thực hiện những thứ như làm nghiêng gradient. Ma trận biến đổi bổ sung này được nhân hậu với (tức là chèn vào bên phải của) mọi phép biến đổi đã định nghĩa trước đó, bao gồm cả phép biến đổi ngầm định cần thiết để chuyển từ đơn vị hộp bao đối tượng sang không gian người dùng.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("linearGradient")}}
- {{SVGElement("radialGradient")}}

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
  <radialGradient
    id="gradient1"
    gradientUnits="userSpaceOnUse"
    cx="100"
    cy="100"
    r="100"
    fx="100"
    fy="100">
    <stop offset="0%" stop-color="darkblue" />
    <stop offset="50%" stop-color="skyblue" />
    <stop offset="100%" stop-color="darkblue" />
  </radialGradient>
  <radialGradient
    id="gradient2"
    gradientUnits="userSpaceOnUse"
    cx="100"
    cy="100"
    r="100"
    fx="100"
    fy="100"
    gradientTransform="skewX(20) translate(185, 0)">
    <stop offset="0%" stop-color="darkblue" />
    <stop offset="50%" stop-color="skyblue" />
    <stop offset="100%" stop-color="darkblue" />
  </radialGradient>

  <rect x="0" y="0" width="200" height="200" fill="url(#gradient1)" />
  <rect x="220" y="0" width="200" height="200" fill="url(#gradient2)" />
</svg>
```

{{EmbedLiveSample("Example", "420", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Phép biến đổi đồng nhất</em></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;transform-list></code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<transform-list>`
  - : Một danh sách [các hàm biến đổi](/en-US/docs/Web/CSS/Reference/Values/transform-function) chỉ định một phép biến đổi bổ sung từ hệ tọa độ gradient sang hệ tọa độ đích.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("transform-function")}}
