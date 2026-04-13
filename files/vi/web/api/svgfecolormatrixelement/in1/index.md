---
title: "SVGFEColorMatrixElement: in1 property"
short-title: in1
slug: Web/API/SVGFEColorMatrixElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFEColorMatrixElement.in1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in1`** của giao diện {{domxref("SVGFEColorMatrixElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

Trong ví dụ này, hai phần tử {{SVGElement("feColorMatrix")}} được định nghĩa trong một filter, mỗi phần tử có thuộc tính `in` khác nhau.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="color-matrix-filter">
    <feColorMatrix
      in="SourceGraphic"
      type="matrix"
      values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0" />
    <feColorMatrix
      in="BackgroundImage"
      type="matrix"
      values="0.5 0 0 0 0 0 0.5 0 0 0 0 0 0.5 0 0 0 0 0 1 0" />
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

Chúng ta có thể truy cập thuộc tính `in`:

```js
const colorMatrices = document.querySelectorAll("feColorMatrix");

console.log(colorMatrices[0].in1.baseVal); // Output: "SourceGraphic"
console.log(colorMatrices[1].in1.baseVal); // Output: "BackgroundImage"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
