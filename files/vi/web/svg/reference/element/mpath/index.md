---
title: <mpath>
slug: Web/SVG/Reference/Element/mpath
page-type: svg-element
browser-compat: svg.elements.mpath
sidebar: svgref
---

Phần tử con **`<mpath>`** của [SVG](/en-US/docs/Web/SVG) dành cho phần tử {{SVGElement("animateMotion")}} cung cấp khả năng tham chiếu tới một phần tử {{SVGElement("path")}} bên ngoài như là định nghĩa của một motion path.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("xlink:href")}} {{deprecated_inline}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGMPathElement")}}.

## Ví dụ

### SVG

```html
<svg
  width="100%"
  height="100%"
  viewBox="0 0 500 300"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <rect
    x="1"
    y="1"
    width="498"
    height="298"
    fill="none"
    stroke="blue"
    stroke-width="2" />

  <!-- Vẽ đường viền của motion path bằng màu xanh lam, cùng
          với ba hình tròn nhỏ ở đầu, giữa và cuối. -->
  <path
    id="path1"
    d="M100,250 C 100,50 400,50 400,250"
    fill="none"
    stroke="blue"
    stroke-width="7.06" />
  <circle cx="100" cy="250" r="17.64" fill="blue" />
  <circle cx="250" cy="100" r="17.64" fill="blue" />
  <circle cx="400" cy="250" r="17.64" fill="blue" />

  <!-- Đây là một tam giác sẽ di chuyển dọc theo motion path.
       Nó được định nghĩa với hướng thẳng đứng, với đáy của
       tam giác được căn giữa theo chiều ngang ngay phía trên gốc tọa độ. -->
  <path
    d="M-25,-12.5 L25,-12.5 L 0,-87.5 z"
    fill="yellow"
    stroke="red"
    stroke-width="7.06">
    <!-- Định nghĩa hoạt ảnh motion path -->
    <animateMotion dur="6s" repeatCount="indefinite" rotate="auto">
      <mpath href="#path1" />
    </animateMotion>
  </path>
</svg>
```

### Kết quả

{{EmbedLiveSample("Example", 250, 400)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("animateMotion")}}
