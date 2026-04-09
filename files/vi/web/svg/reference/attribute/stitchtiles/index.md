---
title: stitchTiles
slug: Web/SVG/Reference/Attribute/stitchTiles
page-type: svg-attribute
browser-compat: svg.elements.feTurbulence.stitchTiles
sidebar: svgref
---

Thuộc tính **`stitchTiles`** xác định cách các ô Perlin Noise hoạt động tại ranh giới.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feTurbulence")}}

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
  <filter id="noise1" x="0" y="0" width="100%" height="100%">
    <feTurbulence baseFrequency="0.025" stitchTiles="noStitch" />
  </filter>
  <filter id="noise2" x="0" y="0" width="100%" height="100%">
    <feTurbulence baseFrequency="0.025" stitchTiles="stitch" />
  </filter>

  <rect x="0" y="0" width="100" height="100" filter="url(#noise1)" />
  <rect x="100" y="0" width="100" height="100" filter="url(#noise1)" />
  <rect x="0" y="100" width="100" height="100" filter="url(#noise1)" />
  <rect x="100" y="100" width="100" height="100" filter="url(#noise1)" />

  <rect x="220" y="0" width="100" height="100" filter="url(#noise2)" />
  <rect x="320" y="0" width="100" height="100" filter="url(#noise2)" />
  <rect x="220" y="100" width="100" height="100" filter="url(#noise2)" />
  <rect x="320" y="100" width="100" height="100" filter="url(#noise2)" />
</svg>
```

{{EmbedLiveSample("Example", "420", "220")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>noStitch</code> | <code>stitch</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>noStitch</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `noStitch`
  - : Giá trị này cho biết không cố gắng tạo ra chuyển tiếp mượt mà ở ranh giới của các ô chứa hàm nhiễu loạn. Đôi khi kết quả sẽ cho thấy các điểm gián đoạn rõ rệt ở ranh giới ô.
- `stitch`
  - : Giá trị này cho biết user agent sẽ tự động điều chỉnh các giá trị x và y của tần số cơ sở sao cho chiều rộng và chiều cao của nút {{SVGElement("feTurbulence")}} (tức là chiều rộng và chiều cao của vùng con hiện tại) chứa một số nguyên chiều rộng và chiều cao ô cho octave đầu tiên.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
