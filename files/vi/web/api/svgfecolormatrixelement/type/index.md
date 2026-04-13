---
title: "SVGFEColorMatrixElement: type property"
short-title: type
slug: Web/API/SVGFEColorMatrixElement/type
page-type: web-api-instance-property
browser-compat: api.SVGFEColorMatrixElement.type
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("SVGFEColorMatrixElement")}} phản ánh thuộc tính {{SVGAttr("type")}} của phần tử đã cho. Nhận một trong các hằng số `SVG_FECOLORMATRIX_TYPE_*` được định nghĩa trên giao diện này.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}.

## Ví dụ

### Truy cập thuộc tính `type`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="color-matrix-filter">
    <feColorMatrix
      type="matrix"
      values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0" />
    <feColorMatrix type="saturate" values="0.5" />
  </filter>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="red"
    filter="url(#color-matrix-filter)" />
  <circle
    cx="100"
    cy="100"
    r="50"
    fill="blue"
    filter="url(#color-matrix-filter)" />
</svg>
```

```js
const colorMatrices = document.querySelectorAll("feColorMatrix");

console.log(colorMatrices[0].type.baseVal); // Output: 1 (SVG_FECOLORMATRIX_TYPE_MATRIX)
console.log(colorMatrices[1].type.baseVal); // Output: 2 (SVG_FECOLORMATRIX_TYPE_SATURATE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
