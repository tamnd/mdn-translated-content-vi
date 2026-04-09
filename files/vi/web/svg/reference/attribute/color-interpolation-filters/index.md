---
title: color-interpolation-filters
slug: Web/SVG/Reference/Attribute/color-interpolation-filters
page-type: svg-attribute
browser-compat: svg.global_attributes.color-interpolation-filters
sidebar: svgref
---

Thuộc tính **`color-interpolation-filters`** chỉ định không gian màu cho các phép xử lý ảnh được thực hiện thông qua hiệu ứng bộ lọc.

> [!NOTE]
> Thuộc tính này chỉ có ảnh hưởng lên các thao tác bộ lọc. Vì vậy, nó không có tác dụng với các filter primitive như {{SVGElement("feOffset")}}, {{SVGElement("feImage")}}, {{SVGElement("feTile")}} hoặc {{SVGElement("feFlood")}}.
>
> `color-interpolation-filters` có giá trị khởi đầu khác với {{SVGAttr("color-interpolation")}}. `color-interpolation-filters` có giá trị khởi đầu là `linearRGB`, trong khi `color-interpolation` có giá trị khởi đầu là `sRGB`. Vì vậy, trong trường hợp mặc định, các thao tác hiệu ứng bộ lọc xảy ra trong không gian màu linearRGB, trong khi mọi phép nội suy màu khác theo mặc định xảy ra trong không gian màu sRGB.
>
> Nó không có ảnh hưởng lên các hàm bộ lọc, vốn hoạt động trong không gian màu {{Glossary("RGB", "sRGB")}}.

> [!NOTE]
> Với vai trò là một presentation attribute, `color-interpolation-filters` cũng có thuộc tính CSS tương ứng: {{cssxref("color-interpolation-filters")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feSpotLight")}}
- {{SVGElement("feBlend")}}
- {{SVGElement("feColorMatrix")}}
- {{SVGElement("feComponentTransfer")}}
- {{SVGElement("feComposite")}}
- {{SVGElement("feConvolveMatrix")}}
- {{SVGElement("feDiffuseLighting")}}
- {{SVGElement("feDisplacementMap")}}
- {{SVGElement("feDropShadow")}}
- {{SVGElement("feFlood")}}
- {{SVGElement("feGaussianBlur")}}
- {{SVGElement("feImage")}}
- {{SVGElement("feMerge")}}
- {{SVGElement("feMorphology")}}
- {{SVGElement("feOffset")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feTile")}}
- {{SVGElement("feTurbulence")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>auto</code> | <code>sRGB</code> | <code>linearRGB</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>linearRGB</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>discrete</td>
    </tr>
  </tbody>
</table>

- `auto`
  - : Cho biết rằng user agent có thể chọn không gian `sRGB` hoặc `linearRGB` cho phép nội suy màu. Tùy chọn này cho biết tác giả không yêu cầu việc nội suy màu phải diễn ra trong một không gian màu cụ thể.
- `sRGB`
  - : Cho biết rằng phép nội suy màu nên diễn ra trong không gian màu sRGB.
- `linearRGB`
  - : Cho biết rằng phép nội suy màu nên diễn ra trong không gian màu RGB tuyến tính như mô tả trong [đặc tả sRGB](https://webstore.iec.ch/en/publication/6169).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("color-interpolation")}}
- Thuộc tính CSS {{cssxref('color-interpolation-filters')}}
- [đặc tả sRGB](https://webstore.iec.ch/en/publication/6169)
