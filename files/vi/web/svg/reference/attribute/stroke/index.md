---
title: stroke
slug: Web/SVG/Reference/Attribute/stroke
page-type: svg-attribute
browser-compat: svg.global_attributes.stroke
sidebar: svgref
---

Thuộc tính **`stroke`** là một thuộc tính trình bày xác định màu (_hoặc bất kỳ SVG paint server nào như gradient hay pattern_) được dùng để tô viền của hình dạng.

> [!NOTE]
> Là một thuộc tính trình bày, `stroke` cũng có một thuộc tính CSS tương ứng: {{cssxref("stroke")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('circle')}}
- {{SVGElement('ellipse')}}
- {{SVGElement('line')}}
- {{SVGElement('path')}}
- {{SVGElement('polygon')}}
- {{SVGElement('polyline')}}
- {{SVGElement('rect')}}
- {{SVGElement('text')}}
- {{SVGElement('textPath')}}
- {{SVGElement('tspan')}}

## Ví dụ

### Stroke màu cơ bản và stroke gradient

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 20 10" xmlns="http://www.w3.org/2000/svg">
  <!-- Stroke màu cơ bản -->
  <circle cx="5" cy="5" r="4" fill="none" stroke="green" />

  <!-- Stroke một hình tròn bằng gradient -->
  <defs>
    <linearGradient id="myGradient">
      <stop offset="0%" stop-color="green" />
      <stop offset="100%" stop-color="white" />
    </linearGradient>
  </defs>

  <circle cx="15" cy="5" r="4" fill="none" stroke="url(#myGradient)" />
</svg>
```

Kết quả đầu ra như sau:

{{EmbedLiveSample("Basic color and gradient stroke", '100%', 200)}}

### Ví dụ `context-stroke`

Trong ví dụ này, chúng ta định nghĩa ba hình dạng bằng các phần tử {{SVGElement('path')}}, mỗi hình có một màu `stroke` và [`fill`](/en-US/docs/Web/SVG/Reference/Attribute/fill) khác nhau. Chúng ta cũng định nghĩa một phần tử {{SVGElement('circle')}} làm marker thông qua phần tử {{SVGElement('marker')}}. Mỗi hình có marker được áp dụng thông qua thuộc tính CSS `marker`.

Phần tử {{SVGElement('circle')}} có `stroke="context-stroke"` và `fill="context-fill"` được đặt cho nó. Vì nó đang được đặt làm marker trong ngữ cảnh của các hình, các thuộc tính này khiến nó kế thừa `fill` và `stroke` được đặt trên phần tử {{SVGElement('path')}} trong mỗi trường hợp.

```html-nolint
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 90">
  <style>
    path {
      stroke-width: 2px;
      marker: url("#circle");
    }
  </style>
  <path d="M 10 44.64 L 30 10 L 70 10 L 90 44.64 L 70 79.28 L 30 79.28 Z"
        stroke="red" fill="orange" />
  <path d="M 100 44.64 L 80 10 L 120 10 L 140 44.64 L 120 79.28 L 80 79.28 Z"
        stroke="green" fill="lightgreen" />
  <path d="M 150 44.64 L 130 10 L 170 10 L 190 44.64 L 170 79.28 L 130 79.28 Z"
        stroke="blue" fill="lightblue" />
  <marker id="circle" markerWidth="12" markerHeight="12"
          refX="6" refY="6" markerUnits="userSpaceOnUse">
    <circle cx="6" cy="6" r="3" stroke-width="2"
            stroke="context-stroke" fill="context-fill"  />
  </marker>
</svg>
```

Kết quả đầu ra như sau:

{{EmbedLiveSample("`context-stroke` example", '100%', 220)}}

> [!NOTE]
> Các phần tử cũng có thể dùng `context-stroke` và `context-fill` để kế thừa giá trị `stroke` và `fill` khi chúng được tham chiếu bởi các phần tử {{SVGElement('use')}}.

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#paint"
            >&#x3C;paint></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>none</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("stroke")}}
