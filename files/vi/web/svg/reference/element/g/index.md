---
title: <g>
slug: Web/SVG/Reference/Element/g
page-type: svg-element
browser-compat: svg.elements.g
sidebar: svgref
---

Phần tử [SVG](/en-US/docs/Web/SVG) **`<g>`** là một phần tử chứa dùng để nhóm các phần tử SVG khác.

Các phép biến đổi áp dụng cho phần tử `<g>` sẽ được thực hiện trên các phần tử con của nó, và các thuộc tính của nó được kế thừa bởi các phần tử con. Nó cũng có thể nhóm nhiều phần tử để sau này tham chiếu bằng phần tử {{SVGElement("use")}}.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

Phần tử này chỉ bao gồm các thuộc tính toàn cục.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGGElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Dùng g để kế thừa các thuộc tính trình bày -->
  <g fill="white" stroke="green" stroke-width="5">
    <circle cx="40" cy="40" r="25" />
    <circle cx="60" cy="60" r="25" />
  </g>
</svg>
```

{{EmbedLiveSample('Example', 100, '100%')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
