---
title: "SVGTextContentElement: getComputedTextLength() method"
short-title: getComputedTextLength()
slug: Web/API/SVGTextContentElement/getComputedTextLength
page-type: web-api-instance-method
browser-compat: api.SVGTextContentElement.getComputedTextLength
---

{{APIRef("SVG")}}

Phương thức `getComputedTextLength()` của giao diện {{domxref("SVGTextContentElement")}} đại diện cho độ dài được tính toán của văn bản bên trong phần tử.

## Cú pháp

```js-nolint
getComputedTextLength()
```

### Tham số

Không có.

### Giá trị trả về

Một số thực.

## Ví dụ

### Tính toán độ dài văn bản

```html
<svg width="300" height="100">
  <text id="exampleText" x="10" y="50" font-size="16">Hello, SVG World!</text>
</svg>
```

```js
const textElement = document.getElementById("exampleText");

// Get the computed text length
const textLength = textElement.getComputedTextLength();

console.log(textLength); // Output: 124.5 (e.g. depends on font size and text content)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
