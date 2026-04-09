---
title: <title> - phần tử đặt tên có thể truy cập của SVG
slug: Web/SVG/Reference/Element/title
page-type: svg-element
browser-compat: svg.elements.title
sidebar: svgref
---

Phần tử [SVG](/en-US/docs/Web/SVG) **`<title>`** cung cấp một mô tả ngắn gọn, có thể truy cập cho bất kỳ [phần tử vùng chứa](/en-US/docs/Web/SVG/Reference/Element#container_elements) SVG nào hoặc [phần tử đồ họa](/en-US/docs/Web/SVG/Reference/Element#graphics_elements).

Văn bản trong phần tử `<title>` không được hiển thị như một phần của đồ họa, nhưng trình duyệt thường hiển thị nó dưới dạng chú giải công cụ. Nếu một phần tử có thể được mô tả bằng văn bản hiển thị, nên tham chiếu văn bản đó bằng thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) thay vì dùng phần tử `<title>`.

> [!NOTE]
> Để tương thích ngược với SVG 1.1, phần tử `<title>` nên là phần tử con đầu tiên của phần tử cha.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

Phần tử này chỉ bao gồm các thuộc tính toàn cục.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGTitleElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 20 10" xmlns="http://www.w3.org/2000/svg">
  <circle cx="5" cy="5" r="4">
    <title>Tôi là một hình tròn</title>
  </circle>

  <rect x="11" y="1" width="8" height="8">
    <title>Tôi là một hình vuông</title>
  </rect>
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("desc")}}
