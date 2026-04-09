---
title: <feDiffuseLighting>
slug: Web/SVG/Reference/Element/feDiffuseLighting
page-type: svg-element
browser-compat: svg.elements.feDiffuseLighting
sidebar: svgref
---

Phần tử primitive lọc **`<feDiffuseLighting>`** của [SVG](/en-US/docs/Web/SVG) chiếu sáng một hình ảnh bằng cách dùng kênh alpha làm bump map. Ảnh kết quả, là một ảnh RGBA đục, phụ thuộc vào màu ánh sáng, vị trí ánh sáng và hình học bề mặt của bump map đầu vào.

Light map do primitive lọc này tạo ra có thể được kết hợp với ảnh texture bằng thành phần multiply của toán tử `arithmetic` trong primitive lọc {{SVGElement("feComposite")}}. Có thể mô phỏng nhiều nguồn sáng bằng cách cộng nhiều light map này lại với nhau trước khi áp dụng lên ảnh texture.

Giống như các primitive lọc khác, nó xử lý các thành phần màu trong {{glossary("color space")}} `linearRGB` theo mặc định. Bạn có thể dùng {{svgattr("color-interpolation-filters")}} để thay bằng `sRGB`.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("in")}}
- {{SVGAttr("surfaceScale")}}
- {{SVGAttr("diffuseConstant")}}
- {{SVGAttr("kernelUnitLength")}}
- [Thuộc tính primitive lọc](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes): {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}}, {{SVGAttr("result")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFEDiffuseLightingElement")}}.

## Ví dụ

Ví dụ sau cho thấy hiệu ứng của phần tử `<feDiffuseLighting>` trên một hình tròn với từng nguồn sáng khả dụng. Mỗi lần, ánh sáng đến từ góc trên bên trái.

```html
<svg width="440" height="140" xmlns="http://www.w3.org/2000/svg">
  <!-- Không có ánh sáng được áp dụng -->
  <text text-anchor="middle" x="60" y="22">No Light</text>
  <circle cx="60" cy="80" r="50" fill="green" />

  <!-- nguồn sáng là một phần tử fePointLight -->
  <text text-anchor="middle" x="170" y="22">fePointLight</text>
  <filter id="lightMe1">
    <feDiffuseLighting in="SourceGraphic" result="light" lighting-color="white">
      <fePointLight x="150" y="60" z="20" />
    </feDiffuseLighting>

    <feComposite
      in="SourceGraphic"
      in2="light"
      operator="arithmetic"
      k1="1"
      k2="0"
      k3="0"
      k4="0" />
  </filter>

  <circle cx="170" cy="80" r="50" fill="green" filter="url(#lightMe1)" />

  <!-- nguồn sáng là một phần tử feDistantLight -->
  <text text-anchor="middle" x="280" y="22">feDistantLight</text>
  <filter id="lightMe2">
    <feDiffuseLighting in="SourceGraphic" result="light" lighting-color="white">
      <feDistantLight azimuth="240" elevation="20" />
    </feDiffuseLighting>

    <feComposite
      in="SourceGraphic"
      in2="light"
      operator="arithmetic"
      k1="1"
      k2="0"
      k3="0"
      k4="0" />
  </filter>

  <circle cx="280" cy="80" r="50" fill="green" filter="url(#lightMe2)" />

  <!-- nguồn sáng là một nguồn feSpotLight -->
  <text text-anchor="middle" x="390" y="22">feSpotLight</text>
  <filter id="lightMe3">
    <feDiffuseLighting in="SourceGraphic" result="light" lighting-color="white">
      <feSpotLight
        x="360"
        y="5"
        z="30"
        limitingConeAngle="20"
        pointsAtX="390"
        pointsAtY="80"
        pointsAtZ="0" />
    </feDiffuseLighting>

    <feComposite
      in="SourceGraphic"
      in2="light"
      operator="arithmetic"
      k1="1"
      k2="0"
      k3="0"
      k4="0" />
  </filter>

  <circle cx="390" cy="80" r="50" fill="green" filter="url(#lightMe3)" />
</svg>
```

Ảnh kết xuất mong đợi:

![Ảnh kết xuất mong đợi cho ví dụ](fediffuselighting.png)

Kết xuất trực tiếp:

{{EmbedLiveSample("Example", 470, 170)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính primitive lọc SVG](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes)
- {{SVGElement("filter")}}
- {{SVGElement("feBlend")}}
- {{SVGElement("feColorMatrix")}}
- {{SVGElement("feComponentTransfer")}}
- {{SVGElement("feComposite")}}
- {{SVGElement("feConvolveMatrix")}}
- {{SVGElement("feDisplacementMap")}}
- {{SVGElement("feDistantLight")}}
- {{SVGElement("feFlood")}}
- {{SVGElement("feGaussianBlur")}}
- {{SVGElement("feImage")}}
- {{SVGElement("feMerge")}}
- {{SVGElement("feMorphology")}}
- {{SVGElement("feOffset")}}
- {{SVGElement("fePointLight")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feSpotLight")}}
- {{SVGElement("feTile")}}
- {{SVGElement("feTurbulence")}}
- [SVG tutorial: Filter effects](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
