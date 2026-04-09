---
title: <feSpecularLighting>
slug: Web/SVG/Reference/Element/feSpecularLighting
page-type: svg-element
browser-compat: svg.elements.feSpecularLighting
sidebar: svgref
---

Phần tử [SVG](/en-US/docs/Web/SVG) **`<feSpecularLighting>`** là một primitive bộ lọc chiếu sáng nguồn đồ họa bằng kênh alpha làm bản đồ độ gồ ghề. Hình ảnh thu được là ảnh RGBA dựa trên màu ánh sáng. Phép tính chiếu sáng tuân theo thành phần phản xạ gương chuẩn của [mô hình chiếu sáng Phong](https://en.wikipedia.org/wiki/Phong_reflection_model). Hình ảnh thu được phụ thuộc vào màu ánh sáng, vị trí nguồn sáng và hình học bề mặt của bản đồ độ gồ ghề đầu vào. Kết quả của phép tính chiếu sáng được cộng vào. Primitive bộ lọc này giả định rằng người quan sát ở vô cực theo hướng z.

Primitive bộ lọc này tạo ra một hình ảnh chứa phần phản xạ gương của phép tính chiếu sáng. Bản đồ như vậy được dự định kết hợp với một texture bằng toán hạng `add` của phương thức số học {{SVGElement("feComposite")}}. Có thể mô phỏng nhiều nguồn sáng bằng cách cộng nhiều bản đồ sáng như vậy trước khi áp dụng lên ảnh texture.

Giống như các primitive bộ lọc khác, nó xử lý các thành phần màu trong {{glossary("color space", "không gian màu")}} `linearRGB` theo mặc định. Bạn có thể dùng {{svgattr("color-interpolation-filters")}} để dùng `sRGB` thay thế.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("in")}}
- {{SVGAttr("surfaceScale")}}
- {{SVGAttr("specularConstant")}}
- {{SVGAttr("specularExponent")}}
- {{SVGAttr("kernelUnitLength")}}
- [Thuộc tính primitive bộ lọc](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes): {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}}, {{SVGAttr("result")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFESpecularLightingElement")}}.

## Ví dụ

```html
<svg
  height="200"
  width="200"
  viewBox="0 0 220 220"
  xmlns="http://www.w3.org/2000/svg">
  <filter id="filter">
    <feSpecularLighting
      result="specOut"
      specularExponent="20"
      lighting-color="#bbbbbb">
      <fePointLight x="50" y="75" z="200" />
    </feSpecularLighting>
    <feComposite
      in="SourceGraphic"
      in2="specOut"
      operator="arithmetic"
      k1="0"
      k2="1"
      k3="1"
      k4="0" />
  </filter>
  <circle cx="110" cy="110" r="100" filter="url(#filter)" />
</svg>
```

### Kết quả

{{EmbedLiveSample("Example", 220, 220)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("filter")}}
- {{SVGElement("feBlend")}}
- {{SVGElement("feColorMatrix")}}
- {{SVGElement("feComponentTransfer")}}
- {{SVGElement("feComposite")}}
- {{SVGElement("feConvolveMatrix")}}
- {{SVGElement("feDiffuseLighting")}}
- {{SVGElement("feDisplacementMap")}}
- {{SVGElement("feDistantLight")}}
- {{SVGElement("feFlood")}}
- {{SVGElement("feGaussianBlur")}}
- {{SVGElement("feImage")}}
- {{SVGElement("feMerge")}}
- {{SVGElement("feMorphology")}}
- {{SVGElement("feOffset")}}
- {{SVGElement("fePointLight")}}
- {{SVGElement("feSpotLight")}}
- {{SVGElement("feTile")}}
- {{SVGElement("feTurbulence")}}
- [Hướng dẫn SVG: Hiệu ứng bộ lọc](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
