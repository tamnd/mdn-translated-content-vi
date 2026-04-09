---
title: <foreignObject>
slug: Web/SVG/Reference/Element/foreignObject
page-type: svg-element
browser-compat: svg.elements.foreignObject
sidebar: svgref
---

Phần tử [SVG](/en-US/docs/Web/SVG) **`<foreignObject>`** bao gồm các phần tử từ một không gian tên XML khác. Trong ngữ cảnh của trình duyệt, đó nhiều khả năng là (X)HTML.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("height")}}
  - : Chiều cao của foreignObject.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("width")}}
  - : Chiều rộng của foreignObject.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("x")}}
  - : Tọa độ x của foreignObject.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("y")}}
  - : Tọa độ y của foreignObject.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**

> [!NOTE]
> Bắt đầu từ SVG2, `x`, `y`, `width` và `height` là _Geometry Properties_ (thuộc tính hình học), nghĩa là các thuộc tính đó cũng có thể được dùng như thuộc tính CSS cho phần tử này.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGForeignObjectElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <style>
    div {
      color: white;
      font: 18px serif;
      height: 100%;
      overflow: auto;
    }
  </style>

  <polygon points="5,5 195,10 185,185 10,195" />

  <!-- Cách dùng phổ biến: nhúng văn bản HTML vào SVG -->
  <foreignObject x="20" y="20" width="160" height="160">
    <!--
      Trong ngữ cảnh SVG được nhúng trong tài liệu HTML, không gian tên XHTML
      có thể được bỏ qua, nhưng nó là bắt buộc trong ngữ cảnh của
      một tài liệu SVG
    -->
    <div xmlns="http://www.w3.org/1999/xhtml">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mollis mollis
      mi ut ultricies. Nullam magna ipsum, porta vel dui convallis, rutrum
      imperdiet eros. Aliquam erat volutpat.
    </div>
  </foreignObject>
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
