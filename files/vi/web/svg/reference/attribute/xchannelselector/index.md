---
title: xChannelSelector
slug: Web/SVG/Reference/Attribute/xChannelSelector
page-type: svg-attribute
browser-compat: svg.elements.feDisplacementMap.xChannelSelector
sidebar: svgref
---

Thuộc tính **`xChannelSelector`** cho biết kênh màu nào từ {{SVGAttr("in2")}} sẽ được dùng để làm lệch các điểm ảnh trong {{SVGAttr("in")}} theo trục x.

## Phần tử

Bạn có thể dùng thuộc tính này với phần tử SVG {{SVGElement("feDisplacementMap")}}.

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>R</code> | <code>G</code> | <code>B</code> | <code>A</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>A</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `R`
  - : Từ khóa này chỉ định rằng kênh màu đỏ của ảnh đầu vào được xác định trong {{SVGAttr("in2")}} sẽ được dùng để làm lệch các điểm ảnh của ảnh đầu vào được xác định trong {{SVGAttr("in")}} theo trục x.
- `G`
  - : Từ khóa này chỉ định rằng kênh màu xanh lá của ảnh đầu vào được xác định trong {{SVGAttr("in2")}} sẽ được dùng để làm lệch các điểm ảnh của ảnh đầu vào được xác định trong {{SVGAttr("in")}} theo trục x.
- `B`
  - : Từ khóa này chỉ định rằng kênh màu xanh dương của ảnh đầu vào được xác định trong {{SVGAttr("in2")}} sẽ được dùng để làm lệch các điểm ảnh của ảnh đầu vào được xác định trong {{SVGAttr("in")}} theo trục x.
- `A`
  - : Từ khóa này chỉ định rằng kênh alpha của ảnh đầu vào được xác định trong {{SVGAttr("in2")}} sẽ được dùng để làm lệch các điểm ảnh của ảnh đầu vào được xác định trong {{SVGAttr("in")}} theo trục x.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 440 160" xmlns="http://www.w3.org/2000/svg">
  <filter id="displacementFilter">
    <feImage
      href="mdn.svg"
      x="0"
      y="0"
      width="100%"
      height="100%"
      result="abc" />
    <feDisplacementMap
      in2="abc"
      in="SourceGraphic"
      scale="30"
      xChannelSelector="R" />
  </filter>
  <filter id="displacementFilter2">
    <feImage
      href="mdn.svg"
      x="0"
      y="0"
      width="100%"
      height="100%"
      result="abc" />
    <feDisplacementMap
      in2="abc"
      in="SourceGraphic"
      scale="30"
      xChannelSelector="B" />
  </filter>

  <text x="10" y="60" font-size="50" filter="url(#displacementFilter)">
    Some displaced text
  </text>
  <text x="10" y="120" font-size="50" filter="url(#displacementFilter2)">
    Some displaced text
  </text>
</svg>
```

{{EmbedLiveSample("Examples", "480", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
