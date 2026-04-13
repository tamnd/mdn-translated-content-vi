---
title: "SVGFEColorMatrixElement: values property"
short-title: values
slug: Web/API/SVGFEColorMatrixElement/values
page-type: web-api-instance-property
browser-compat: api.SVGFEColorMatrixElement.values
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`values`** của giao diện {{domxref("SVGFEColorMatrixElement")}} phản ánh thuộc tính {{SVGAttr("values")}} của phần tử đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumberList")}}.

## Ví dụ

### Truy cập thuộc tính `values`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="color-matrix-filter">
    <feColorMatrix
      type="matrix"
      values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0" />
  </filter>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="red"
    filter="url(#color-matrix-filter)" />
</svg>
```

```js
const colorMatrix = document.querySelector("feColorMatrix");

console.dir(colorMatrix.values.baseVal); // Output: SVGAnimatedNumberList object
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
