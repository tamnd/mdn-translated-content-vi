---
title: <marker>
slug: Web/SVG/Reference/Element/marker
page-type: svg-element
browser-compat: svg.elements.marker
sidebar: svgref
---

Phần tử **`<marker>`** của [SVG](/en-US/docs/Web/SVG) định nghĩa một đồ họa được dùng để vẽ mũi tên hoặc polymarker trên một phần tử {{SVGElement("path")}}, {{SVGElement("line")}}, {{SVGElement("polyline")}} hoặc {{SVGElement("polygon")}} nhất định.

Marker có thể được gắn vào các hình bằng các thuộc tính {{SVGAttr("marker-start")}}, {{SVGAttr("marker-mid")}}, và {{SVGAttr("marker-end")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("markerHeight")}}
  - : Thuộc tính này định nghĩa chiều cao của viewport của marker.
    _Kiểu giá trị_: **[\<length>](/en-US/docs/Web/SVG/Guides/Content_type#length)**; _Giá trị mặc định_: `3`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("markerUnits")}}
  - : Thuộc tính này định nghĩa hệ tọa độ cho các thuộc tính `markerWidth`, `markerHeight` và nội dung của `<marker>`.
    _Kiểu giá trị_: `userSpaceOnUse` | `strokeWidth`; _Giá trị mặc định_: `strokeWidth`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("markerWidth")}}
  - : Thuộc tính này định nghĩa chiều rộng của viewport của marker.
    _Kiểu giá trị_: **[\<length>](/en-US/docs/Web/SVG/Guides/Content_type#length)**; _Giá trị mặc định_: `3`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("orient")}}
  - : Thuộc tính này định nghĩa hướng của marker tương đối với hình mà nó được gắn vào.
    _Kiểu giá trị_: `auto` | `auto-start-reverse` | **[\<angle>](/en-US/docs/Web/SVG/Guides/Content_type#angle)**; _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("preserveAspectRatio")}}
  - : Thuộc tính này định nghĩa cách fragment svg phải bị biến dạng nếu nó được nhúng trong một container có {{glossary("aspect ratio")}} khác.
    _Kiểu giá trị_: (`none` | `xMinYMin` | `xMidYMin` | `xMaxYMin` | `xMinYMid` | `xMidYMid` | `xMaxYMid` | `xMinYMax` | `xMidYMax` | `xMaxYMax`) (`meet` | `slice`)?; _Giá trị mặc định_: `xMidYMid meet`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("refX")}}
  - : Thuộc tính này định nghĩa tọa độ x cho điểm tham chiếu của marker.
    _Kiểu giá trị_: `left` | `center` | `right` | **[\<coordinate>](/en-US/docs/Web/SVG/Guides/Content_type#coordinate)**; _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("refY")}}
  - : Thuộc tính này định nghĩa tọa độ y cho điểm tham chiếu của marker.
    _Kiểu giá trị_: `top` | `center` | `bottom` | **[\<coordinate>](/en-US/docs/Web/SVG/Guides/Content_type#coordinate)**; _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("viewBox")}}
  - : Thuộc tính này định nghĩa ranh giới của viewport SVG cho fragment SVG hiện tại.
    _Kiểu giá trị_: **[\<list-of-numbers>](/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts)**; _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGMarkerElement")}}.

## Ví dụ

### Vẽ mũi tên

Ví dụ sau cho thấy cách vẽ một mũi tên trên một đường thẳng và trên một đường cong.
Với đường cong, một mũi tên được vẽ tại mỗi điểm bằng marker {{SVGAttr("marker-mid")}}.

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 300 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <!-- Một marker dùng làm mũi tên -->
    <marker
      id="arrow"
      viewBox="0 0 10 10"
      refX="5"
      refY="5"
      markerWidth="6"
      markerHeight="6"
      orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>
  </defs>

  <!-- Một đường thẳng với marker -->
  <line
    x1="10"
    y1="10"
    x2="90"
    y2="90"
    stroke="black"
    marker-end="url(#arrow)" />

  <!-- Một đường cong với các marker -->
  <path
    d="M 110 10
       C 120 20, 130 20, 140 10
       C 150 0, 160 0, 170 10
       C 180 20, 190 20, 200 10"
    stroke="black"
    fill="none"
    marker-start="url(#arrow)"
    marker-mid="url(#arrow)"
    marker-end="url(#arrow)" />
</svg>
```

{{EmbedLiveSample('Drawing_arrowheads', 200, 200)}}

### Vẽ các polymarker

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <!-- Định nghĩa marker mũi tên -->
    <marker
      id="arrow"
      viewBox="0 0 10 10"
      refX="5"
      refY="5"
      markerWidth="6"
      markerHeight="6"
      orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>

    <!-- Định nghĩa marker chấm -->
    <marker
      id="dot"
      viewBox="0 0 10 10"
      refX="5"
      refY="5"
      markerWidth="5"
      markerHeight="5">
      <circle cx="5" cy="5" r="5" fill="red" />
    </marker>
  </defs>

  <!-- Trục tọa độ với mũi tên ở cả hai hướng -->
  <polyline
    points="10,10 10,90 90,90"
    fill="none"
    stroke="black"
    marker-start="url(#arrow)"
    marker-end="url(#arrow)" />

  <!-- Đường dữ liệu với các polymarker -->
  <polyline
    points="15,80 29,50 43,60 57,30 71,40 85,15"
    fill="none"
    stroke="grey"
    marker-start="url(#dot)"
    marker-mid="url(#dot)"
    marker-end="url(#dot)" />
</svg>
```

{{EmbedLiveSample('Drawing_polymarkers', 200, 200)}}

### Dùng context fill và stroke

Ví dụ sau cho thấy cách dùng các giá trị `context-fill` và `context-stroke` để khiến marker dùng cùng fill và stroke với hình mà nó được gắn vào.

```html
<svg viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">
  <marker
    id="circle"
    markerWidth="6"
    markerHeight="6"
    refX="3"
    refY="3"
    markerUnits="strokeWidth">
    <circle cx="3" cy="3" r="2" stroke="context-stroke" fill="context-fill" />
  </marker>

  <style>
    path {
      marker: url("#circle");
    }
  </style>

  <path d="M 10,10 30,10 h 10" stroke="black" />
  <path d="M 10,20 30,20 h 10" stroke="blue" fill="red" />
  <path d="M 10,30 30,30 h 10" stroke="red" fill="none" />
  <path d="M 10,40 30,40 h 10" stroke="gray" fill="blue" stroke-width="1.5" />
</svg>
```

```css hidden
html,
body,
svg {
  height: 100%;
}
```

{{EmbedLiveSample('Using_context_fill_and_stroke', 200, 200)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính marker liên quan: {{SVGAttr("marker-start")}}, {{SVGAttr("marker-mid")}}, và {{SVGAttr("marker-end")}}
