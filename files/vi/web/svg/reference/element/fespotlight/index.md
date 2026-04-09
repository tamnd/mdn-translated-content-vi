---
title: <feSpotLight>
slug: Web/SVG/Reference/Element/feSpotLight
page-type: svg-element
browser-compat: svg.elements.feSpotLight
sidebar: svgref
---

Phần tử [SVG](/en-US/docs/Web/SVG) **`<feSpotLight>`** xác định một nguồn sáng có thể được dùng để tạo hiệu ứng đèn rọi.
Nó được dùng trong một primitive bộ lọc chiếu sáng: {{SVGElement("feDiffuseLighting")}} hoặc {{SVGElement("feSpecularLighting")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("x")}}
- {{SVGAttr("y")}}
- {{SVGAttr("z")}}
- {{SVGAttr("pointsAtX")}}
- {{SVGAttr("pointsAtY")}}
- {{SVGAttr("pointsAtZ")}}
- {{SVGAttr("specularExponent")}}
- {{SVGAttr("limitingConeAngle")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFESpotLightElement")}}.

## Ví dụ

### HTML

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
        specularExponent="4"
        lighting-color="white">
        <feSpotLight x="600" y="600" z="400" limitingConeAngle="5.5" />
      </feSpecularLighting>
      <feComposite
        in="SourceGraphic"
        in2="spotlight"
        operator="out"
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
- {{SVGElement("fePointLight")}}
- [Hướng dẫn SVG: Hiệu ứng bộ lọc](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
