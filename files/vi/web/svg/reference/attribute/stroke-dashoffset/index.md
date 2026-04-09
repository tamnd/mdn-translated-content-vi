---
title: stroke-dashoffset
slug: Web/SVG/Reference/Attribute/stroke-dashoffset
page-type: svg-attribute
browser-compat: svg.global_attributes.stroke-dashoffset
sidebar: svgref
---

Thuộc tính **`stroke-dashoffset`** là một thuộc tính trình bày xác định một độ lệch cho việc hiển thị của mảng gạch liên quan.

> [!NOTE]
> Là một thuộc tính trình bày, `stroke-dashoffset` cũng có một thuộc tính CSS tương ứng: {{cssxref("stroke-dashoffset")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('circle')}}
- {{SVGElement('ellipse')}}
- {{SVGElement('path')}}
- {{SVGElement('line')}}
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
<svg viewBox="-3 0 33 10" xmlns="http://www.w3.org/2000/svg">
  <!-- Không có mảng gạch -->
  <line x1="0" y1="1" x2="30" y2="1" stroke="black" />

  <!-- Không có độ lệch gạch -->
  <line x1="0" y1="3" x2="30" y2="3" stroke="black" stroke-dasharray="3 1" />

  <!--
  Đầu của phép tính mảng gạch
  được kéo về phía trước 3 đơn vị người dùng
  -->
  <line
    x1="0"
    y1="5"
    x2="30"
    y2="5"
    stroke="black"
    stroke-dasharray="3 1"
    stroke-dashoffset="3" />

  <!--
  Đầu của phép tính mảng gạch
  được đẩy lùi 3 đơn vị người dùng
  -->
  <line
    x1="0"
    y1="7"
    x2="30"
    y2="7"
    stroke="black"
    stroke-dasharray="3 1"
    stroke-dashoffset="-3" />

  <!--
  Đầu của phép tính mảng gạch
  được kéo về phía trước 1 đơn vị người dùng, và kết quả
  trông giống ví dụ trước đó
  -->
  <line
    x1="0"
    y1="9"
    x2="30"
    y2="9"
    stroke="black"
    stroke-dasharray="3 1"
    stroke-dashoffset="1" />

  <!--
  các đường màu đỏ sau đây làm nổi bật
  độ lệch của mảng gạch cho từng đường
  -->
  <path d="M0,5 h-3 M0,7 h3 M0,9 h-1" stroke="rgb(255 0 0 / 50%)" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 200)}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length"
            >&#x3C;length></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

Độ lệch thường được biểu diễn bằng đơn vị người dùng được quy đổi theo {{SVGAttr('pathLength')}} nhưng nếu dùng một [\<percentage>](/en-US/docs/Web/SVG/Guides/Content_type#percentage), giá trị sẽ được tính theo phần trăm của viewport hiện tại.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("stroke-dashoffset")}}
