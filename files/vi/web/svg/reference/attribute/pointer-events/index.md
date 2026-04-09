---
title: pointer-events
slug: Web/SVG/Reference/Attribute/pointer-events
page-type: svg-attribute
browser-compat: svg.global_attributes.pointer-events
sidebar: svgref
---

Thuộc tính **`pointer-events`** là một thuộc tính trình bày cho phép xác định liệu một phần tử có thể là đích của sự kiện chuột hay khi nào phần tử đó có thể là đích.

> [!NOTE]
> Là một thuộc tính trình bày, `pointer-events` cũng có thuộc tính CSS tương ứng: {{cssxref("pointer-events")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('a')}}
- {{SVGElement('circle')}}
- {{SVGElement('clipPath')}}
- {{SVGElement('defs')}}
- {{SVGElement('ellipse')}}
- {{SVGElement('foreignObject')}}
- {{SVGElement('g')}}
- {{SVGElement('image')}}
- {{SVGElement('line')}}
- {{SVGElement('marker')}}
- {{SVGElement('mask')}}
- {{SVGElement('path')}}
- {{SVGElement('pattern')}}
- {{SVGElement('polygon')}}
- {{SVGElement('polyline')}}
- {{SVGElement('rect')}}
- {{SVGElement('svg')}}
- {{SVGElement('switch')}}
- {{SVGElement('symbol')}}
- {{SVGElement('text')}}
- {{SVGElement('textPath')}}
- {{SVGElement('tspan')}}
- {{SVGElement('use')}}

## Example

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 20 10" xmlns="http://www.w3.org/2000/svg">
  <!--
  Hình tròn sẽ luôn chặn sự kiện chuột.
  Để thay đổi màu của hình chữ nhật bên dưới, bạn phải
  nhấp bên ngoài hình tròn
  -->
  <rect x="0" y="0" height="10" width="10" fill="black" />
  <circle cx="5" cy="5" r="4" fill="white" pointer-events="visiblePainted" />

  <!--
  Hình tròn bên dưới sẽ không bao giờ bắt sự kiện chuột.
  Hình chữ nhật bên dưới sẽ đổi màu dù bạn nhấp vào
  hình tròn hay chính hình chữ nhật
  -->
  <rect x="10" y="0" height="10" width="10" fill="black" />
  <circle cx="15" cy="5" r="4" fill="white" pointer-events="none" />
</svg>
```

```js
window.addEventListener("mouseup", (e) => {
  // Hãy chọn một màu ngẫu nhiên trong khoảng #000000 đến #FFFFFF
  const color = Math.round(Math.random() * 0xffffff);

  // Hãy định dạng màu để phù hợp với yêu cầu của CSS
  const fill = `#${color.toString(16).padStart(6, "0")}`;

  // Hãy áp dụng màu cho phần tử mà chúng ta
  // thực sự đã nhấp vào
  e.target.style.fill = fill;
});
```

{{EmbedLiveSample("Example", '100%', 150)}}

## Usage notes

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        <code>bounding-box</code> | <code>visiblePainted</code> |
        <code>visibleFill</code> | <code>visibleStroke</code> |
        <code>visible</code> | <code>painted</code> | <code>fill</code> |
        <code>stroke</code> | <code>all</code> | <code>none</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td><code>visiblePainted</code></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

_Để có lời giải thích chi tiết về từng giá trị có thể dùng, hãy xem tài liệu CSS {{cssxref('pointer-events')}}._

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- Thuộc tính CSS {{cssxref("pointer-events")}}
