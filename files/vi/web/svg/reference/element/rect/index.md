---
title: <rect>
slug: Web/SVG/Reference/Element/rect
page-type: svg-element
browser-compat: svg.elements.rect
sidebar: svgref
---

**`<rect>`** [SVG](/en-US/docs/Web/SVG) là một [hình dạng SVG cơ bản](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes) dùng để vẽ hình chữ nhật, được xác định bởi vị trí, chiều rộng và chiều cao. Các hình chữ nhật có thể được bo tròn các góc.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("x")}}
  - : Tọa độ x của hình chữ nhật.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("y")}}
  - : Tọa độ y của hình chữ nhật.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("width")}}
  - : Chiều rộng của hình chữ nhật.
    _Kiểu giá trị_: `auto` | [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("height")}}
  - : Chiều cao của hình chữ nhật.
    _Kiểu giá trị_: `auto` | [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("rx")}}
  - : Bán kính góc theo phương ngang của hình chữ nhật. Mặc định là `ry` nếu thuộc tính đó được chỉ định.
    _Kiểu giá trị_: `auto` | [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("ry")}}
  - : Bán kính góc theo phương dọc của hình chữ nhật. Mặc định là `rx` nếu thuộc tính đó được chỉ định.
    _Kiểu giá trị_: `auto` | [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("pathLength")}}
  - : Tổng chiều dài chu vi của hình chữ nhật, tính theo đơn vị người dùng.
    _Kiểu giá trị_: [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**

> [!NOTE]
> Từ SVG2, `x`, `y`, `width`, `height`, `rx` và `ry` là _Geometry Properties_, nghĩa là các thuộc tính này cũng có thể được dùng như thuộc tính CSS cho phần tử đó.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGRectElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 220 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Regular rectangle -->
  <rect width="100" height="100" />

  <!-- Rounded corner rectangle -->
  <rect x="120" width="100" height="100" rx="15" />
</svg>
```

{{EmbedLiveSample('Example', 100, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính trình bày SVG](/en-US/docs/Web/SVG/Reference/Attribute#presentation_attributes) bao gồm {{SVGAttr("fill")}} và {{SVGAttr("stroke")}}
- Các hình dạng SVG cơ bản khác: {{SVGElement('circle')}}, {{ SVGElement('ellipse') }}, {{ SVGElement('line') }}, **{{ SVGElement('polygon') }}**, {{ SVGElement('polyline') }}
