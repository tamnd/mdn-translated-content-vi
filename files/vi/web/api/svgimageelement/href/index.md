---
title: "SVGImageElement: href property"
short-title: href
slug: Web/API/SVGImageElement/href
page-type: web-api-instance-property
browser-compat: api.SVGImageElement.href
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`href`** của giao diện {{domxref("SVGImageElement")}} phản ánh thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}} của phần tử {{SVGElement("image")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

### Truy cập thuộc tính `href`

```js
// Get the SVG image element
const imageElement = document.querySelector("image");

// Access the href property
const href = imageElement.href.baseVal;

console.log(href); // Output: The href value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
