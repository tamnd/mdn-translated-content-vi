---
title: <feColorMatrix>
slug: Web/SVG/Reference/Element/feColorMatrix
page-type: svg-element
browser-compat: svg.elements.feColorMatrix
sidebar: svgref
---

Phần tử lọc **`<feColorMatrix>`** của [SVG](/en-US/docs/Web/SVG) thay đổi màu sắc dựa trên một ma trận biến đổi. Giá trị màu của mỗi pixel `[R,G,B,A]` được [nhân ma trận](https://en.wikipedia.org/wiki/Matrix_multiplication) với một ma trận màu 5 x 5 để tạo ra màu mới `[R',G',B',A']`.

> [!NOTE]
> Ký hiệu dấu phẩy **`'`** được dùng trong toán học để chỉ kết quả của một phép biến đổi.

```plain
| R' |     | r1 r2 r3 r4 r5 |   | R |
| G' |     | g1 g2 g3 g4 g5 |   | G |
| B' |  =  | b1 b2 b3 b4 b5 | * | B |
| A' |     | a1 a2 a3 a4 a5 |   | A |
| 1  |     | 0  0  0  0  1  |   | 1 |
```

Nói đơn giản hơn, dưới đây là cách từng kênh màu trong pixel mới được tính. Hàng cuối cùng bị bỏ qua vì các giá trị của nó là hằng số.

```plain
R' = r1*R + r2*G + r3*B + r4*A + r5
G' = g1*R + g2*G + g3*B + g4*A + g5
B' = b1*R + b2*G + b3*B + b4*A + b5
A' = a1*R + a2*G + a3*B + a4*A + a5
```

Hãy xét lượng đỏ trong pixel mới, hay `R'`:

Nó là tổng của:

- `r1` nhân với giá trị đỏ cũ của pixel `R`,
- `r2` nhân với giá trị xanh lá cũ `G`,
- `r3` nhân với giá trị xanh dương cũ `B`,
- `r4` nhân với giá trị alpha cũ `A`,
- cộng thêm độ dịch `r5`.

Những lượng này có thể là bất kỳ số thực nào, mặc dù **R'** cuối cùng sẽ bị giới hạn trong khoảng từ 0 đến 1. Điều tương tự cũng áp dụng cho **G'**, **B'**, và **A'**.

```plain
R'      =      r1 * R      +        r2 * G      +       r3 * B      +       r4 * A       +       r5
New red = [ r1 * old red ] + [ r2 * old green ] + [ r3 * old Blue ] + [ r4 * old Alpha ] + [ shift of r5 ]
```

Nếu, chẳng hạn, ta muốn làm cho một hình ảnh hoàn toàn đen trở nên đỏ hơn, ta có thể đặt `r5` thành một số thực dương _x_, làm tăng độ đỏ trên mọi pixel của hình ảnh mới lên thêm _x_.

Một **ma trận đơn vị** trông như sau:

```plain
     R G B A W
R' | 1 0 0 0 0 |
G' | 0 1 0 0 0 |
B' | 0 0 1 0 0 |
A' | 0 0 0 1 0 |
```

Trong đó, mọi giá trị mới đều đúng bằng 1 lần giá trị cũ của nó, không cộng thêm gì khác. Nên bắt đầu chỉnh sửa ma trận từ đây.

Giống như các primitive lọc khác, nó xử lý các thành phần màu trong {{glossary("color space")}} `linearRGB` theo mặc định. Bạn có thể dùng {{svgattr("color-interpolation-filters")}} để thay bằng `sRGB`.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("in")}}
- {{SVGAttr("type")}}: Các giá trị gồm `matrix`, `saturate`, `hueRotate`, và `luminanceToAlpha`
- {{SVGAttr("values")}}: Giá trị cho kiểu ma trận được đặt trong thuộc tính `type`
- [Thuộc tính primitive lọc](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes): {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}}, {{SVGAttr("result")}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGFEColorMatrixElement")}}.

## Ví dụ

### SVG

```html
<svg
  width="100%"
  height="100%"
  viewBox="0 0 150 500"
  preserveAspectRatio="xMidYMid meet"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <!-- ref -->
  <defs>
    <g id="circles">
      <circle cx="30" cy="30" r="20" fill="blue" fill-opacity="0.5" />
      <circle cx="20" cy="50" r="20" fill="green" fill-opacity="0.5" />
      <circle cx="40" cy="50" r="20" fill="red" fill-opacity="0.5" />
    </g>
  </defs>
  <use href="#circles" />
  <text x="70" y="50">Reference</text>

  <!-- identity matrix -->
  <filter id="colorMeTheSame">
    <feColorMatrix
      in="SourceGraphic"
      type="matrix"
      values="1 0 0 0 0
              0 1 0 0 0
              0 0 1 0 0
              0 0 0 1 0" />
  </filter>
  <use
    href="#circles"
    transform="translate(0 70)"
    filter="url(#colorMeTheSame)" />
  <text x="70" y="120">Identity matrix</text>

  <!-- Combine RGB into green matrix -->
  <filter id="colorMeGreen">
    <feColorMatrix
      in="SourceGraphic"
      type="matrix"
      values="0 0 0 0 0
              1 1 1 1 0
              0 0 0 0 0
              0 0 0 1 0" />
  </filter>
  <use
    href="#circles"
    transform="translate(0 140)"
    filter="url(#colorMeGreen)" />
  <text x="70" y="190">rgbToGreen</text>

  <!-- saturate -->
  <filter id="colorMeSaturate">
    <feColorMatrix in="SourceGraphic" type="saturate" values="0.2" />
  </filter>
  <use
    href="#circles"
    transform="translate(0 210)"
    filter="url(#colorMeSaturate)" />
  <text x="70" y="260">saturate</text>

  <!-- hueRotate -->
  <filter id="colorMeHueRotate">
    <feColorMatrix in="SourceGraphic" type="hueRotate" values="180" />
  </filter>
  <use
    href="#circles"
    transform="translate(0 280)"
    filter="url(#colorMeHueRotate)" />
  <text x="70" y="330">hueRotate</text>

  <!-- luminanceToAlpha -->
  <filter id="colorMeLTA">
    <feColorMatrix in="SourceGraphic" type="luminanceToAlpha" />
  </filter>
  <use href="#circles" transform="translate(0 350)" filter="url(#colorMeLTA)" />
  <text x="70" y="400">luminanceToAlpha</text>
</svg>
```

### Kết quả

{{EmbedLiveSample("Example", "100%", "700")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính primitive lọc SVG](/en-US/docs/Web/SVG/Reference/Attribute#filter_primitive_attributes_presentation_attributes)
- {{SVGElement("filter")}}
- {{SVGElement("animate")}}
- {{SVGElement("set")}}
- {{SVGElement("feBlend")}}
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
