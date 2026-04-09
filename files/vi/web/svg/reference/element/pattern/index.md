---
title: <pattern>
slug: Web/SVG/Reference/Element/pattern
page-type: svg-element
browser-compat: svg.elements.pattern
sidebar: svgref
---

Phần tử **`<pattern>`** của [SVG](/en-US/docs/Web/SVG) định nghĩa một đối tượng đồ họa có thể được vẽ lại theo các khoảng cách tọa độ x và y lặp lại ("tile") để bao phủ một vùng.

Phần tử `<pattern>` được tham chiếu bởi các thuộc tính {{SVGAttr("fill")}} và/hoặc {{SVGAttr("stroke")}} trên các [phần tử đồ họa](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes) khác để tô hoặc vẽ viền cho các phần tử đó bằng pattern được tham chiếu.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("height")}}
  - : Thuộc tính này xác định chiều cao của tile pattern.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("href")}}
  - : Thuộc tính này tham chiếu một pattern mẫu cung cấp các giá trị mặc định cho các thuộc tính của `<pattern>`.
    _Kiểu giá trị_: [**\<URL>**](/en-US/docs/Web/SVG/Guides/Content_type#url); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("patternContentUnits")}}
  - : Thuộc tính này định nghĩa hệ tọa độ cho nội dung của `<pattern>`.
    _Kiểu giá trị_: `userSpaceOnUse` | `objectBoundingBox`; _Giá trị mặc định_: `userSpaceOnUse`; _Có thể hoạt ảnh_: **có**

    > [!NOTE]
    > Thuộc tính này không có tác dụng nếu thuộc tính `viewBox` được chỉ định trên phần tử `<pattern>`.

- {{SVGAttr("patternTransform")}}
  - : Thuộc tính này chứa định nghĩa của một phép biến đổi bổ sung tùy chọn từ hệ tọa độ của pattern sang hệ tọa độ đích.
    _Kiểu giá trị_: [**\<transform-list>**](/en-US/docs/Web/SVG/Guides/Content_type#transform-list); _Giá trị mặc định_: _identity transform_; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("patternUnits")}}
  - : Thuộc tính này định nghĩa hệ tọa độ cho các thuộc tính `x`, `y`, `width`, và `height`.
    _Kiểu giá trị_: `userSpaceOnUse` | `objectBoundingBox`; _Giá trị mặc định_: `objectBoundingBox`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("preserveAspectRatio")}}
  - : Thuộc tính này định nghĩa cách fragment SVG phải bị biến dạng nếu nó được nhúng trong một container có {{glossary("aspect ratio")}} khác.
    _Kiểu giá trị_: (`none` | `xMinYMin` | `xMidYMin` | `xMaxYMin` | `xMinYMid` | `xMidYMid` | `xMaxYMid` | `xMinYMax` | `xMidYMax` | `xMaxYMax`) (`meet` | `slice`)?; _Giá trị mặc định_: `xMidYMid meet`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("viewBox")}}
  - : Thuộc tính này định nghĩa ranh giới của viewport SVG cho fragment pattern.
    _Kiểu giá trị_: **[\<list-of-numbers>](/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts)**; _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("width")}}
  - : Thuộc tính này xác định chiều rộng của tile pattern.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("x")}}
  - : Thuộc tính này xác định độ dịch chuyển tọa độ x của tile pattern.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("xlink:href")}} {{deprecated_inline}}
  - : Thuộc tính này tham chiếu một pattern mẫu cung cấp các giá trị mặc định cho các thuộc tính của `<pattern>`.
    _Kiểu giá trị_: [**\<URL>**](/en-US/docs/Web/SVG/Guides/Content_type#url); _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **có**

    > [!NOTE]
    > Với các trình duyệt triển khai `href`, nếu cả `href` và `xlink:href` đều được đặt, `xlink:href` sẽ bị bỏ qua và chỉ `href` được dùng.

- {{SVGAttr("y")}}
  - : Thuộc tính này xác định độ dịch chuyển tọa độ y của tile pattern.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGPatternElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 230 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <pattern id="star" viewBox="0,0,10,10" width="10%" height="10%">
      <polygon points="0,0 2,5 0,10 5,8 10,10 8,5 10,0 5,2" />
    </pattern>
  </defs>

  <circle cx="50" cy="50" r="50" fill="url(#star)" />
  <circle
    cx="180"
    cy="50"
    r="40"
    fill="none"
    stroke-width="20"
    stroke="url(#star)" />
</svg>
```

{{EmbedLiveSample('Examples', 150, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
