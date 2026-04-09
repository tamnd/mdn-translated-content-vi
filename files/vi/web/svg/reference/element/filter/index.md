---
title: <filter>
slug: Web/SVG/Reference/Element/filter
page-type: svg-element
browser-compat: svg.elements.filter
sidebar: svgref
---

Phần tử [SVG](/en-US/docs/Web/SVG) **`<filter>`** xác định một hiệu ứng bộ lọc tùy chỉnh bằng cách nhóm các primitive bộ lọc nguyên tử. Bản thân nó không bao giờ được hiển thị, nhưng phải được dùng bởi thuộc tính {{SVGAttr("filter")}} trên các phần tử SVG, hoặc thuộc tính {{cssxref("filter")}} {{Glossary("CSS")}} cho các phần tử SVG/HTML.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("x")}}
- {{SVGAttr("y")}}
- {{SVGAttr("width")}}
- {{SVGAttr("height")}}
- {{SVGAttr("filterUnits")}}
- {{SVGAttr("primitiveUnits")}}
- {{SVGAttr("xlink:href")}} {{deprecated_inline}}

> [!NOTE]
> Với `<filter>`, các thuộc tính `x` và `y` mặc định là `-10%`, còn các thuộc tính `width` và `height` mặc định là `120%`. Điều này là do nhiều hiệu ứng bộ lọc, chẳng hạn như {{svgelement("feGaussianBlur")}}, mở rộng ra ngoài ranh giới của phần tử đang được lọc. Kích thước mặc định đảm bảo hiệu ứng bộ lọc không bị cắt xén.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFilterElement")}}.

## Ví dụ

### Thêm hiệu ứng làm mờ

#### SVG

```html
<svg width="230" height="120" xmlns="http://www.w3.org/2000/svg">
  <filter id="blurMe">
    <feGaussianBlur stdDeviation="5" />
  </filter>

  <circle cx="60" cy="60" r="50" fill="green" />

  <circle cx="170" cy="60" r="50" fill="green" filter="url(#blurMe)" />
</svg>
```

#### Kết quả

{{EmbedLiveSample("Example",235,150)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("feBlend")}}
- {{SVGElement("feColorMatrix")}}
- {{SVGElement("feComponentTransfer")}}
- {{SVGElement("feComposite")}}
- {{SVGElement("feConvolveMatrix")}}
- {{SVGElement("feDiffuseLighting")}}
- {{SVGElement("feDisplacementMap")}}
- {{SVGElement("feDropShadow")}}
- {{SVGElement("feFlood")}}
- {{SVGElement("feGaussianBlur")}}
- {{SVGElement("feImage")}}
- {{SVGElement("feMerge")}}
- {{SVGElement("feMorphology")}}
- {{SVGElement("feOffset")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feTile")}}
- {{SVGElement("feTurbulence")}}
- [Hướng dẫn SVG: Hiệu ứng bộ lọc](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
