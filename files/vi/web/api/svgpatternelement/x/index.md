---
title: "SVGPatternElement: x property"
short-title: x
slug: Web/API/SVGPatternElement/x
page-type: web-api-instance-property
browser-compat: api.SVGPatternElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGPatternElement")}} mô tả tọa độ trục x của điểm bắt đầu của mẫu dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị được tính toán của thuộc tính {{SVGAttr("x")}} trên phần tử {{SVGElement("pattern")}}.

Giá trị thuộc tính có thể là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là tọa độ x của điểm bắt đầu của mẫu trong hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

Với SVG sau đây:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <!-- First pattern -->
    <pattern
      id="pattern1"
      x="50"
      width="20"
      height="20"
      patternUnits="userSpaceOnUse">
      <circle cx="10" cy="10" r="10" fill="blue" />
    </pattern>
    <!-- Second pattern -->
    <pattern
      id="pattern2"
      x="100"
      width="20"
      height="20"
      patternUnits="userSpaceOnUse">
      <circle cx="10" cy="10" r="10" fill="red" />
    </pattern>
  </defs>
  <!-- Using the patterns -->
  <rect x="0" y="0" width="100" height="100" fill="url(#pattern1)" />
  <rect x="100" y="0" width="100" height="100" fill="url(#pattern2)" />
</svg>
```

Chúng ta có thể truy cập các giá trị được tính toán của thuộc tính `x`:

```js
const patterns = document.querySelectorAll("pattern");

console.log(patterns[0].x.baseVal.value); // output: 50
console.log(patterns[1].x.baseVal.value); // output: 100
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGPatternElement.y")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
