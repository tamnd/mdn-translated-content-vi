---
title: <style>
slug: Web/SVG/Reference/Element/style
page-type: svg-element
browser-compat: svg.elements.style
sidebar: svgref
---

**`<style>`** [SVG](/en-US/docs/Web/SVG) cho phép nhúng stylesheet trực tiếp vào trong nội dung SVG.

> [!NOTE]
> Phần tử `style` của SVG có cùng các thuộc tính như phần tử tương ứng trong HTML (xem phần tử {{HTMLElement("style")}} của HTML).

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("type")}}
  - : Thuộc tính này định nghĩa kiểu ngôn ngữ stylesheet sẽ dùng dưới dạng một chuỗi kiểu media.
    _Kiểu giá trị_: [**`<media-type>`**](/en-US/docs/Glossary/MIME_type); _Giá trị mặc định_: `text/css`; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("media")}}
  - : Thuộc tính này định nghĩa stylesheet áp dụng cho {{cssxref('@media', 'media')}} nào.
    _Kiểu giá trị_: [**`<media-query-list>`**](/en-US/docs/Web/CSS/Reference/At-rules/@media#syntax); _Giá trị mặc định_: `all`; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("title")}}
  - : Thuộc tính này là tiêu đề của stylesheet, có thể được dùng để chuyển đổi giữa [alternate style sheets](/en-US/docs/Web/HTML/Reference/Attributes/rel/alternate_stylesheet).
    _Kiểu giá trị_: [**`<string>`**](/en-US/docs/Web/CSS/Reference/Values/string); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGStyleElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 10 10" xmlns="http://www.w3.org/2000/svg">
  <style>
    circle {
      fill: gold;
      stroke: maroon;
      stroke-width: 2px;
    }
  </style>

  <circle cx="5" cy="5" r="4" />
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("style", "&lt;style&gt; element in HTML")}}
