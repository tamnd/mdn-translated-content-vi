---
title: <svg>
slug: Web/SVG/Reference/Element/svg
page-type: svg-element
browser-compat: svg.elements.svg
sidebar: svgref
---

**`<svg>`** [SVG](/en-US/docs/Web/SVG) là một phần tử chứa, định nghĩa một hệ tọa độ mới và [viewport](/en-US/docs/Web/SVG/Reference/Attribute/viewBox). Nó được dùng làm phần tử ngoài cùng của tài liệu SVG, nhưng cũng có thể dùng để nhúng một fragment SVG bên trong tài liệu SVG hoặc HTML.

Phần tử này dùng để tạo các tài liệu SVG _mới_. Nếu bạn đã có một tài liệu SVG hiện có và muốn nhúng nó vào tài liệu khác qua URL, hãy dùng {{HTMLElement("img")}}, {{HTMLElement("object")}} hoặc {{SVGElement("image")}}.

> [!NOTE]
> Thuộc tính `xmlns` chỉ cần thiết trên phần tử `svg` ngoài cùng của _tài liệu SVG_, hoặc bên trong tài liệu HTML có XML serialization. Nó không cần thiết cho các phần tử `svg` bên trong hoặc bên trong tài liệu HTML dùng HTML serialization.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("baseProfile")}} {{deprecated_inline}}
  - : Hồ sơ ngôn ngữ SVG tối thiểu mà tài liệu yêu cầu.
    _Kiểu giá trị_: **\<string>**; _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("height")}}
  - : Chiều cao hiển thị của viewport hình chữ nhật. (Không phải chiều cao của hệ tọa độ của nó.)
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("preserveAspectRatio")}}
  - : Cách fragment `svg` phải bị biến dạng nếu nó được hiển thị với {{glossary("aspect ratio")}} khác.
    _Kiểu giá trị_: (`none` | `xMinYMin` | `xMidYMin` | `xMaxYMin` | `xMinYMid` | `xMidYMid` | `xMaxYMid` | `xMinYMax` | `xMidYMax` | `xMaxYMax`) (`meet` | `slice`)?; _Giá trị mặc định_: `xMidYMid meet`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("version")}} {{deprecated_inline}}
  - : Phiên bản SVG nào được dùng cho nội dung bên trong của phần tử.
    _Kiểu giá trị_: **[\<number>](/en-US/docs/Web/SVG/Guides/Content_type#number)**; _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("viewBox")}}
  - : Tọa độ viewport SVG cho fragment SVG hiện tại.
    _Kiểu giá trị_: **[\<list-of-numbers>](/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts)**; _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("width")}}
  - : Chiều rộng hiển thị của viewport hình chữ nhật. (Không phải chiều rộng của hệ tọa độ của nó.)
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("x")}}
  - : Tọa độ x hiển thị của khối chứa svg. Không có tác dụng với phần tử `svg` ngoài cùng.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("y")}}
  - : Tọa độ y hiển thị của khối chứa svg. Không có tác dụng với phần tử `svg` ngoài cùng.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**

> [!NOTE]
> Từ SVG2, `x`, `y`, `width` và `height` là _Geometry Properties_, nghĩa là các thuộc tính này cũng có thể được dùng như thuộc tính CSS.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGSVGElement")}}.

## Ví dụ

### Phần tử `svg` lồng nhau

Ví dụ này cho thấy rằng các phần tử `svg` lồng nhau không cần thuộc tính `xmlns`.

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg
  viewBox="0 0 300 100"
  xmlns="http://www.w3.org/2000/svg"
  stroke="red"
  fill="grey">
  <circle cx="50" cy="50" r="40" />
  <circle cx="150" cy="50" r="4" />

  <svg viewBox="0 0 10 10" x="200" width="100">
    <circle cx="5" cy="5" r="4" />
  </svg>
</svg>
```

{{EmbedLiveSample('nested_svg-elements', 300, 100)}}

### Sử dụng đơn vị viewport động

Trong ví dụ này, các thuộc tính `height` và `width` trên phần tử `svg` được đặt bằng giá trị viewport động `60vmin`, tương đương 60% chiều rộng hoặc chiều cao của viewport, tùy giá trị nào nhỏ hơn.

```html hidden
<div class="resizer">
  <iframe
    class="resized"
    srcdoc='
```

```html
<svg
  viewBox="0 0 400 400"
  xmlns="http://www.w3.org/2000/svg"
  height="60vmin"
  width="60vmin">
  <rect x="0" y="0" width="50%" height="50%" fill="tomato" opacity="0.75" />
  <rect
    x="25%"
    y="25%"
    width="50%"
    height="50%"
    fill="slategrey"
    opacity="0.75" />
  <rect x="50%" y="50%" width="50%" height="50%" fill="olive" opacity="0.75" />
  <rect
    x="0"
    y="0"
    width="100%"
    height="100%"
    stroke="cadetblue"
    stroke-width="0.5%"
    fill="none" />
</svg>
```

```html hidden
  '></iframe>
</div>
```

```css hidden
.resizer {
  display: flex;
  margin: 1rem;
  padding: 0;
  resize: both;
  overflow: hidden;
  border: 5px dotted red;
  height: 400px;
}
.resizer > .resized {
  flex-grow: 1;
  margin: 0;
  padding: 0;
  border: 0;
}
```

{{EmbedLiveSample('using_dynamic_viewport_lengths', '100%', 500)}}

Để thay đổi kích thước của iframe, hãy thử kéo thay đổi đường viền chấm đỏ từ góc dưới bên phải.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
