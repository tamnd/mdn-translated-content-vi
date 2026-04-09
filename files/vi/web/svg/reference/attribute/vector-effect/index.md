---
title: vector-effect
slug: Web/SVG/Reference/Attribute/vector-effect
page-type: svg-attribute
browser-compat: svg.global_attributes.vector-effect
sidebar: svgref
---

Thuộc tính **`vector-effect`** chỉ định hiệu ứng vector sẽ dùng khi vẽ một đối tượng. Các hiệu ứng vector được áp dụng trước bất kỳ thao tác kết hợp nào khác, tức là bộ lọc, mask và clip.

> [!NOTE]
> Là một thuộc tính trình bày, `vector-effect` cũng có một thuộc tính CSS tương ứng: {{cssxref("vector-effect")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

## Phần tử

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("circle")}}
- {{SVGElement("ellipse")}}
- {{SVGElement("foreignObject")}}
- {{SVGElement("image")}}
- {{SVGElement("line")}}
- {{SVGElement("path")}}
- {{SVGElement("polygon")}}
- {{SVGElement("polyline")}}
- {{SVGElement("rect")}}
- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}
- {{SVGElement("use")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>none</code> | <code>non-scaling-stroke</code> |
        <code>non-scaling-size</code> | <code>non-rotation</code> |
        <code>fixed-position</code>
      </td>
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
  - : Giá trị này cho biết không có hiệu ứng vector nào sẽ được áp dụng, tức là hành vi hiển thị mặc định được dùng, trong đó hình học của một shape trước tiên được tô bằng một paint đã chỉ định, sau đó đường viền được tô bằng một paint đã chỉ định.
- `non-scaling-stroke`
  - : Giá trị này sửa đổi cách một đối tượng được stroke. Thông thường, việc stroke liên quan đến tính toán đường bao stroke của path của shape trong hệ tọa độ người dùng hiện tại và tô đường bao đó bằng stroke paint (màu hoặc gradient). Hiệu ứng trực quan của giá trị này là độ rộng stroke không phụ thuộc vào các phép biến đổi của phần tử (bao gồm cả co giãn không đồng đều và biến đổi shear) và mức zoom.

> [!NOTE]
> Đặc tả định nghĩa ba giá trị khác, `non-scaling-size`, `non-rotation` và `fixed-position`, nhưng chúng không có triển khai và được xem là có rủi ro.

## Ví dụ

### Đặt `vector-effect` thành `non-scaling-stroke`

```html
<svg viewBox="0 0 500 240">
  <!-- normal -->
  <path
    d="M10,20 L40,100 L39,200 z"
    stroke="black"
    stroke-width="2px"
    fill="none"></path>

  <!-- scaled -->
  <path
    transform="translate(100,0) scale(4,1)"
    d="M10,20 L40,100 L39,200 z"
    stroke="black"
    stroke-width="2px"
    fill="none"></path>

  <!-- fixed-->
  <path
    vector-effect="non-scaling-stroke"
    transform="translate(300, 0) scale(4, 1)"
    d="M10,20 L40,100 L39,200 z"
    stroke="black"
    stroke-width="2px"
    fill="none"></path>
</svg>
```

#### Kết quả

{{EmbedLiveSample("Setting vector-effect as non-scaling-stroke", 550, 330)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("vector-effect")}}
