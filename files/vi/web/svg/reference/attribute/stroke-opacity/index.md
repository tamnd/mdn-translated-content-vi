---
title: stroke-opacity
slug: Web/SVG/Reference/Attribute/stroke-opacity
page-type: svg-attribute
browser-compat: svg.global_attributes.stroke-opacity
sidebar: svgref
---

Thuộc tính **`stroke-opacity`** là một thuộc tính trình bày xác định độ trong suốt của paint server (_màu_, _gradient_, _pattern_, v.v.) được áp dụng cho stroke của một hình dạng.

> [!NOTE]
> Là một thuộc tính trình bày, `stroke-opacity` cũng có một thuộc tính CSS tương ứng: {{cssxref("stroke-opacity")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

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
<svg viewBox="0 0 40 10" xmlns="http://www.w3.org/2000/svg">
  <!-- Độ mờ stroke mặc định: 1 -->
  <circle cx="5" cy="5" r="4" stroke="green" />

  <!-- Độ mờ stroke dưới dạng số -->
  <circle cx="15" cy="5" r="4" stroke="green" stroke-opacity="0.7" />

  <!-- Độ mờ stroke dưới dạng phần trăm -->
  <circle cx="25" cy="5" r="4" stroke="green" stroke-opacity="50%" />

  <!-- Độ mờ stroke dưới dạng thuộc tính CSS -->
  <circle cx="35" cy="5" r="4" stroke="green" style="stroke-opacity: .3;" />
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
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

Điều quan trọng cần biết là stroke che phủ một phần fill của hình dạng, vì vậy một stroke có độ mờ khác `1` sẽ làm phần fill bên dưới hiện ra một phần. Để tránh hiệu ứng này, có thể áp dụng độ mờ toàn cục bằng thuộc tính {{SVGAttr('opacity')}} hoặc đặt stroke phía sau fill bằng thuộc tính {{SVGAttr('paint-order')}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("stroke-opacity")}}
