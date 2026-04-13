---
title: "SVGPatternElement: href property"
short-title: href
slug: Web/API/SVGPatternElement/href
page-type: web-api-instance-property
browser-compat: api.SVGPatternElement.href
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`href`** của giao diện {{domxref("SVGPatternElement")}} phản ánh thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}} của phần tử đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

Ví dụ dưới đây minh họa cách thuộc tính href trong phần tử {{SVGElement("pattern")}} tham chiếu đến một mẫu khác (`#basePattern`) để áp dụng thiết kế của nó cho một hình chữ nhật.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <!-- First pattern definition -->
    <pattern
      id="basePattern"
      width="20"
      height="20"
      patternUnits="userSpaceOnUse">
      <circle cx="10" cy="10" r="10" fill="blue" />
    </pattern>
    <!-- Second pattern referencing the first -->
    <pattern id="pattern1" href="#basePattern" />
  </defs>
  <rect x="50" y="50" width="100" height="100" fill="url(#pattern1)" />
</svg>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
