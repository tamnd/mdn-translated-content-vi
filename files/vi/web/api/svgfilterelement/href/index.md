---
title: "SVGFilterElement: href property"
short-title: href
slug: Web/API/SVGFilterElement/href
page-type: web-api-instance-property
browser-compat: api.SVGFilterElement.href
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`href`** của giao diện {{domxref("SVGFilterElement")}} phản ánh thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}} của phần tử {{SVGElement("filter")}} đã cho.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

### Truy cập thuộc tính `href`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <defs>
    <filter id="myFilter" x="0" y="0" width="200%" height="200%">
      <feGaussianBlur in="SourceGraphic" stdDeviation="15" result="blurred" />
    </filter>
  </defs>
  <rect
    width="200"
    height="200"
    stroke="green"
    stroke-width="10"
    fill="lime"
    filter="url(#myFilter)" />
</svg>
```

```js
const filterElement = document.querySelector("filter");

// Access the href property
console.log(filterElement.href.baseVal); // Output: "#myFilter"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- SVG {{SVGAttr("href")}} attribute
