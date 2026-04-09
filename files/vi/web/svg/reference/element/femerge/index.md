---
title: <feMerge>
slug: Web/SVG/Reference/Element/feMerge
page-type: svg-element
browser-compat: svg.elements.feMerge
sidebar: svgref
---

**`<feMerge>`** [SVG](/en-US/docs/Web/SVG) cho phép các hiệu ứng bộ lọc được áp dụng đồng thời thay vì tuần tự. Điều này đạt được bằng cách các bộ lọc khác lưu đầu ra của chúng thông qua thuộc tính {{ SVGAttr("result") }} rồi truy cập nó trong một phần tử con {{ SVGElement("feMergeNode") }}.

Giống như các primitive bộ lọc khác, nó xử lý các thành phần màu trong {{glossary("color space")}} `linearRGB` theo mặc định. Bạn có thể dùng {{svgattr("color-interpolation-filters")}} để dùng `sRGB` thay thế.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- [Thuộc tính primitive bộ lọc](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes): {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}}, {{SVGAttr("result")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFEMergeElement")}}.

## Ví dụ

### SVG

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <filter id="feOffset" x="-40" y="-20" width="100" height="200">
    <feOffset in="SourceGraphic" dx="60" dy="60" />
    <feGaussianBlur stdDeviation="5" result="blur2" />
    <feMerge>
      <feMergeNode in="blur2" />
      <feMergeNode in="SourceGraphic" />
    </feMerge>
  </filter>

  <rect
    x="40"
    y="40"
    width="100"
    height="100"
    stroke="black"
    fill="green"
    filter="url(#feOffset)" />
</svg>
```

### Kết quả

{{EmbedLiveSample('Example', 200, 200)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [SVG Filter primitive attributes](/en-US/docs/Web/SVG/Reference/Attribute#filters_attributes)
- thuộc tính {{SVGAttr("flood-color")}}
- thuộc tính {{SVGAttr("flood-opacity")}}
- {{SVGElement("filter")}}
- {{SVGElement("feBlend")}}
- {{SVGElement("feColorMatrix")}}
- {{SVGElement("feComponentTransfer")}}
- {{SVGElement("feComposite")}}
- {{SVGElement("feConvolveMatrix")}}
- {{SVGElement("feDiffuseLighting")}}
- {{SVGElement("feDisplacementMap")}}
- {{SVGElement("feFlood")}}
- {{SVGElement("feGaussianBlur")}}
- {{SVGElement("feImage")}}
- {{SVGElement("feMergeNode")}}
- {{SVGElement("feMorphology")}}
- {{SVGElement("feOffset")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feTile")}}
- {{SVGElement("feTurbulence")}}
- [Hướng dẫn SVG: Hiệu ứng bộ lọc](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
