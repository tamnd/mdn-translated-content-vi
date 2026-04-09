---
title: <textPath>
slug: Web/SVG/Reference/Element/textPath
page-type: svg-element
browser-compat: svg.elements.textPath
sidebar: svgref
---

**`<textPath>`** [SVG](/en-US/docs/Web/SVG) được dùng để hiển thị văn bản dọc theo hình dạng của một phần tử {{SVGElement("path")}}.
Văn bản phải được bao bọc trong phần tử `<textPath>` và thuộc tính {{SVGAttr("href")}} của nó được dùng để tham chiếu đến `<path>` mong muốn.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("href")}}
  - : URL tới đường dẫn hoặc hình dạng cơ bản nơi văn bản sẽ được hiển thị. Nếu thuộc tính `path` được đặt, `href` sẽ không có tác dụng.
    _Kiểu giá trị_: [**\<URL>**](/en-US/docs/Web/SVG/Guides/Content_type#url); _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("lengthAdjust")}}
  - : Điều chỉnh độ dài nên được áp dụng ở đâu cho văn bản: khoảng cách giữa các glyph, hay cả khoảng cách lẫn chính các glyph.
    _Kiểu giá trị_: `spacing` | `spacingAndGlyphs`; _Giá trị mặc định_: `spacing`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("method")}}
  - : Phương thức nào được dùng để hiển thị từng glyph dọc theo đường dẫn.
    _Kiểu giá trị_: `align` | `stretch`; _Giá trị mặc định_: `align`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("path")}} {{Experimental_Inline}}
  - : Đường dẫn mà văn bản sẽ được hiển thị trên đó.
    _Kiểu giá trị_: [**\<path_data>**](/en-US/docs/Web/SVG/Reference/Attribute/path#path-data); _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("side")}} {{Experimental_Inline}}
  - : Phía nào của đường dẫn sẽ hiển thị văn bản.
    _Kiểu giá trị_: `left` | `right`; _Giá trị mặc định_: `left`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("spacing")}}
  - : Cách xử lý khoảng cách giữa các glyph.
    _Kiểu giá trị_: `auto` | `exact`; _Giá trị mặc định_: `exact`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("startOffset")}}
  - : Phần đầu của văn bản sẽ được lệch bao xa so với đầu của đường dẫn.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage) | [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("textLength")}}
  - : Chiều rộng của không gian mà văn bản sẽ được hiển thị trong đó.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage) | [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number); _Giá trị mặc định_: _auto_; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGTextPathElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- to hide the path, it is usually wrapped in a <defs> element -->
  <!-- <defs> -->
  <path
    id="MyPath"
    fill="none"
    stroke="red"
    d="M10,90 Q90,90 90,45 Q90,10 50,10 Q10,10 10,40 Q10,70 45,70 Q70,70 75,50" />
  <!-- </defs> -->

  <text>
    <textPath href="#MyPath">Quick brown fox jumps over the lazy dog.</textPath>
  </text>
</svg>
```

{{EmbedLiveSample('Example', 200, 200)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
