---
title: <animateTransform>
slug: Web/SVG/Reference/Element/animateTransform
page-type: svg-element
browser-compat: svg.elements.animateTransform
sidebar: svgref
---

Phần tử **`<animateTransform>`** của [SVG](/en-US/docs/Web/SVG) hoạt ảnh hóa một thuộc tính biến đổi trên phần tử đích của nó, từ đó cho phép các hoạt ảnh điều khiển dịch chuyển, co giãn, xoay và/hoặc nghiêng.

## Ngữ cảnh sử dụng

{{svginfo}}

## Ví dụ

```html
<svg
  width="120"
  height="120"
  viewBox="0 0 120 120"
  xmlns="http://www.w3.org/2000/svg">
  <polygon points="60,30 90,90 30,90">
    <animateTransform
      attributeName="transform"
      attributeType="XML"
      type="rotate"
      from="0 60 70"
      to="360 60 70"
      dur="10s"
      repeatCount="indefinite" />
  </polygon>
</svg>
```

{{ EmbedLiveSample('Example','120','120') }}

## Thuộc tính

- {{ SVGAttr("by") }}
- {{ SVGAttr("from") }}
- {{ SVGAttr("to") }}
- {{ SVGAttr("type") }}

## Giao diện DOM

Phần tử này triển khai giao diện [`SVGAnimateTransformElement`](/en-US/docs/Web/API/SVGAnimateTransformElement).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
