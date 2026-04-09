---
title: letter-spacing
slug: Web/SVG/Reference/Attribute/letter-spacing
page-type: svg-attribute
browser-compat: svg.global_attributes.letter-spacing
sidebar: svgref
---

Thuộc tính **`letter-spacing`** điều khiển khoảng cách giữa các ký tự văn bản.

Nếu giá trị thuộc tính là một số không kèm đơn vị, như `128`, trình duyệt sẽ xử lý nó như một {{cssxref("length")}} trong hệ tọa độ người dùng hiện tại.

Nếu giá trị thuộc tính có đơn vị, chẳng hạn `.25em` hoặc `1%`, thì trình duyệt sẽ chuyển đổi `<length>` đó thành giá trị tương ứng trong hệ tọa độ người dùng hiện tại.

> [!NOTE]
> Khi được dùng như một thuộc tính trình bày, `letter-spacing` cũng có một thuộc tính CSS tương ứng: {{cssxref("letter-spacing")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ví dụ

### Điều khiển khoảng cách chữ SVG

```html
<svg viewBox="0 0 400 30" xmlns="http://www.w3.org/2000/svg">
  <text y="20" letter-spacing="2">Khoảng cách chữ lớn hơn</text>
  <text x="200" y="20" letter-spacing="-0.5">Khoảng cách chữ nhỏ hơn</text>
</svg>
```

{{EmbedLiveSample}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>normal</code> | {{cssxref("length")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>normal</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

Để biết mô tả về các giá trị, vui lòng tham khảo thuộc tính [CSS `letter-spacing`](/en-US/docs/Web/CSS/Reference/Properties/letter-spacing#values).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("letter-spacing")}}
