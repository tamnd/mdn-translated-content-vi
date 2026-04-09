---
title: zoomAndPan
slug: Web/SVG/Reference/Attribute/zoomAndPan
page-type: svg-attribute
status:
  - deprecated
browser-compat:
  - svg.elements.svg.zoomAndPan
  - svg.elements.view.zoomAndPan
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`zoomAndPan`** chỉ định liệu tài liệu SVG có thể được phóng to và kéo hay không.

Phóng to trong ngữ cảnh này nghĩa là hiệu ứng của một phép biến đổi scale và translate bổ sung trên mảnh tài liệu SVG ngoài cùng.

Kéo biểu thị một phép biến đổi tịnh tiến (tức là dịch chuyển) trên một mảnh tài liệu SVG để đáp ứng một hành động giao diện người dùng.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("svg")}}
- {{SVGElement("view")}}

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
  viewBox="0 0 200 200"
  xmlns="http://www.w3.org/2000/svg"
  zoomAndPan="disable">
  <filter id="diffuseLighting" x="0" y="0" width="100%" height="100%">
    <feDiffuseLighting in="SourceGraphic" zoomAndPan="1">
      <fePointLight x="60" y="60" z="20" />
    </feDiffuseLighting>
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#diffuseLighting)" />
</svg>
```

{{EmbedLiveSample("Example", "200", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>disable</code> | <code>magnify</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>magnify</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
