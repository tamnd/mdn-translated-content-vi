---
title: "SVGPatternElement: height property"
short-title: height
slug: Web/API/SVGPatternElement/height
page-type: web-api-instance-property
browser-compat: api.SVGPatternElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGPatternElement")}} mô tả chiều cao của mẫu dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị được tính toán của thuộc tính {{SVGAttr("height")}} trên phần tử {{SVGElement("pattern")}}.

Giá trị thuộc tính có thể là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} đại diện cho chiều cao của mẫu trong hệ tọa độ người dùng.

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
      height="20"
      width="20"
      patternUnits="userSpaceOnUse">
      <circle cx="10" cy="10" r="10" fill="blue" />
    </pattern>
    <!-- Second pattern -->
    <pattern
      id="pattern2"
      x="100"
      height="40"
      width="20"
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

console.log(patterns[0].height.baseVal.value); // output: 20
console.log(patterns[1].height.baseVal.value); // output: 40
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGPatternElement.width")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
