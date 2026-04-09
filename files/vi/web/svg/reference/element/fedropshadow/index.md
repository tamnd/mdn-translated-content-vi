---
title: <feDropShadow>
slug: Web/SVG/Reference/Element/feDropShadow
page-type: svg-element
browser-compat: svg.elements.feDropShadow
sidebar: svgref
---

Phần tử primitive lọc **`<feDropShadow>`** của [SVG](/en-US/docs/Web/SVG) tạo một bóng đổ của ảnh đầu vào. Nó chỉ có thể được dùng bên trong phần tử {{SVGElement('filter')}}.

> [!NOTE]
> Màu và độ mờ của bóng đổ có thể được thay đổi bằng các thuộc tính trình bày {{SVGAttr('flood-color')}} và {{SVGAttr('flood-opacity')}}.

Giống như các primitive lọc khác, nó xử lý các thành phần màu trong {{glossary("color space")}} `linearRGB` theo mặc định. Bạn có thể dùng {{svgattr("color-interpolation-filters")}} để thay bằng `sRGB`.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("dx")}}: Thuộc tính này định nghĩa độ lệch x của bóng đổ.
  _Kiểu giá trị_: [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number); _Giá trị mặc định_: `2`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("dy")}}: Thuộc tính này định nghĩa độ lệch y của bóng đổ.
  _Kiểu giá trị_: [**\<number>**](/en-US/docs/Web/SVG/Guides/Content_type#number); _Giá trị mặc định_: `2`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("in")}}
- {{SVGAttr("stdDeviation")}}: Thuộc tính này định nghĩa độ lệch chuẩn cho thao tác làm mờ trong bóng đổ.
  _Kiểu giá trị_: [**\<number-optional-number>**](/en-US/docs/Web/SVG/Guides/Content_type#number-optional-number); _Giá trị mặc định_: `2`; _Có thể hoạt ảnh_: **có**
- [Thuộc tính primitive lọc](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes): {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}}, {{SVGAttr("result")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFEDropShadowElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 30 10" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="shadow">
      <feDropShadow dx="0.2" dy="0.4" stdDeviation="0.2" />
    </filter>
    <filter id="shadow2">
      <feDropShadow dx="0" dy="0" stdDeviation="0.5" flood-color="cyan" />
    </filter>
    <filter id="shadow3">
      <feDropShadow
        dx="-0.8"
        dy="-0.8"
        stdDeviation="0"
        flood-color="pink"
        flood-opacity="0.5" />
    </filter>
  </defs>

  <circle cx="5" cy="50%" r="4" fill="pink" filter="url(#shadow)" />
  <circle cx="15" cy="50%" r="4" fill="pink" filter="url(#shadow2)" />
  <circle cx="25" cy="50%" r="4" fill="pink" filter="url(#shadow3)" />
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính primitive lọc SVG](/en-US/docs/Web/SVG/Reference/Attribute#filters_attributes) bao gồm {{SVGAttr('height')}}, {{SVGAttr('in')}}, {{SVGAttr('result')}}, {{SVGAttr('x')}}, {{SVGAttr('y')}}, và {{SVGAttr('width')}}.
- [Thuộc tính trình bày SVG](/en-US/docs/Web/SVG/Reference/Attribute#presentation_attributes), bao gồm {{SVGAttr('flood-color')}}, và {{SVGAttr('flood-opacity')}}.
