---
title: <feMergeNode>
slug: Web/SVG/Reference/Element/feMergeNode
page-type: svg-element
browser-compat: svg.elements.feMergeNode
sidebar: svgref
---

**`<feMergeNode>`** [SVG](/en-US/docs/Web/SVG) nhận kết quả của một bộ lọc khác để phần tử cha {{ SVGElement("feMerge") }} của nó xử lý.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("in")}}

## Giao diện DOM

Phần tử này triển khai giao diện [`SVGFEMergeNodeElement`](/en-US/docs/Web/API/SVGFEMergeNodeElement).

## Ví dụ

```html
<svg
  width="200"
  height="200"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <filter id="feOffset" x="-40" y="-20" width="100" height="200">
    <feOffset in="SourceGraphic" dx="60" dy="60" />
    <feGaussianBlur in="SourceGraphic" stdDeviation="5" result="blur2" />
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
  <rect x="40" y="40" width="100" height="100" stroke="black" fill="green" />
</svg>
```

### Kết quả

{{EmbedLiveSample('Example', 200, 200)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ SVGElement("filter") }}
- {{ SVGElement("animate") }}
- {{ SVGElement("set") }}
- {{ SVGElement("feMerge") }}
- [Hướng dẫn SVG: Hiệu ứng bộ lọc](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
