---
title: <text>
slug: Web/SVG/Reference/Element/text
page-type: svg-element
browser-compat: svg.elements.text
sidebar: svgref
---

**`<text>`** [SVG](/en-US/docs/Web/SVG) vẽ một phần tử đồ họa gồm văn bản. Có thể áp dụng gradient, pattern, clipping path, mask hoặc filter cho `<text>`, giống như với bất kỳ phần tử đồ họa SVG nào khác.

Nếu văn bản được chèn vào SVG mà không nằm trong phần tử `<text>`, nó sẽ không được hiển thị. Điều này khác với việc bị ẩn mặc định, vì đặt thuộc tính {{SVGAttr('display')}} cũng sẽ không làm văn bản xuất hiện.

> [!NOTE]
> Phần tử `<text>` không tự động ngắt dòng. Để làm được điều đó, nó cần được định kiểu bằng thuộc tính CSS {{CSSXRef("white-space")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("x")}}
  - : Tọa độ x của điểm bắt đầu baseline của văn bản, hoặc tọa độ x của từng glyph riêng lẻ nếu cung cấp một danh sách giá trị.
    _Kiểu giá trị_: Danh sách ([**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage)); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("y")}}
  - : Tọa độ y của điểm bắt đầu baseline của văn bản, hoặc tọa độ y của từng glyph riêng lẻ nếu cung cấp một danh sách giá trị.
    _Kiểu giá trị_: Danh sách ([**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage)); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("dx")}}
  - : Dịch chuyển vị trí văn bản theo chiều ngang so với phần tử văn bản trước đó, hoặc dịch chuyển vị trí của từng glyph riêng lẻ nếu cung cấp một danh sách giá trị.
    _Kiểu giá trị_: Danh sách ([**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage)); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("dy")}}
  - : Dịch chuyển vị trí văn bản theo chiều dọc so với phần tử văn bản trước đó, hoặc dịch chuyển vị trí của từng glyph riêng lẻ nếu cung cấp một danh sách giá trị.
    _Kiểu giá trị_: Danh sách ([**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage)); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("rotate")}}
  - : Xoay hướng của từng glyph riêng lẻ. Có thể xoay các glyph riêng biệt.
    _Kiểu giá trị_: [**\<list-of-number>**](/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts); _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("lengthAdjust")}}
  - : Văn bản được kéo giãn hoặc nén như thế nào để phù hợp với chiều rộng được xác định bởi thuộc tính `textLength`.
    _Kiểu giá trị_: `spacing` | `spacingAndGlyphs`; _Giá trị mặc định_: `spacing`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("textLength")}}
  - : Chiều rộng mà văn bản nên được co giãn để vừa khít.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGTextElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 240 80" xmlns="http://www.w3.org/2000/svg">
  <style>
    .small {
      font: italic 13px sans-serif;
    }
    .heavy {
      font: bold 30px sans-serif;
    }

    /* Note that the color of the text is set with the    *
     * fill property, the color property is for HTML only */
    .Rrrrr {
      font: italic 40px serif;
      fill: red;
    }
  </style>

  <text x="20" y="35" class="small">My</text>
  <text x="40" y="35" class="heavy">cat</text>
  <text x="55" y="55" class="small">is</text>
  <text x="65" y="55" class="Rrrrr">Grumpy!</text>
</svg>
```

{{EmbedLiveSample('Example', 100, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSXRef("white-space", "", "#multiple_lines_in_svg_text_element")}}
- {{SVGElement("tspan")}}
