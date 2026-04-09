---
title: <mask>
slug: Web/SVG/Reference/Element/mask
page-type: svg-element
browser-compat: svg.elements.mask
sidebar: svgref
---

Phần tử **`<mask>`** của [SVG](/en-US/docs/Web/SVG) định nghĩa một mặt nạ để ghép đối tượng hiện tại vào nền. Một mask được dùng/tham chiếu bằng thuộc tính {{SVGAttr("mask")}} và thuộc tính CSS {{cssxref("mask-image")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("height")}}
  - : Thuộc tính này định nghĩa chiều cao của vùng masking.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `120%`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("mask-type")}}
  - : Thuộc tính này định nghĩa chế độ mask cho nội dung của `<mask>`.
    _Kiểu giá trị_: `alpha` | `luminance`; _Giá trị mặc định_: `luminance`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("maskContentUnits")}}
  - : Thuộc tính này định nghĩa hệ tọa độ cho nội dung của `<mask>`.
    _Kiểu giá trị_: `userSpaceOnUse` | `objectBoundingBox`; _Giá trị mặc định_: `userSpaceOnUse`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("maskUnits")}}
  - : Thuộc tính này định nghĩa hệ tọa độ cho các thuộc tính {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}} và {{SVGAttr("height")}} trên `<mask>`.
    _Kiểu giá trị_: `userSpaceOnUse` | `objectBoundingBox`; _Giá trị mặc định_: `objectBoundingBox`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("x")}}
  - : Thuộc tính này định nghĩa tọa độ x của góc trên bên trái của vùng masking.
    _Kiểu giá trị_: [**\<coordinate>**](/en-US/docs/Web/SVG/Guides/Content_type#coordinate); _Giá trị mặc định_: `-10%`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("y")}}
  - : Thuộc tính này định nghĩa tọa độ y của góc trên bên trái của vùng masking.
    _Kiểu giá trị_: [**\<coordinate>**](/en-US/docs/Web/SVG/Guides/Content_type#coordinate); _Giá trị mặc định_: `-10%`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("width")}}
  - : Thuộc tính này định nghĩa chiều rộng của vùng masking.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `120%`; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGMaskElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="-10 -10 120 120">
  <rect x="-10" y="-10" width="120" height="120" fill="blue" />
  <mask id="myMask" mask-type="luminance">
    <!-- Mọi thứ nằm dưới một pixel trắng sẽ hiển thị -->
    <rect x="0" y="0" width="100" height="100" fill="white" />

    <!-- Mọi thứ nằm dưới một pixel đen sẽ vô hình -->
    <path
      d="M10,35 A20,20,0,0,1,50,35 A20,20,0,0,1,90,35 Q90,65,50,95 Q10,65,10,35 Z"
      fill="black" />
  </mask>

  <polygon points="-10,110 110,110 110,-10" fill="orange" />

  <!-- với mask này được áp dụng, chúng ta "đục" một lỗ hình trái tim vào hình tròn -->
  <circle cx="50" cy="50" r="50" fill="purple" mask="url(#myMask)" />
</svg>
```

{{EmbedLiveSample('Example', 100, 100)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("mask-type")}}
- Các phần tử SVG khác dùng cho clipping và masking: {{SVGElement("clipPath")}}
- Các thuộc tính CSS cho clipping và masking: {{cssxref("mask")}}, {{cssxref("mask-image")}}, {{cssxref("mask-mode")}}, {{cssxref("mask-repeat")}}, {{cssxref("mask-position")}}, {{cssxref("mask-clip")}}, {{cssxref("mask-origin")}}, {{cssxref("mask-composite")}}, {{cssxref("mask-size")}}
