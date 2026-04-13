---
title: "CSSPseudoElement: thuộc tính element"
short-title: element
slug: Web/API/CSSPseudoElement/element
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CSSPseudoElement.element
---

{{APIRef}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`element`** của giao diện {{DOMxRef('CSSPseudoElement')}} trả về tham chiếu đến phần tử gốc của pseudo-element, nói cách khác là phần tử cha của nó.

## Giá trị

Một {{DOMxRef('Element')}} biểu thị phần tử gốc của pseudo-element.

## Ví dụ

Ví dụ dưới đây minh họa mối quan hệ giữa `CSSPseudoElement.element` và {{DOMxRef('Element.pseudo()')}}:

```js
const myElement = document.querySelector("q");
const cssPseudoElement = myElement.pseudo("::after");
const originatingElement = cssPseudoElement.element;

console.log(myElement === originatingElement); // Outputs true
console.log(myElement.parentElement === originatingElement); // Outputs false
console.log(myElement.lastElementChild === cssPseudoElement); // Outputs false
console.log(myElement.lastChild === cssPseudoElement); // Outputs false
console.log(myElement.nextElementSibling === cssPseudoElement); // Outputs false
console.log(myElement.nextSibling === cssPseudoElement); // Outputs false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef('Element.pseudo()')}}
