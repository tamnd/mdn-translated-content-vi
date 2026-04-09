---
title: <view>
slug: Web/SVG/Reference/Element/view
page-type: svg-element
browser-compat: svg.elements.view
sidebar: svgref
---

Phần tử [SVG](/en-US/docs/Web/SVG) **`<view>`** xác định một chế độ xem cụ thể của một tài liệu SVG. Một chế độ xem cụ thể có thể được hiển thị bằng cách tham chiếu [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử `<view>` làm mảnh đích của một URL.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("preserveAspectRatio")}}
  - : Thuộc tính này xác định cách mảnh SVG phải bị biến dạng nếu nó được nhúng trong một vùng chứa có {{glossary("aspect ratio", "tỉ lệ khung hình")}} khác.
    _Kiểu giá trị_: (`none` | `xMinYMin` | `xMidYMin` | `xMaxYMin` | `xMinYMid` | `xMidYMid` | `xMaxYMid` | `xMinYMax` | `xMidYMax` | `xMaxYMax`) (`meet` | `slice`)?; _Giá trị mặc định_: `xMidYMid meet`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("viewBox")}}
  - : Thuộc tính này xác định ranh giới của viewport SVG cho mảnh mẫu.
    _Kiểu giá trị_: **[\<list-of-numbers>](/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts)**; _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("zoomAndPan")}} {{Deprecated_Inline}}
  - : Thuộc tính này chỉ định liệu tài liệu SVG có thể được phóng to và kéo hay không.
    _Kiểu giá trị_: **disable | magnify**; _Giá trị mặc định_: magnify; _Có thể hoạt ảnh_: **không**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGViewElement")}}.

## Ví dụ

### SVG

```svg
<svg viewBox="0 0 300 100" width="300" height="100"
      xmlns="http://www.w3.org/2000/svg">

  <view id="one" viewBox="0 0 100 100" />
  <circle cx="50" cy="50" r="40" fill="red" />

  <view id="two" viewBox="100 0 100 100" />
  <circle cx="150" cy="50" r="40" fill="green" />

  <view id="three" viewBox="200 0 100 100" />
  <circle cx="250" cy="50" r="40" fill="blue" />
</svg>
```

### HTML

```html
<img src="example.svg" alt="three circles" width="300" height="100" />
<br />
<img src="example.svg#three" alt="blue circle" width="100" height="100" />
```

### Kết quả

{{EmbedLiveSample("Example", "85ch", "240px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
