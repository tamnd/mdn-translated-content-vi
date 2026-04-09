---
title: font-size
slug: Web/SVG/Reference/Attribute/font-size
page-type: svg-attribute
browser-compat: svg.global_attributes.font-size
sidebar: svgref
---

Thuộc tính **`font-size`** đề cập đến kích thước phông chữ từ {{Glossary("baseline/typography", "baseline")}} đến baseline khi nhiều dòng văn bản được đặt sát nhau trong một môi trường bố cục nhiều dòng.

> [!NOTE]
> Với vai trò là một presentation attribute, `font-size` cũng có thuộc tính CSS tương ứng: {{cssxref("font-size")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ví dụ

### Kiểm soát kích thước phông SVG

```html
<svg viewBox="0 0 200 30" xmlns="http://www.w3.org/2000/svg">
  <text y="25" font-size="smaller">nhỏ hơn</text>
  <text x="100" y="25" font-size="2em">2em</text>
</svg>
```

{{EmbedLiveSample}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>&#x3C;absolute-size></code> | <code>&#x3C;relative-size></code> |
        <code>&#x3C;length-percentage></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>medium</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

Để biết mô tả về các giá trị, vui lòng tham khảo thuộc tính [CSS `font-size`](/en-US/docs/Web/CSS/Reference/Properties/font-size#values).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("font-size")}}
