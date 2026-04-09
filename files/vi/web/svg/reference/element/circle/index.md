---
title: <circle>
slug: Web/SVG/Reference/Element/circle
page-type: svg-element
browser-compat: svg.elements.circle
sidebar: svgref
---

Phần tử **`<circle>`** của [SVG](/en-US/docs/Web/SVG) là một [hình cơ bản SVG](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes), dùng để vẽ hình tròn dựa trên một điểm tâm và bán kính.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("cx")}}
  - : Tọa độ trên trục x của tâm hình tròn.
    _Kiểu giá trị_: **[\<length>](/en-US/docs/Web/SVG/Guides/Content_type#length)** | **[\<percentage>](/en-US/docs/Web/SVG/Guides/Content_type#percentage)**; _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("cy")}}
  - : Tọa độ trên trục y của tâm hình tròn.
    _Kiểu giá trị_: **[\<length>](/en-US/docs/Web/SVG/Guides/Content_type#length)** | **[\<percentage>](/en-US/docs/Web/SVG/Guides/Content_type#percentage)**; _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("r")}}
  - : Bán kính của hình tròn. Một giá trị nhỏ hơn hoặc bằng 0 sẽ vô hiệu hóa việc hiển thị hình tròn.
    _Kiểu giá trị_: **[\<length>](/en-US/docs/Web/SVG/Guides/Content_type#length)** | **[\<percentage>](/en-US/docs/Web/SVG/Guides/Content_type#percentage)**; _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("pathLength")}}
  - : Tổng chiều dài chu vi của hình tròn, tính theo đơn vị người dùng.
    _Kiểu giá trị_: [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**

> [!NOTE]
> Bắt đầu từ SVG2, `cx`, `cy`, và `r` là _Geometry Properties_, nghĩa là các thuộc tính đó cũng có thể được dùng như các thuộc tính CSS cho phần tử đó.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGCircleElement")}}.

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
  <circle cx="50" cy="50" r="50" />
</svg>
```

{{EmbedLiveSample('Example', 100, 100)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các hình cơ bản SVG khác: **{{ SVGElement('ellipse') }}**, {{ SVGElement('line') }}, {{ SVGElement('polygon') }}, {{ SVGElement('polyline') }}, {{ SVGElement('rect') }}
