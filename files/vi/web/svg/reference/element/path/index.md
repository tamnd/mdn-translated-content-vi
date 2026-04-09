---
title: <path>
slug: Web/SVG/Reference/Element/path
page-type: svg-element
browser-compat: svg.elements.path
sidebar: svgref
---

Phần tử **`<path>`** của [SVG](/en-US/docs/Web/SVG) là phần tử tổng quát để định nghĩa một hình dạng. Tất cả các hình cơ bản đều có thể được tạo bằng một phần tử path.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("d")}}
  - : Thuộc tính này định nghĩa hình dạng của path.
    _Kiểu giá trị_: **\<string>**; _Giá trị mặc định_: `''`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("pathLength")}}
  - : Thuộc tính này cho phép tác giả chỉ định tổng chiều dài của path, tính theo đơn vị người dùng.
    _Kiểu giá trị_: [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGPathElement")}}.

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
  <path
    d="M 10,30
           A 20,20 0,0,1 50,30
           A 20,20 0,0,1 90,30
           Q 90,60 50,90
           Q 10,60 10,30 z" />
</svg>
```

{{EmbedLiveSample('Example', 100, 100)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các hình cơ bản SVG: {{ SVGElement('circle') }}, {{ SVGElement('ellipse') }}, {{ SVGElement('line') }}, {{ SVGElement('polygon') }}, {{ SVGElement('polyline') }}, {{ SVGElement('rect') }}
- [Hướng dẫn MDN SVG "Getting Started": Path](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths)
