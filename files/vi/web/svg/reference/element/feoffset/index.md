---
title: <feOffset>
slug: Web/SVG/Reference/Element/feOffset
page-type: svg-element
browser-compat: svg.elements.feOffset
sidebar: svgref
---

**`<feOffset>`** primitive bộ lọc [SVG](/en-US/docs/Web/SVG) cho phép dịch chuyển một ảnh đầu vào so với vị trí hiện tại của nó. Toàn bộ ảnh đầu vào được dịch chuyển theo các giá trị được chỉ định trong thuộc tính {{SVGAttr("dx")}} và {{SVGAttr("dy")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("in")}}
- {{SVGAttr("dx")}}
- {{SVGAttr("dy")}}
- [Thuộc tính primitive bộ lọc](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes): {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}}, {{SVGAttr("result")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFEOffsetElement")}}.

## Ví dụ

### SVG

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="offset" width="180" height="180">
      <feOffset in="SourceGraphic" dx="60" dy="60" />
    </filter>
  </defs>

  <rect x="0" y="0" width="100" height="100" stroke="black" fill="green" />
  <rect
    x="0"
    y="0"
    width="100"
    height="100"
    stroke="black"
    fill="green"
    filter="url(#offset)" />
</svg>
```

### Kết quả

{{EmbedLiveSample("Example", 200, 200)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("filter")}}
- {{SVGElement("animate")}}
- {{SVGElement("set")}}
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
- {{SVGElement("feMerge")}}
- {{SVGElement("feMorphology")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feTile")}}
- {{SVGElement("feTurbulence")}}
- [Hướng dẫn SVG: Hiệu ứng bộ lọc](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
