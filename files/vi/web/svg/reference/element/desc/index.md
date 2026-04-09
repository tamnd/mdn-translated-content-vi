---
title: <desc>
slug: Web/SVG/Reference/Element/desc
page-type: svg-element
browser-compat: svg.elements.desc
sidebar: svgref
---

Phần tử **`<desc>`** của [SVG](/en-US/docs/Web/SVG) cung cấp một mô tả văn bản dài, có thể truy cập được, cho bất kỳ [phần tử vùng chứa](/en-US/docs/Web/SVG/Reference/Element#container_elements) hoặc [phần tử đồ họa](/en-US/docs/Web/SVG/Reference/Element#graphics_elements) SVG nào.

Văn bản trong phần tử `<desc>` không được hiển thị như một phần của đồ họa. Nếu phần tử có thể được mô tả bằng văn bản hiển thị, có thể tham chiếu văn bản đó bằng thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby). Nếu dùng `aria-describedby`, nó sẽ được ưu tiên hơn `<desc>`.

Văn bản ẩn của một phần tử `<desc>` cũng có thể được ghép nối với văn bản hiển thị của các phần tử khác bằng cách dùng nhiều ID trong một giá trị `aria-describedby`. Trong trường hợp đó, phần tử `<desc>` phải cung cấp một ID để tham chiếu.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

Phần tử này chỉ bao gồm các thuộc tính toàn cục.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGDescElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 10 10" xmlns="http://www.w3.org/2000/svg">
  <circle cx="5" cy="5" r="4">
    <desc>
      Tôi là một hình tròn và mô tả đó ở đây để cho thấy cách tôi có thể được mô
      tả, nhưng liệu có thật sự cần thiết phải mô tả một hình tròn đơn giản như
      tôi không?
    </desc>
  </circle>
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("title")}}
