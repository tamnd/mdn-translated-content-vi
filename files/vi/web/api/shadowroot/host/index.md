---
title: "ShadowRoot: thuộc tính host"
short-title: host
slug: Web/API/ShadowRoot/host
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.host
---

{{APIRef("Shadow DOM")}}

Thuộc tính chỉ đọc **`host`** của {{domxref("ShadowRoot")}} trả về tham chiếu đến phần tử DOM mà `ShadowRoot` được gắn vào.

## Giá trị

Một {{domxref('Element')}} DOM.

## Ví dụ

```js
const customElem = document.querySelector("my-shadow-dom-element");
const shadow = customElem.shadowRoot;

// …

// trả về phần tử host gốc sau một thời gian
const hostElem = shadow.host;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part) và [`exportparts`](/en-US/docs/Web/HTML/Reference/Global_attributes/exportparts)
- Các phần tử HTML {{HTMLelement("template")}} và {{HTMLElement("slot")}}
- Các pseudo-class CSS {{CSSXref(":host")}}, {{cssxref(":host()")}}, và {{cssxref(":host-context()")}}
- Các pseudo-element CSS {{CSSXref("::part")}} và {{CSSXref("::slotted")}}
