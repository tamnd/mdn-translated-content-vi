---
title: scale
slug: Web/SVG/Reference/Attribute/scale
page-type: svg-attribute
browser-compat: svg.elements.feDisplacementMap.scale
sidebar: svgref
---

Thuộc tính **`scale`** xác định hệ số tỷ lệ dịch chuyển được dùng cho một bộ lọc nguyên thủy {{SVGElement("feDisplacementMap")}}. Mức độ này được biểu thị trong hệ tọa độ do thuộc tính {{SVGAttr("primitiveUnits")}} trên phần tử {{SVGElement("filter")}} thiết lập.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feDisplacementMap")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 480 220" xmlns="http://www.w3.org/2000/svg">
  <filter id="displacementFilter" x="-20%" y="-20%" width="140%" height="140%">
    <feTurbulence
      type="turbulence"
      baseFrequency="0.05"
      numOctaves="2"
      result="turbulence" />
    <feDisplacementMap in2="turbulence" in="SourceGraphic" scale="5" />
  </filter>
  <filter id="displacementFilter2" x="-20%" y="-20%" width="140%" height="140%">
    <feTurbulence
      type="turbulence"
      baseFrequency="0.05"
      numOctaves="2"
      result="turbulence" />
    <feDisplacementMap in2="turbulence" in="SourceGraphic" scale="50" />
  </filter>

  <circle cx="100" cy="100" r="80" filter="url(#displacementFilter)" />
  <circle cx="340" cy="100" r="80" filter="url(#displacementFilter2)" />
</svg>
```

{{EmbedLiveSample("Example", "480", "200")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("number")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<number>`
  - : Giá trị này xác định hệ số tỷ lệ cho độ dịch chuyển.

    Khi giá trị của thuộc tính này là `0`, thao tác này không có tác dụng lên ảnh nguồn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
