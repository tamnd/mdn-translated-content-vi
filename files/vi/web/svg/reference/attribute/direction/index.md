---
title: direction
slug: Web/SVG/Reference/Attribute/direction
page-type: svg-attribute
browser-compat: svg.global_attributes.direction
sidebar: svgref
---

Thuộc tính **`direction`** chỉ định hướng base nội tuyến của phần tử {{SVGElement("text")}} hoặc {{SVGElement("tspan")}}. Nó xác định điểm bắt đầu và kết thúc của một dòng văn bản như được dùng bởi các thuộc tính {{SVGAttr("text-anchor")}} và {{cssxref("inline-size")}}. Nó cũng có thể ảnh hưởng đến hướng mà các ký tự được đặt nếu giá trị của thuộc tính {{SVGAttr("unicode-bidi")}} là `embed` hoặc `bidi-override`.

Thuộc tính này chỉ áp dụng cho các glyph được định hướng vuông góc với hướng base nội tuyến, bao gồm trường hợp thông thường của văn bản Latin hoặc Arabic được định hướng ngang và trường hợp các ký tự Latin hoặc Arabic ô hẹp được xoay 90 độ theo chiều kim đồng hồ so với hướng base nội tuyến từ trên xuống dưới.

Trong nhiều trường hợp, thuật toán Unicode hai chiều sẽ tự động tạo ra kết quả mong muốn, vì vậy thuộc tính này không cần được chỉ định trong những trường hợp đó. Với các trường hợp khác, chẳng hạn khi dùng ngôn ngữ từ phải sang trái, có thể chỉ cần thêm thuộc tính `direction` vào phần tử {{SVGElement("svg")}} ngoài cùng, và cho phép hướng đó kế thừa tới tất cả các phần tử văn bản:

> [!NOTE]
> Là một thuộc tính trình bày, `direction` cũng có một thuộc tính CSS tương ứng: {{cssxref("direction")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("textPath")}}
- {{SVGElement("text")}}
- {{SVGElement("tspan")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg
  viewBox="0 0 600 72"
  xmlns="http://www.w3.org/2000/svg"
  direction="rtl"
  lang="fa">
  <text x="300" y="50" text-anchor="middle" font-size="36">
    داستان SVG 1.1 SE طولا ني است.
  </text>
</svg>
```

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>ltr</code> | <code>rtl</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>ltr</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("direction")}}
