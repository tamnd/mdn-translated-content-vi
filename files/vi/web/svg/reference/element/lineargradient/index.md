---
title: <linearGradient>
slug: Web/SVG/Reference/Element/linearGradient
page-type: svg-element
browser-compat: svg.elements.linearGradient
sidebar: svgref
---

Phần tử **`<linearGradient>`** của [SVG](/en-US/docs/Web/SVG) cho phép tác giả định nghĩa các gradient tuyến tính để áp dụng cho các phần tử SVG khác.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("gradientUnits")}}
  - : Thuộc tính này xác định hệ tọa độ cho các thuộc tính `x1`, `x2`, `y1`, `y2`
    _Kiểu giá trị_: `userSpaceOnUse` | `objectBoundingBox`; _Giá trị mặc định_: `objectBoundingBox`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("gradientTransform")}}
  - : Thuộc tính này cung cấp [biến đổi](/en-US/docs/Web/SVG/Reference/Attribute/transform) bổ sung cho hệ tọa độ của gradient.
    _Kiểu giá trị_: [**\<transform-list>**](/en-US/docs/Web/SVG/Guides/Content_type#transform-list); _Giá trị mặc định_: _identity transform_; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("href")}}
  - : Thuộc tính này xác định một tham chiếu tới một phần tử `<linearGradient>` khác sẽ được dùng làm mẫu.
    _Kiểu giá trị_: [**\<URL>**](/en-US/docs/Web/SVG/Guides/Content_type#url); _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("spreadMethod")}}
  - : Thuộc tính này cho biết gradient hoạt động như thế nào nếu nó bắt đầu hoặc kết thúc bên trong ranh giới của hình chứa gradient.
    _Kiểu giá trị_: `pad` | `reflect` | `repeat`; _Giá trị mặc định_: `pad`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("x1")}}
  - : Thuộc tính này xác định tọa độ x của điểm bắt đầu của vector gradient mà theo đó linear gradient được vẽ.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `0%`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("x2")}}
  - : Thuộc tính này xác định tọa độ x của điểm kết thúc của vector gradient mà theo đó linear gradient được vẽ.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `100%`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("xlink:href")}} {{deprecated_inline}}
  - : Một tham chiếu [\<IRI>](/en-US/docs/Web/SVG/Guides/Content_type#iri) tới một phần tử `<linearGradient>` khác sẽ được dùng làm mẫu.
    _Kiểu giá trị_: [**\<IRI>**](/en-US/docs/Web/SVG/Guides/Content_type#iri); _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("y1")}}
  - : Thuộc tính này xác định tọa độ y của điểm bắt đầu của vector gradient mà theo đó linear gradient được vẽ.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `0%`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("y2")}}
  - : Thuộc tính này xác định tọa độ y của điểm kết thúc của vector gradient mà theo đó linear gradient được vẽ.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `0%`; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGLinearGradientElement")}}.

## Ví dụ

### Linear gradient cơ bản

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
    <linearGradient id="myGradient" gradientTransform="rotate(90)">
      <stop offset="5%" stop-color="gold" />
      <stop offset="95%" stop-color="red" />
    </linearGradient>
  </defs>

  <!-- dùng linear gradient của tôi -->
  <circle cx="5" cy="5" r="4" fill="url('#myGradient')" />
</svg>
```

{{EmbedLiveSample('Basic linear gradient', 150, '100%')}}

### Gradient nghiêng lặp lại

Trong ví dụ này, hai phần tử {{SVGElement("rect")}} có tỷ lệ khung hình khác nhau, nhưng góc của gradient là như nhau.

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg
  viewBox="0 0 500 500"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <linearGradient
      id="grad"
      x1="0"
      y1="0"
      x2="20"
      y2="20"
      spreadMethod="repeat"
      gradientUnits="userSpaceOnUse">
      <stop offset="50%" stop-color="red" />
      <stop offset="50%" stop-color="gold" />
    </linearGradient>
  </defs>
  <rect width="100%" height="25%" fill="url(#grad)" />
  <rect width="100%" height="65%" fill="url(#grad)" y="30%" />
</svg>
```

{{EmbedLiveSample('Repeating angled gradient', 500, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
