---
title: marker-end
slug: Web/SVG/Reference/Attribute/marker-end
page-type: svg-attribute
browser-compat: svg.global_attributes.marker-end
sidebar: svgref
---

Thuộc tính **`marker-end`** xác định mũi tên hoặc dấu đánh dấu nhiều điểm sẽ được vẽ tại đỉnh cuối cùng của [hình dạng](/en-US/docs/Web/SVG/Reference/Element#shape_elements) đã cho.

Đối với mọi phần tử hình dạng, ngoại trừ {{SVGElement("polyline")}} và {{SVGElement("path")}}, đỉnh cuối cùng giống với đỉnh đầu tiên. Trong trường hợp này, nếu cả giá trị của {{SVGAttr("marker-start")}} và `marker-end` đều không phải là `none`, thì hai dấu đánh dấu sẽ được vẽ tại đỉnh cuối cùng đó. Với các phần tử `<path>`, đối với mỗi đoạn con khép kín, đỉnh cuối cùng giống với đỉnh đầu tiên. `marker-end` chỉ được vẽ tại đỉnh cuối cùng của [dữ liệu đường dẫn](/en-US/docs/Web/SVG/Reference/Attribute/d#path_commands).

> [!NOTE]
> Là một thuộc tính trình bày, `marker-end` cũng có một thuộc tính CSS tương ứng: {{cssxref("marker-end")}}. Khi cả hai cùng được chỉ định, thuộc tính CSS sẽ được ưu tiên.

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
    <marker
      id="triangle"
      viewBox="0 0 10 10"
      refX="1"
      refY="5"
      markerUnits="strokeWidth"
      markerWidth="10"
      markerHeight="10"
      orient="auto">
      <path d="M 0 0 L 10 5 L 0 10 z" fill="red" />
    </marker>
  </defs>
  <polyline
    fill="none"
    stroke="black"
    points="20,100 40,60 70,80 100,20"
    marker-end="url(#triangle)" />
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
  - : Cho biết rằng không có biểu tượng đánh dấu nào sẽ được vẽ tại đỉnh cuối cùng.
- `<marker-ref>`
  - : Giá trị này là một tham chiếu tới phần tử {{SVGElement("marker")}}, phần tử đó sẽ được vẽ tại đỉnh cuối cùng. Nếu tham chiếu không hợp lệ, thì sẽ không có dấu đánh dấu nào được vẽ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("marker")}}
- {{SVGAttr("marker-start")}}
- {{SVGAttr("marker-mid")}}
- Thuộc tính CSS {{cssxref('marker-end')}}
