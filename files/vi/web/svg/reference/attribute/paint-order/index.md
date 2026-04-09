---
title: paint-order
slug: Web/SVG/Reference/Attribute/paint-order
page-type: svg-attribute
browser-compat: svg.global_attributes.paint-order
sidebar: svgref
---

Thuộc tính **`paint-order`** chỉ định thứ tự mà fill, stroke, và markers của một hình dạng hoặc phần tử văn bản được vẽ.

> [!NOTE]
> Với vai trò là một presentation attribute, `paint-order` cũng có thuộc tính CSS tương ứng: {{cssxref("paint-order")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("circle")}}
- {{SVGElement("ellipse")}}
- {{SVGElement("line")}}
- {{SVGElement("path")}}
- {{SVGElement("polygon")}}
- {{SVGElement("polyline")}}
- {{SVGElement("rect")}}
- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th>Giá trị</th>
      <td>
        <code>normal</code> | [ <code>fill</code> || <code>stroke</code> ||
        <code>markers</code> ]
      </td>
    </tr>
    <tr>
      <th>Giá trị mặc định</th>
      <td><code>normal</code></td>
    </tr>
    <tr>
      <th>Có thể animate</th>
      <td>discrete</td>
    </tr>
  </tbody>
</table>

- normal
  - : Giá trị này cho biết fill sẽ được vẽ trước, sau đó là stroke, và cuối cùng là markers.
- \[ fill || stroke || markers ]
  - : Thứ tự của ba từ khóa này cho biết thứ tự vẽ, từ trái sang phải. Nếu bất kỳ thành phần vẽ nào trong ba thành phần bị bỏ qua, chúng sẽ được vẽ theo thứ tự mặc định sau các thành phần được chỉ định. Ví dụ, dùng `stroke` tương đương với `stroke fill markers`.

## Ví dụ

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <linearGradient id="g" x1="0" y1="0" x2="0" y2="1">
    <stop stop-color="#888888" />
    <stop stop-color="#cccccc" offset="1" />
  </linearGradient>
  <rect width="400" height="200" fill="url(#g)" />
  <g
    fill="crimson"
    stroke="white"
    stroke-width="6"
    stroke-linejoin="round"
    text-anchor="middle"
    font-family="sans-serif"
    font-size="50px"
    font-weight="bold">
    <text x="200" y="75">stroke over</text>
    <text x="200" y="150" paint-order="stroke" id="stroke-under">
      stroke under
    </text>
  </g>
</svg>
```

Ví dụ sẽ được hiển thị như sau:

![An image showing how the paint-order example looks in a UA that supports the paint-order property.](paint-order-2.png)

Hiệu ứng stroke dưới có thể đạt được bằng thuộc tính CSS sau:

```css
#stroke-under {
  paint-order: stroke;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
