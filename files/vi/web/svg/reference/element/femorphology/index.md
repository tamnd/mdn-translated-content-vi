---
title: <feMorphology>
slug: Web/SVG/Reference/Element/feMorphology
page-type: svg-element
browser-compat: svg.elements.feMorphology
sidebar: svgref
---

**`<feMorphology>`** primitive bộ lọc [SVG](/en-US/docs/Web/SVG) được dùng để làm mòn hoặc giãn ảnh đầu vào. Công dụng của nó đặc biệt hữu ích trong các hiệu ứng làm dày hoặc làm mỏng.

Giống như các primitive bộ lọc khác, nó xử lý các thành phần màu trong {{glossary("color space")}} `linearRGB` theo mặc định. Bạn có thể dùng {{svgattr("color-interpolation-filters")}} để dùng `sRGB` thay thế.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("in")}}
- {{SVGAttr("operator")}}
- {{SVGAttr("radius")}}
- [Thuộc tính primitive bộ lọc](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes): {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}}, {{SVGAttr("result")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFEMorphologyElement")}}.

## Ví dụ

### Lọc nội dung SVG

#### SVG

```html
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="180">
  <filter id="erode">
    <feMorphology operator="erode" radius="1" />
  </filter>
  <filter id="dilate">
    <feMorphology operator="dilate" radius="2" />
  </filter>
  <text y="1em">Văn bản bình thường</text>
  <text id="thin" y="2em">Văn bản bị làm mỏng</text>
  <text id="thick" y="3em">Văn bản bị làm dày</text>
</svg>
```

#### CSS

```css
text {
  font-family: "Helvetica", "Arial", sans-serif;
  font-size: 3em;
}

#thin {
  filter: url("#erode");
}

#thick {
  filter: url("#dilate");
}
```

{{EmbedLiveSample("Filtering_SVG_content", 340, 180)}}

### Lọc nội dung HTML

#### SVG

```html
<svg xmlns="http://www.w3.org/2000/svg" width="0" height="0">
  <filter id="erode">
    <feMorphology operator="erode" radius="1" />
  </filter>
  <filter id="dilate">
    <feMorphology operator="dilate" radius="2" />
  </filter>
</svg>

<p>Văn bản bình thường</p>
<p id="thin">Văn bản bị làm mỏng</p>
<p id="thick">Văn bản bị làm dày</p>
```

#### CSS

```css
p {
  margin: 0;
  font-family: "Helvetica", "Arial", sans-serif;
  font-size: 3em;
}

#thin {
  filter: url("#erode");
}

#thick {
  filter: url("#dilate");
}
```

{{EmbedLiveSample("Filtering_HTML_content", 340, 180)}}

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
- {{SVGElement("feOffset")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feTile")}}
- {{SVGElement("feTurbulence")}}
- [Hướng dẫn SVG: Hiệu ứng bộ lọc](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
