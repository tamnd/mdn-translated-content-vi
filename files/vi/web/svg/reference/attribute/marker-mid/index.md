---
title: marker-mid
slug: Web/SVG/Reference/Attribute/marker-mid
page-type: svg-attribute
browser-compat: svg.global_attributes.marker-mid
sidebar: svgref
---

Thuộc tính **`marker-mid`** xác định mũi tên hoặc dấu đánh dấu nhiều điểm sẽ được vẽ tại tất cả các đỉnh bên trong của [hình dạng](/en-US/docs/Web/SVG/Reference/Element#shape_elements) đã cho.

Dấu đánh dấu được vẽ ở mọi đỉnh, ngoại trừ đỉnh đầu tiên và đỉnh cuối cùng của [dữ liệu đường dẫn](/en-US/docs/Web/SVG/Reference/Attribute/d#path_commands).

> [!NOTE]
> Là một thuộc tính trình bày, `marker-mid` cũng có một thuộc tính CSS tương ứng: {{cssxref("marker-mid")}}. Khi cả hai cùng được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("circle")}}
- {{SVGElement("ellipse")}}
- {{SVGElement("line")}}
- {{SVGElement("path")}}
- {{SVGElement("polygon")}}
- {{SVGElement("polyline")}}
- {{SVGElement("rect")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker id="circle" markerWidth="8" markerHeight="8" refX="4" refY="4">
      <circle cx="4" cy="4" r="4" stroke="none" fill="red" />
    </marker>
  </defs>
  <polyline
    fill="none"
    stroke="black"
    points="20,100 40,60 70,80 100,20"
    marker-mid="url(#circle)" />
</svg>
```

{{EmbedLiveSample("Example", "200", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>none</code> | <code>&#x3C;marker-ref></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>none</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>discrete</td>
    </tr>
  </tbody>
</table>

- `none`
  - : Cho biết rằng không có biểu tượng đánh dấu nào sẽ được vẽ tại các đỉnh đã cho.
- `<marker-ref>`
  - : Giá trị này là một tham chiếu tới phần tử {{SVGElement("marker")}}, phần tử đó sẽ được vẽ tại các đỉnh đã cho. Nếu tham chiếu không hợp lệ, thì sẽ không có dấu đánh dấu nào được vẽ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("marker")}}
- {{SVGAttr("marker-start")}}
- {{SVGAttr("marker-end")}}
- Thuộc tính CSS {{cssxref('marker-mid')}}
