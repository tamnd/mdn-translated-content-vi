---
title: fill-opacity
slug: Web/SVG/Reference/Attribute/fill-opacity
page-type: svg-attribute
browser-compat: svg.global_attributes.fill-opacity
sidebar: svgref
---

Thuộc tính trình bày **`fill-opacity`** định nghĩa độ mờ của paint server (_màu_, _gradient_, _pattern_, v.v.) được áp dụng cho một hình dạng.

> [!NOTE]
> Là một thuộc tính trình bày, `fill-opacity` cũng có một thuộc tính CSS tương ứng: {{cssxref("fill-opacity")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('circle')}}
- {{SVGElement('ellipse')}}
- {{SVGElement('path')}}
- {{SVGElement('polygon')}}
- {{SVGElement('polyline')}}
- {{SVGElement('rect')}}
- {{SVGElement('text')}}
- {{SVGElement('textPath')}}
- {{SVGElement('tspan')}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 400 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Default fill opacity: 1 -->
  <circle cx="50" cy="50" r="40" />

  <!-- Fill opacity as a number -->
  <circle cx="150" cy="50" r="40" fill-opacity="0.7" />

  <!-- Fill opacity as a percentage -->
  <circle cx="250" cy="50" r="40" fill-opacity="50%" />

  <!-- Fill opacity as a CSS property -->
  <circle cx="350" cy="50" r="40" style="fill-opacity: .25;" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 150)}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>[0-1]</code> |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#paint"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> SVG2 giới thiệu các giá trị phần trăm cho `fill-opacity`, tuy nhiên hiện nó chưa được hỗ trợ rộng rãi (_xem [Tương thích trình duyệt](#browser_compatibility) bên dưới_). Vì vậy, thực hành tốt nhất là đặt độ mờ bằng một giá trị trong phạm vi `[0-1]`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("fill-opacity")}}
- {{SVGAttr("opacity")}}
- {{SVGAttr("stop-opacity")}}
- {{SVGAttr("stroke-opacity")}}
