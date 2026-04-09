---
title: cy
slug: Web/SVG/Reference/Attribute/cy
page-type: svg-attribute
browser-compat:
  - svg.elements.circle.cy
  - svg.elements.ellipse.cy
  - svg.elements.radialGradient.cy
sidebar: svgref
---

Thuộc tính **`cy`** xác định tọa độ trục y của một điểm tâm.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("circle")}}
- {{SVGElement("ellipse")}}
- {{SVGElement("radialGradient")}}

> [!NOTE]
> Với vai trò là một _geometry property_, {{cssxref("cy")}} cũng có thể được dùng làm thuộc tính CSS cho `<circle>` và `<ellipse>`.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 300" xmlns="http://www.w3.org/2000/svg">
  <radialGradient cy="25%" id="myGradient">
    <stop offset="0" stop-color="white" />
    <stop offset="100%" stop-color="black" />
  </radialGradient>

  <circle cy="50" cx="50" r="45" />
  <ellipse cy="150" cx="50" rx="45" ry="25" />
  <rect x="5" y="205" width="90" height="90" fill="url(#myGradient)" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 300)}}

## circle

Đối với {{SVGElement('circle')}}, `cy` xác định tọa độ trục y của tâm hình dạng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("length-percentage")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Tọa độ trục y của tâm `<circle>` cũng có thể được xác định bằng thuộc tính _geometry property_ {{cssxref("cy")}}. Nếu được đặt trong CSS, giá trị thuộc tính `cy` trong CSS sẽ ghi đè giá trị thuộc tính `cy`.

## ellipse

Đối với {{SVGElement('ellipse')}}, `cy` xác định tọa độ trục y của tâm hình dạng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("length-percentage")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Tọa độ trục y của tâm `<ellipse>` cũng có thể được xác định bằng thuộc tính _geometry property_ {{cssxref("cy")}}. Nếu được đặt trong CSS, giá trị thuộc tính `cy` trong CSS sẽ ghi đè giá trị thuộc tính `cy`.

## radialGradient

Đối với {{SVGElement('radialGradient')}}, `cy` xác định tọa độ trục y của đường tròn cuối cùng cho radial gradient.

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
      <td><code>50%</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 34 10" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient cy="0" id="myGradient000">
      <stop offset="0%" stop-color="gold" />
      <stop offset="50%" stop-color="green" />
      <stop offset="100%" stop-color="white" />
    </radialGradient>

    <radialGradient cy="50%" id="myGradient050">
      <stop offset="0%" stop-color="gold" />
      <stop offset="50%" stop-color="green" />
      <stop offset="100%" stop-color="white" />
    </radialGradient>

    <radialGradient cy="100%" id="myGradient100">
      <stop offset="0%" stop-color="gold" />
      <stop offset="50%" stop-color="green" />
      <stop offset="100%" stop-color="white" />
    </radialGradient>
  </defs>

  <rect
    x="1"
    y="1"
    width="8"
    height="8"
    fill="url(#myGradient000)"
    stroke="black" />
  <rect
    x="13"
    y="1"
    width="8"
    height="8"
    fill="url(#myGradient050)"
    stroke="black" />
  <rect
    x="25"
    y="1"
    width="8"
    height="8"
    fill="url(#myGradient100)"
    stroke="black" />
</svg>
```

{{EmbedLiveSample('radialGradient', 150, '100%')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("cx")}}
- {{SVGAttr("r")}}
- {{SVGAttr("rx")}}
- {{SVGAttr("ry")}}
- Thuộc tính hình học: {{cssxref("cx")}}, {{cssxref("cy")}}, {{cssxref("r")}}, {{cssxref("rx")}}, {{cssxref("ry")}}, {{cssxref("x")}}, {{cssxref("y")}}, {{cssxref("width")}}, {{cssxref("height")}}
