---
title: shape-rendering
slug: Web/SVG/Reference/Attribute/shape-rendering
page-type: svg-attribute
browser-compat: svg.global_attributes.shape-rendering
sidebar: svgref
---

Thuộc tính **`shape-rendering`** cung cấp gợi ý cho bộ kết xuất về những đánh đổi cần thực hiện khi hiển thị các hình dạng như path, circle hoặc rectangle.

> [!NOTE]
> Khi được dùng như một thuộc tính trình bày, `shape-rendering` cũng có một thuộc tính CSS tương ứng: {{cssxref("shape-rendering")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

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
<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg">
  <circle cx="100" cy="100" r="100" shape-rendering="geometricPrecision" />
  <circle cx="320" cy="100" r="100" shape-rendering="crispEdges" />
</svg>
```

{{EmbedLiveSample("Example", "420", "220")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code> | <code>optimizeSpeed</code> |
        <code>crispEdges</code> | <code>geometricPrecision</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>discrete</td>
    </tr>
  </tbody>
</table>

- `auto`
  - : Giá trị này cho biết user agent nên thực hiện các đánh đổi phù hợp để cân bằng giữa tốc độ, cạnh sắc nét và độ chính xác hình học, nhưng ưu tiên độ chính xác hình học hơn tốc độ và cạnh sắc nét.
- `optimizeSpeed`
  - : Giá trị này cho biết user agent nên nhấn mạnh tốc độ kết xuất hơn độ chính xác hình học và cạnh sắc nét. Tùy chọn này đôi khi sẽ khiến user agent tắt khử răng cưa cho hình dạng.
- `crispEdges`
  - : Giá trị này cho biết user agent nên cố gắng nhấn mạnh độ tương phản giữa các cạnh sạch của tác phẩm hơn tốc độ kết xuất và độ chính xác hình học. Để đạt được cạnh sắc nét, user agent có thể tắt khử răng cưa cho tất cả các đường và đường cong hoặc có thể chỉ cho các đường thẳng gần như dọc hoặc ngang. Ngoài ra, user agent có thể điều chỉnh vị trí và độ rộng của đường để căn các cạnh với pixel của thiết bị.
- `geometricPrecision`
  - : Cho biết user agent nên nhấn mạnh độ chính xác hình học hơn tốc độ và cạnh sắc nét.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref('shape-rendering')}}
