---
title: font-weight
slug: Web/SVG/Reference/Attribute/font-weight
page-type: svg-attribute
browser-compat: svg.global_attributes.font-weight
sidebar: svgref
---

Thuộc tính **`font-weight`** đề cập đến độ đậm hoặc mảnh của các glyph được dùng để hiển thị văn bản, tương đối với các phông khác trong cùng họ phông.

> [!NOTE]
> Với vai trò là một presentation attribute, `font-weight` cũng có thuộc tính CSS tương ứng: {{cssxref("font-weight")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ví dụ

### Kiểm soát độ đậm phông SVG

```html
<svg viewBox="0 0 200 30" xmlns="http://www.w3.org/2000/svg">
  <text y="20" font-weight="normal">Văn bản thường</text>
  <text x="100" y="20" font-weight="bold">Văn bản đậm</text>
</svg>
```

{{EmbedLiveSample}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>normal</code> | <code>bold</code> | <code>bolder</code> |
        <code>lighter</code> | {{cssxref("number")}}
      </td>
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

Để biết mô tả về các giá trị, vui lòng tham khảo thuộc tính [CSS `font-weight`](/en-US/docs/Web/CSS/Reference/Properties/font-weight#values).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("font-weight")}}
