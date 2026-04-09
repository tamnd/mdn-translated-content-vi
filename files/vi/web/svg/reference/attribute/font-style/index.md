---
title: font-style
slug: Web/SVG/Reference/Attribute/font-style
page-type: svg-attribute
browser-compat: svg.global_attributes.font-style
sidebar: svgref
---

Thuộc tính **`font-style`** chỉ định văn bản sẽ được hiển thị bằng mặt chữ thường, nghiêng, hay xiên.

> [!NOTE]
> Với vai trò là một presentation attribute, `font-style` cũng có thuộc tính CSS tương ứng: {{cssxref("font-style")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ví dụ

### Kiểm soát kiểu chữ SVG

```html
<svg viewBox="0 0 250 30" xmlns="http://www.w3.org/2000/svg">
  <text y="20" font-style="normal">Kiểu chữ thường</text>
  <text x="150" y="20" font-style="italic">Kiểu chữ nghiêng</text>
</svg>
```

{{EmbedLiveSample}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>normal</code> | <code>italic</code> | <code>oblique</code></td>
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

Để biết mô tả về các giá trị, vui lòng tham khảo thuộc tính [CSS `font-style`](/en-US/docs/Web/CSS/Reference/Properties/font-style#values).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("font-style")}}
