---
title: <ellipse>
slug: Web/SVG/Reference/Element/ellipse
page-type: svg-element
browser-compat: svg.elements.ellipse
sidebar: svgref
---

Phần tử **`<ellipse>`** của [SVG](/en-US/docs/Web/SVG) là một hình cơ bản SVG, được dùng để tạo các hình elip dựa trên một tọa độ tâm và cả bán kính theo trục x lẫn trục y.

> [!NOTE]
> Các hình elip không thể chỉ định chính xác hướng quay của hình elip (ví dụ, nếu bạn muốn vẽ một hình elip nghiêng 45 độ), nhưng có thể xoay nó bằng thuộc tính {{SVGAttr("transform")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("cx")}}
  - : Vị trí theo trục x của tâm hình elip.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("cy")}}
  - : Vị trí theo trục y của tâm hình elip.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("rx")}}
  - : Bán kính của hình elip theo trục x.
    _Kiểu giá trị_: `auto` | [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("ry")}}
  - : Bán kính của hình elip theo trục y.
    _Kiểu giá trị_: `auto` | [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("pathLength")}}
  - : Thuộc tính này cho phép chỉ định tổng chiều dài của đường dẫn, tính theo đơn vị người dùng.
    _Kiểu giá trị_: [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**

> [!NOTE]
> Bắt đầu từ SVG2, `cx`, `cy`, `rx` và `ry` là _Geometry Properties_, nghĩa là các thuộc tính đó cũng có thể được dùng như các thuộc tính CSS cho phần tử đó.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <ellipse cx="100" cy="50" rx="100" ry="50" />
</svg>
```

{{EmbedLiveSample('Example', 100, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các hình cơ bản SVG khác: **{{ SVGElement('circle') }}**, {{ SVGElement('line') }}, {{ SVGElement('polygon') }}, {{ SVGElement('polyline') }}, {{ SVGElement('rect') }}
