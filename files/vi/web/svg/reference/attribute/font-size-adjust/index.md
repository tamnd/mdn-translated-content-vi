---
title: font-size-adjust
slug: Web/SVG/Reference/Attribute/font-size-adjust
page-type: svg-attribute
browser-compat: svg.global_attributes.font-size-adjust
sidebar: svgref
---

Thuộc tính `font-size-adjust` cho phép tác giả chỉ định một giá trị tỷ lệ cho phần tử, giúp duy trì x-height của phông chữ được chọn đầu tiên trong một phông chữ thay thế.

> [!NOTE]
> Với vai trò là một presentation attribute, `font-size-adjust` cũng có thuộc tính CSS tương ứng: {{cssxref("font-size-adjust")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
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
  width="600"
  height="80"
  viewBox="0 0 500 80"
  xmlns="http://www.w3.org/2000/svg">
  <text y="20" font-family="Times, serif" font-size="10px">
    Văn bản này dùng phông Times (10px), rất khó đọc ở kích thước nhỏ.
  </text>
  <text y="40" font-family="Verdana, sans-serif" font-size="10px">
    Văn bản này dùng phông Verdana (10px), có các chữ cái thường tương đối lớn.
  </text>
  <text
    y="60"
    font-family="Times, serif"
    font-size="10px"
    font-size-adjust="0.58">
    Đây là Times 10px, nhưng nay được điều chỉnh theo cùng tỷ lệ với Verdana.
  </text>
</svg>
```

{{EmbedLiveSample("Example", "600", "100")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>none</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>none</code> | {{cssxref("number")}}</td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `none`
  - : Chọn kích thước phông chữ chỉ dựa trên thuộc tính {{ Cssxref("font-size") }}.
- {{cssxref("&lt;number&gt;")}}
  - : Chọn kích thước phông chữ sao cho các chữ cái thường của nó (theo x-height của phông) bằng số lần được chỉ định của {{ Cssxref("font-size") }}.

    Số được chỉ định thường nên là {{glossary("aspect ratio")}} (tỷ lệ giữa x-height và kích thước phông) của họ phông {{ Cssxref("font-family") }} được chọn đầu tiên. Điều này có nghĩa là phông được chọn đầu tiên, khi có sẵn, sẽ hiển thị cùng kích thước trong các trình duyệt, bất kể chúng có hỗ trợ `font-size-adjust` hay không.

    `0` cho ra văn bản có chiều cao bằng không (văn bản ẩn).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("font-size-adjust")}}
