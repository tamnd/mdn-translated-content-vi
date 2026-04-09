---
title: limitingConeAngle
slug: Web/SVG/Reference/Attribute/limitingConeAngle
page-type: svg-attribute
browser-compat: svg.elements.feSpotLight.limitingConeAngle
sidebar: svgref
---

Thuộc tính **`limitingConeAngle`** biểu thị góc, tính bằng độ, giữa trục của đèn rọi (tức là trục giữa nguồn sáng và điểm mà nó đang hướng tới) và nón đèn rọi. Vì vậy, nó xác định một nón giới hạn, giới hạn vùng mà ánh sáng được chiếu tới. Không có ánh sáng nào được chiếu ra ngoài nón.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feSpotLight")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 480 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="spotLight1" x="0" y="0" width="100%" height="100%">
    <feDiffuseLighting diffuseConstant="2">
      <feSpotLight
        x="10"
        y="10"
        z="50"
        pointsAtX="100"
        pointsAtY="100"
        limitingConeAngle="10" />
    </feDiffuseLighting>
  </filter>
  <filter id="spotLight2" x="0" y="0" width="100%" height="100%">
    <feDiffuseLighting diffuseConstant="2">
      <feSpotLight
        x="10"
        y="10"
        z="50"
        pointsAtX="100"
        pointsAtY="100"
        limitingConeAngle="40" />
    </feDiffuseLighting>
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#spotLight1)" />
  <rect x="220" y="0" width="200" height="200" filter="url(#spotLight2)" />
</svg>
```

{{EmbedLiveSample("Example", "480", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("number")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
