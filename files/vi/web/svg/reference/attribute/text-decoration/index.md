---
title: text-decoration
slug: Web/SVG/Reference/Attribute/text-decoration
page-type: svg-attribute
browser-compat: svg.global_attributes.text-decoration
sidebar: svgref
---

Thuộc tính **`text-decoration`** xác định xem văn bản có được trang trí bằng gạch dưới, gạch trên và/hoặc gạch ngang hay không. Đây là một thuộc tính viết tắt cho các thuộc tính {{cssxref("text-decoration-line")}} và {{cssxref("text-decoration-style")}}.

Fill và stroke của phần trang trí văn bản được lấy từ fill và stroke của văn bản tại điểm mà phần trang trí văn bản được khai báo.

Thứ tự vẽ của phần trang trí văn bản, tức fill và stroke, được xác định bởi giá trị của thuộc tính {{SVGAttr("paint-order")}} tại điểm mà phần trang trí văn bản được khai báo.

> [!NOTE]
> Là một thuộc tính trình bày, `text-decoration` cũng có một thuộc tính CSS tương ứng: {{cssxref("text-decoration")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

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
<svg viewBox="0 0 250 50" xmlns="http://www.w3.org/2000/svg">
  <text y="20" text-decoration="underline">Underlined text</text>
  <text x="0" y="40" text-decoration="line-through">Struck-through text</text>
</svg>
```

{{EmbedLiveSample("Example", "250", "100")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/CSS/Reference/Properties/text-decoration-line"
            >&#x3C;'text-decoration-line'></a
          ></code
        >
        ||
        <code
          ><a href="/en-US/docs/Web/CSS/Reference/Properties/text-decoration-style"
            >&#x3C;'text-decoration-style'></a
          ></code
        >
        ||
        <code
          ><a href="/en-US/docs/Web/CSS/Reference/Properties/text-decoration-color"
            >&#x3C;'text-decoration-color'></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>See individual properties</td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

Để biết mô tả các giá trị, vui lòng tham khảo thuộc tính [CSS `text-decoration`](/en-US/docs/Web/CSS/Reference/Properties/text-decoration#values).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("text-decoration")}}
