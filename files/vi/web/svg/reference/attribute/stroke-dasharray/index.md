---
title: stroke-dasharray
slug: Web/SVG/Reference/Attribute/stroke-dasharray
page-type: svg-attribute
browser-compat: svg.global_attributes.stroke-dasharray
sidebar: svgref
---

Thuộc tính **`stroke-dasharray`** là một thuộc tính trình bày xác định mẫu các đoạn gạch và khoảng trống dùng để vẽ viền của hình dạng.

> [!NOTE]
> Là một thuộc tính trình bày, `stroke-dasharray` cũng có một thuộc tính CSS tương ứng: {{cssxref("stroke-dasharray")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

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
<svg viewBox="0 0 30 12" xmlns="http://www.w3.org/2000/svg">
  <style>
    line {
      stroke: black;
    }
  </style>
  <!-- Không có đoạn gạch hay khoảng trống -->
  <line x1="0" y1="1" x2="30" y2="1" />

  <!-- Các đoạn gạch và khoảng trống cùng kích thước -->
  <line x1="0" y1="3" x2="30" y2="3" stroke-dasharray="4" />

  <!-- Các đoạn gạch và khoảng trống có kích thước khác nhau -->
  <line x1="0" y1="5" x2="30" y2="5" stroke-dasharray="4 1" />

  <!-- Các đoạn gạch và khoảng trống có nhiều kích thước với số lượng giá trị lẻ -->
  <line x1="0" y1="7" x2="30" y2="7" stroke-dasharray="4 1 2" />

  <!-- Các đoạn gạch và khoảng trống có nhiều kích thước với số lượng giá trị chẵn -->
  <line x1="0" y1="9" x2="30" y2="9" stroke-dasharray="4 1 2 3" />

  <!-- Các đoạn gạch bắt đầu bằng một khoảng trống -->
  <line x1="0" y1="11" x2="30" y2="11" stroke-dasharray="0 4 0" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 150)}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>none</code> | <code>&#x3C;dasharray></code></td>
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

- \<dasharray>
  - : Danh sách các giá trị [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) và [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) được phân tách bằng dấu phẩy và/hoặc khoảng trắng, xác định độ dài xen kẽ của các đoạn gạch và khoảng trống.

    Nếu cung cấp số lượng giá trị lẻ, danh sách giá trị sẽ được lặp lại để tạo thành số lượng giá trị chẵn. Vì vậy, `5,3,2` tương đương với `5,3,2,5,3,2`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("stroke-dasharray")}}
