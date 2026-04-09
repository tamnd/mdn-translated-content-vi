---
title: fr
slug: Web/SVG/Reference/Attribute/fr
page-type: svg-attribute
browser-compat: svg.elements.radialGradient.fr
sidebar: svgref
---

Thuộc tính **`fr`** xác định bán kính của tiêu điểm cho radial gradient.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("radialGradient")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

### Thay đổi giá trị của `fr`

Ví dụ sau trình bày hai hình tròn: hình đầu tiên có `fr` đặt thành `5%`, còn hình tròn kia có `fr` đặt thành `25%`.

```html
<svg
  viewBox="0 0 480 200"
  width="420"
  height="160"
  xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient
      id="gradient1"
      cx="0.5"
      cy="0.5"
      r="0.5"
      fx="0.35"
      fy="0.35"
      fr="5%">
      <stop offset="0%" stop-color="white" />
      <stop offset="100%" stop-color="darkseagreen" />
    </radialGradient>
    <radialGradient
      id="gradient2"
      cx="0.5"
      cy="0.5"
      r="0.5"
      fx="0.35"
      fy="0.35"
      fr="25%">
      <stop offset="0%" stop-color="white" />
      <stop offset="100%" stop-color="darkseagreen" />
    </radialGradient>
  </defs>

  <circle cx="100" cy="100" r="100" fill="url(#gradient1)" />
  <circle cx="340" cy="100" r="100" fill="url(#gradient2)" />
</svg>
```

{{EmbedLiveSample("changing_the_value_of_fr", "480", "200")}}

### Mối quan hệ của tiêu điểm với `(fx, fy)`

Ví dụ này có `fr` bằng `5%` và minh họa cách các thuộc tính `fx` và `fy` (các điểm được gắn nhãn như vậy trong SVG) đóng vai trò là gốc cho tiêu điểm của radial gradient. Tiêu điểm này là một hình tròn mà bán kính của nó (giá trị của `fr`) xác định thời điểm màu dừng đầu tiên, trong trường hợp này là màu đỏ, nên bắt đầu chuyển sang màu dừng khác, trong trường hợp này là màu xanh dương.

```html
<svg
  viewBox="0 0 120 120"
  width="165"
  height="165"
  xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient
      id="Gradient"
      cx="0.5"
      cy="0.5"
      r="0.5"
      fx="0.35"
      fy="0.35"
      fr="5%">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
  </defs>

  <rect
    x="10"
    y="10"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#Gradient)"
    stroke="black"
    stroke-width="2" />

  <circle
    cx="60"
    cy="60"
    r="50"
    fill="transparent"
    stroke="white"
    stroke-width="2" />
  <circle cx="45" cy="45" r="2" fill="white" stroke="white" />
  <circle cx="60" cy="60" r="2" fill="white" stroke="white" />
  <text x="38" y="40" fill="white" font-family="sans-serif" font-size="10pt">
    (fx,fy)
  </text>
  <text x="63" y="63" fill="white" font-family="sans-serif" font-size="10pt">
    (cx,cy)
  </text>
</svg>
```

{{EmbedLiveSample("the_focal_points_relationship_to_fx_fy", "200", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong><a href="/en-US/docs/Web/SVG/Guides/Content_type#length">&#x3C;length></a></strong>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>None</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
