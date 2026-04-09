---
title: <feTile>
slug: Web/SVG/Reference/Element/feTile
page-type: svg-element
browser-compat: svg.elements.feTile
sidebar: svgref
---

Primitive bộ lọc [SVG](/en-US/docs/Web/SVG) **`<feTile>`** cho phép lấp đầy một hình chữ nhật đích bằng một mẫu lặp, dạng ô lát của một ảnh đầu vào. Hiệu ứng này tương tự với {{SVGElement("pattern")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("in")}}
- [Thuộc tính primitive bộ lọc](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes): {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}}, {{SVGAttr("result")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFETileElement")}}.

## Ví dụ

### SVG

```html
<svg
  width="200"
  height="200"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <title>
    Lát ô logo MDN với phần đầu linh vật Mozilla có trên logo
  </title>
  <defs>
    <!-- Xác định vùng của bộ lọc là hộp bao của logo MDN đang được lọc.
         Các tham số này sẽ tạo ra đầu ra phủ cùng một vùng như hình ảnh. -->
    <filter id="tile" x="0" y="0" width="100%" height="100%">
      <!-- Tạo một ô từ phần trung tâm của hình ảnh từ
           (50,50) đến (150,150). Khu vực này thực chất là phần đầu
           của linh vật Mozilla. -->
      <feTile in="SourceGraphic" x="50" y="50" width="100" height="100" />

      <!-- Nếu không chỉ định vùng, feTile mặc định dùng vùng
           của bộ lọc. Nếu không chỉ định tham số "in", mặc định
           là kết quả của primitive trước đó. Vì vậy feTile thứ hai này
           sẽ lát toàn bộ vùng bộ lọc bằng phần đầu linh vật. -->
      <feTile />
    </filter>
  </defs>

  <!-- Dùng logo MDN làm đầu vào cho bộ lọc -->
  <image
    href="mdn_logo_only_color.png"
    x="10%"
    y="10%"
    width="80%"
    height="80%"
    filter="url(#tile)" />
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
- {{SVGElement("feOffset")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feTurbulence")}}
- [Hướng dẫn SVG: Hiệu ứng bộ lọc](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
