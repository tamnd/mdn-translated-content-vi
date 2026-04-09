---
title: font-family
slug: Web/SVG/Reference/Attribute/font-family
page-type: svg-attribute
browser-compat: svg.global_attributes.font-family
sidebar: svgref
---

Thuộc tính **`font-family`** chỉ ra họ phông chữ nào sẽ được dùng để hiển thị văn bản, được xác định dưới dạng một danh sách ưu tiên gồm các tên họ phông chữ và/hoặc tên họ chung.

> [!NOTE]
> Với vai trò là một presentation attribute, `font-family` cũng có thuộc tính CSS tương ứng: {{cssxref("font-family")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ví dụ

### Kiểm soát họ phông SVG

```html
<svg viewBox="0 0 200 30" xmlns="http://www.w3.org/2000/svg">
  <text y="20" font-family="Arial, Helvetica, sans-serif">Sans serif</text>
  <text x="100" y="20" font-family="monospace">Monospace</text>
</svg>
```

{{EmbedLiveSample}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>Xem {{cssxref("font-family", "", "#formal_syntax")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>Tùy vào user agent</td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

Để biết mô tả về các giá trị, vui lòng tham khảo thuộc tính [CSS `font-family`](/en-US/docs/Web/CSS/Reference/Properties/font-family#values).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("font-family")}}
