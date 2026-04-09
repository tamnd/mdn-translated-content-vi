---
title: <symbol>
slug: Web/SVG/Reference/Element/symbol
page-type: svg-element
browser-compat: svg.elements.symbol
sidebar: svgref
---

**`<symbol>`** [SVG](/en-US/docs/Web/SVG) được dùng để định nghĩa các đối tượng mẫu đồ họa có thể được khởi tạo bởi phần tử {{SVGElement("use")}}.

Việc dùng phần tử `<symbol>` cho các đồ họa được sử dụng nhiều lần trong cùng một tài liệu giúp tăng cấu trúc và ngữ nghĩa. Những tài liệu có cấu trúc phong phú có thể được hiển thị dưới dạng đồ họa, lời nói hoặc Braille, từ đó tăng khả năng tiếp cận.

> [!NOTE]
> Bản thân phần tử `<symbol>` không được dùng để hiển thị. Chỉ các thể hiện của phần tử `<symbol>` (tức là một tham chiếu tới `<symbol>` bằng phần tử {{SVGElement("use")}}) mới được hiển thị. Điều đó có nghĩa là một số trình duyệt có thể từ chối hiển thị trực tiếp phần tử `<symbol>` ngay cả khi thuộc tính CSS {{cssxref('display')}} nói ngược lại.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("height")}}
  - : Thuộc tính này xác định chiều cao của symbol.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("preserveAspectRatio")}}
  - : Thuộc tính này định nghĩa cách fragment svg phải bị biến dạng nếu nó được nhúng trong một khối chứa có {{glossary("aspect ratio")}} khác.
    _Kiểu giá trị_: (`none` | `xMinYMin` | `xMidYMin` | `xMaxYMin` | `xMinYMid` | `xMidYMid` | `xMaxYMid` | `xMinYMax` | `xMidYMax` | `xMaxYMax`) (`meet` | `slice`)?; _Giá trị mặc định_: `xMidYMid meet`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("refX")}}
  - : Thuộc tính này xác định tọa độ x của điểm tham chiếu của symbol.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage) | `left` | `center` | `right`; _Giá trị mặc định_: Không có; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("refY")}}
  - : Thuộc tính này xác định tọa độ y của điểm tham chiếu của symbol.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage) | `top` | `center` | `bottom`; _Giá trị mặc định_: Không có; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("viewBox")}}
  - : Thuộc tính này định nghĩa ranh giới của viewport SVG cho symbol hiện tại.
    _Kiểu giá trị_: **[\<list-of-numbers>](/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts)**; _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("width")}}
  - : Thuộc tính này xác định chiều rộng của symbol.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("x")}}
  - : Thuộc tính này xác định tọa độ x của symbol.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("y")}}
  - : Thuộc tính này xác định tọa độ y của symbol.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGSymbolElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 80 20" xmlns="http://www.w3.org/2000/svg">
  <!-- Our symbol in its own coordinate system -->
  <symbol id="myDot" width="10" height="10" viewBox="0 0 2 2">
    <circle cx="1" cy="1" r="1" />
  </symbol>

  <!-- A grid to materialize our symbol positioning -->
  <path
    d="M0,10 h80 M10,0 v20 M25,0 v20 M40,0 v20 M55,0 v20 M70,0 v20"
    fill="none"
    stroke="pink" />

  <!-- All instances of our symbol -->
  <use href="#myDot" x="5" y="5" opacity="1.0" />
  <use href="#myDot" x="20" y="5" opacity="0.8" />
  <use href="#myDot" x="35" y="5" opacity="0.6" />
  <use href="#myDot" x="50" y="5" opacity="0.4" />
  <use href="#myDot" x="65" y="5" opacity="0.2" />
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
