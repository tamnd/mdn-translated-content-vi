---
title: <stop>
slug: Web/SVG/Reference/Element/stop
page-type: svg-element
browser-compat: svg.elements.stop
sidebar: svgref
---

**`<stop>`** [SVG](/en-US/docs/Web/SVG) định nghĩa một màu và vị trí của nó để dùng trên một gradient. Phần tử này luôn là phần tử con của {{SVGElement("linearGradient")}} hoặc {{SVGElement("radialGradient")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("offset")}}
  - : Thuộc tính này xác định điểm dừng gradient được đặt ở đâu dọc theo vectơ gradient.
    _Kiểu giá trị_: [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("stop-color")}}
  - : Thuộc tính này xác định màu của điểm dừng gradient. Nó có thể được dùng như một thuộc tính CSS.
    _Kiểu giá trị_: [**\<color>**](/en-US/docs/Web/SVG/Guides/Content_type#color); _Giá trị mặc định_: `black`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("stop-opacity")}}
  - : Thuộc tính này xác định độ mờ của điểm dừng gradient. Nó có thể được dùng như một thuộc tính CSS.
    _Kiểu giá trị_: [**\<opacity-value>**](/en-US/docs/Web/SVG/Guides/Content_type#opacity_value); _Giá trị mặc định_: `1`; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGStopElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg
  viewBox="0 0 10 10"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <linearGradient id="myGradient" gradientTransform="rotate(90)">
      <stop offset="5%" stop-color="gold" />
      <stop offset="95%" stop-color="red" />
    </linearGradient>
  </defs>

  <!-- using my linear gradient -->
  <circle cx="5" cy="5" r="4" fill="url('#myGradient')" />
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
