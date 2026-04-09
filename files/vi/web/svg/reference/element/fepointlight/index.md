---
title: <fePointLight>
slug: Web/SVG/Reference/Element/fePointLight
page-type: svg-element
browser-compat: svg.elements.fePointLight
sidebar: svgref
---

Phần tử [SVG](/en-US/docs/Web/SVG) **`<fePointLight>`** xác định một nguồn sáng cho phép tạo hiệu ứng ánh sáng điểm. Nó có thể được dùng trong một primitive bộ lọc chiếu sáng: {{SVGElement("feDiffuseLighting")}} hoặc {{SVGElement("feSpecularLighting")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("x")}}
- {{SVGAttr("y")}}
- {{SVGAttr("z")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFEPointLightElement")}}.

## Ví dụ

### SVG

```html
<svg
  width="200"
  height="200"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <filter id="spotlight">
      <feSpecularLighting
        result="spotlight"
        specularConstant="1.5"
        specularExponent="80"
        lighting-color="white">
        <fePointLight x="50" y="50" z="220" />
      </feSpecularLighting>
      <feComposite
        in="SourceGraphic"
        in2="spotlight"
        operator="arithmetic"
        k1="0"
        k2="1"
        k3="1"
        k4="0" />
    </filter>
  </defs>

  <image
    href="mdn_logo_only_color.png"
    x="10%"
    y="10%"
    width="80%"
    height="80%"
    filter="url(#spotlight)" />
</svg>
```

### Kết quả

{{EmbedLiveSample("Example", 200, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("filter")}}
- {{SVGElement("animate")}}
- {{SVGElement("set")}}
- {{SVGElement("feDiffuseLighting")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feDistantLight")}}
- {{SVGElement("feSpotLight")}}
- [Hướng dẫn SVG: Hiệu ứng bộ lọc](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
