---
title: "SVGStopElement: thuộc tính offset"
short-title: offset
slug: Web/API/SVGStopElement/offset
page-type: web-api-instance-property
browser-compat: api.SVGStopElement.offset
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`offset`** của giao diện {{domxref("SVGStopElement")}} phản ánh thuộc tính {{SVGAttr("offset")}} của phần tử {{SVGElement("stop")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `offset`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <defs>
    <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="yellow" stop-opacity="1" />
      <stop offset="100%" stop-color="red" stop-opacity="1" />
    </linearGradient>
  </defs>
  <rect width="100%" height="100%" fill="url(#grad1)" />
</svg>
```

```js
const stopElement = document.querySelector("stop");

// Access the offset property
console.log(stopElement.offset.baseVal); // Output: 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
