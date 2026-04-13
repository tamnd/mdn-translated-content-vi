---
title: "CSSPseudoElement: thuộc tính type"
short-title: type
slug: Web/API/CSSPseudoElement/type
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CSSPseudoElement.type
---

{{APIRef}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`type`** của giao diện {{DOMxRef('CSSPseudoElement')}} trả về loại pseudo-element dưới dạng chuỗi, được biểu thị dưới dạng [bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Pseudo-elements#selectors).

## Giá trị

Một chuỗi chứa một trong các giá trị sau:

- {{CSSxRef('::before', '"::before"')}}
- {{CSSxRef('::after', '"::after"')}}
- {{CSSxRef('::marker', '"::marker"')}}

## Ví dụ

Ví dụ dưới đây minh họa mối quan hệ giữa `CSSPseudoElement.type` và {{DOMxRef('Element.pseudo()')}}:

```js
const myElement = document.querySelector("q");
const mySelector = "::after";
const cssPseudoElement = myElement.pseudo(mySelector);
const typeOfPseudoElement = cssPseudoElement.type;

console.log(mySelector === typeOfPseudoElement); // Outputs true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef('Element.pseudo()')}}
- [Danh sách pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#alphabetical_index)
