---
title: "SVGElement: thuộc tính viewportElement"
short-title: viewportElement
slug: Web/API/SVGElement/viewportElement
page-type: web-api-instance-property
browser-compat: api.SVGElement.viewportElement
---

{{APIRef("SVG")}}

Thuộc tính **`viewportElement`** của giao diện {{DOMxRef("SVGElement")}} đại diện cho `SVGElement` đã thiết lập khung nhìn hiện tại. Thường là phần tử {{SVGElement("svg")}} tổ tiên gần nhất. `null` nếu phần tử đã cho là phần tử `<svg>` ngoài cùng.

## Giá trị

Một {{DOMxRef("SVGElement")}}.

## Ví dụ

### Lấy `viewportElement`

```html
<svg id="outerSvg" width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <svg id="innerSvg" x="10" y="10" width="100" height="100">
    <circle id="circle" cx="50" cy="50" r="40" fill="blue"></circle>
  </svg>
</svg>
```

```js
const circle = document.getElementById("circle");
const innerSvg = document.getElementById("innerSvg");
const outerSvg = document.getElementById("outerSvg");

console.log(circle.viewportElement); // Output: <svg id="innerSvg">...</svg>
console.log(innerSvg.viewportElement); // Output: <svg id="outerSvg">...</svg>
console.log(outerSvg.viewportElement); // Output: null
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGElement.ownerSVGElement")}}: Lấy phần tử `<svg>` tổ tiên gần nhất cho phần tử SVG hiện tại.
