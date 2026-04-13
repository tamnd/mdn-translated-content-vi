---
title: "SVGElement: thuộc tính ownerSVGElement"
short-title: ownerSVGElement
slug: Web/API/SVGElement/ownerSVGElement
page-type: web-api-instance-property
browser-compat: api.SVGElement.ownerSVGElement
---

{{APIRef("SVG")}}

Thuộc tính **`ownerSVGElement`** của giao diện {{DOMxRef("SVGElement")}} phản ánh phần tử {{SVGElement("svg")}} tổ tiên gần nhất. `null` nếu phần tử đã cho là phần tử `<svg>` ngoài cùng.

## Giá trị

Một {{DOMxRef("SVGSVGElement")}}.

## Ví dụ

### Kiểm tra phần tử `<svg>` sở hữu

```html
<svg id="outerSvg" xmlns="http://www.w3.org/2000/svg">
  <g id="group1">
    <circle id="circle1" cx="50" cy="50" r="40" fill="blue" />
  </g>
</svg>
```

```js
const circle = document.getElementById("circle1");
const ownerSVG = circle.ownerSVGElement;

if (ownerSVG) {
  console.log(`The circle's owner <svg> has the ID: ${ownerSVG.id}`);
} else {
  console.log("This element is the outermost <svg>.");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
