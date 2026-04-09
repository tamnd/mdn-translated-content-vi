---
title: <tspan>
slug: Web/SVG/Reference/Element/tspan
page-type: svg-element
browser-compat: svg.elements.tspan
sidebar: svgref
---

Phần tử [SVG](/en-US/docs/Web/SVG) **`<tspan>`** xác định một đoạn con trong phần tử {{SVGElement('text')}} hoặc trong một phần tử `<tspan>` khác. Nó cho phép điều chỉnh kiểu và/hoặc vị trí của đoạn con đó khi cần.

> [!NOTE]
> Phần tử `<tspan>` không tự ngắt dòng theo mặc định; để làm được điều này, nó cần được tạo kiểu bằng thuộc tính CSS {{CSSXRef("white-space")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("x")}}
  - : Tọa độ x của điểm bắt đầu của đường cơ sở văn bản, hoặc tọa độ x của từng glyph riêng lẻ nếu cung cấp một danh sách giá trị.
    _Kiểu giá trị_: Danh sách ([**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage)); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("y")}}
  - : Tọa độ y của điểm bắt đầu của đường cơ sở văn bản, hoặc tọa độ y của từng glyph riêng lẻ nếu cung cấp một danh sách giá trị.
    _Kiểu giá trị_: Danh sách ([**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage)); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("dx")}}
  - : Dịch chuyển vị trí văn bản theo chiều ngang từ phần tử văn bản trước đó, hoặc dịch chuyển vị trí của từng glyph riêng lẻ nếu cung cấp một danh sách giá trị.
    _Kiểu giá trị_: Danh sách ([**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage)); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("dy")}}
  - : Dịch chuyển vị trí văn bản theo chiều dọc từ phần tử văn bản trước đó, hoặc dịch chuyển vị trí của từng glyph riêng lẻ nếu cung cấp một danh sách giá trị.
    _Kiểu giá trị_: Danh sách ([**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage)); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("rotate")}}
  - : Xoay hướng của từng glyph riêng lẻ. Có thể xoay glyph riêng biệt.
    _Kiểu giá trị_: [**\<list-of-number>**](/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts); _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("lengthAdjust")}}
  - : Cách văn bản được kéo giãn hoặc nén để khớp với chiều rộng được xác định bởi thuộc tính `textLength`.
    _Kiểu giá trị_: `spacing` | `spacingAndGlyphs`; _Giá trị mặc định_: `spacing`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("textLength")}}
  - : Một chiều rộng mà văn bản sẽ được co giãn để vừa khớp.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGTSpanElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 240 40" xmlns="http://www.w3.org/2000/svg">
  <style>
    text {
      font: italic 12px serif;
    }
    tspan {
      font: bold 10px sans-serif;
      fill: red;
    }
  </style>

  <text x="10" y="30" class="small">
    Bạn là
    <tspan>không phải</tspan>
    một quả chuối!
  </text>
</svg>
```

{{EmbedLiveSample('Example', 100, '100%')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSXRef("white-space", "", "#multiple_lines_in_svg_text_element")}}
