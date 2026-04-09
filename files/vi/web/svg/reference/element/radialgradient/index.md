---
title: <radialGradient>
slug: Web/SVG/Reference/Element/radialGradient
page-type: svg-element
browser-compat: svg.elements.radialGradient
sidebar: svgref
---

Phần tử **`<radialGradient>`** của [SVG](/en-US/docs/Web/SVG) cho phép tác giả định nghĩa các gradient xuyên tâm có thể được áp dụng cho fill hoặc stroke của các phần tử đồ họa.

> [!NOTE]
> Đừng nhầm với CSS {{cssxref('gradient/radial-gradient', 'radial-gradient()')}} vì các gradient CSS chỉ có thể áp dụng cho phần tử HTML, trong khi gradient SVG chỉ có thể áp dụng cho phần tử SVG.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("cx")}}
  - : Thuộc tính này xác định tọa độ x của hình tròn kết thúc của radial gradient.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `50%`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("cy")}}
  - : Thuộc tính này xác định tọa độ y của hình tròn kết thúc của radial gradient.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `50%`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("fr")}}
  - : Thuộc tính này xác định bán kính của hình tròn bắt đầu của radial gradient. Gradient sẽ được vẽ sao cho {{SVGElement('stop','gradient stop')}} 0% được ánh xạ tới chu vi của hình tròn bắt đầu.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `0%`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("fx")}}
  - : Thuộc tính này xác định tọa độ x của hình tròn bắt đầu của radial gradient.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: Giống `cx`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("fy")}}
  - : Thuộc tính này xác định tọa độ y của hình tròn bắt đầu của radial gradient.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: Giống `cy`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("gradientUnits")}}
  - : Thuộc tính này xác định hệ tọa độ cho các thuộc tính `cx`, `cy`, `r`, `fx`, `fy`, `fr`
    _Kiểu giá trị_: `userSpaceOnUse` | `objectBoundingBox`; _Giá trị mặc định_: `objectBoundingBox`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("gradientTransform")}}
  - : Thuộc tính này cung cấp [biến đổi](/en-US/docs/Web/SVG/Reference/Attribute/transform) bổ sung cho hệ tọa độ của gradient.
    _Kiểu giá trị_: [**\<transform-list>**](/en-US/docs/Web/SVG/Guides/Content_type#transform-list); _Giá trị mặc định_: _identity transform_; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("href")}}
  - : Thuộc tính này xác định một tham chiếu tới một phần tử `<radialGradient>` khác sẽ được dùng làm mẫu.
    _Kiểu giá trị_: [**\<URL>**](/en-US/docs/Web/SVG/Guides/Content_type#url); _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("r")}}
  - : Thuộc tính này xác định bán kính của hình tròn kết thúc của radial gradient. Gradient sẽ được vẽ sao cho {{SVGElement('stop','gradient stop')}} 100% được ánh xạ tới chu vi của hình tròn kết thúc.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `50%`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("spreadMethod")}}
  - : Thuộc tính này cho biết gradient hoạt động như thế nào nếu nó bắt đầu hoặc kết thúc bên trong ranh giới của hình chứa gradient.
    _Kiểu giá trị_: `pad` | `reflect` | `repeat`; _Giá trị mặc định_: `pad`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("xlink:href")}} {{deprecated_inline}}
  - : Một tham chiếu [\<IRI>](/en-US/docs/Web/SVG/Guides/Content_type#iri) tới một phần tử `<radialGradient>` khác sẽ được dùng làm mẫu.
    _Kiểu giá trị_: [**\<IRI>**](/en-US/docs/Web/SVG/Guides/Content_type#iri); _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGRadialGradientElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg
  viewBox="0 0 10 10"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <radialGradient id="myGradient">
      <stop offset="10%" stop-color="gold" />
      <stop offset="95%" stop-color="red" />
    </radialGradient>
  </defs>

  <!-- dùng radial gradient của tôi -->
  <circle cx="5" cy="5" r="4" fill="url('#myGradient')" />
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
