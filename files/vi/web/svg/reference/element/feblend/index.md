---
title: <feBlend>
slug: Web/SVG/Reference/Element/feBlend
page-type: svg-element
browser-compat: svg.elements.feBlend
sidebar: svgref
---

Phần tử primitive lọc **`<feBlend>`** của [SVG](/en-US/docs/Web/SVG) kết hợp hai đối tượng với nhau theo một chế độ hòa trộn nhất định. Điều này tương tự với cách thường thấy trong phần mềm chỉnh sửa ảnh khi hòa trộn hai lớp. Chế độ được định nghĩa bởi thuộc tính {{SVGAttr("mode")}}.

Giống như các primitive lọc khác, nó xử lý các thành phần màu trong {{glossary("color space")}} `linearRGB` theo mặc định. Bạn có thể dùng {{svgattr("color-interpolation-filters")}} để thay bằng `sRGB`.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("in")}}
- {{SVGAttr("in2")}}
- {{SVGAttr("mode")}}
- [Thuộc tính primitive lọc](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes): {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}}, {{SVGAttr("result")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFEBlendElement")}}.

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
      <feFlood
        result="floodFill"
        x="0"
        y="0"
        width="100%"
        height="100%"
        flood-color="green"
        flood-opacity="1" />
      <feBlend in="SourceGraphic" in2="floodFill" mode="multiply" />
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

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính primitive lọc SVG](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes)
- {{SVGElement("filter")}}
- {{SVGElement("animate")}}
- {{SVGElement("set")}}
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
- {{SVGElement("feOffset")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feTile")}}
- {{SVGElement("feTurbulence")}}
- [SVG tutorial: Filter effects](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
