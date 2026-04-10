---
title: "ShadowRoot: thuộc tính serializable"
short-title: serializable
slug: Web/API/ShadowRoot/serializable
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.serializable
---

{{APIRef("Shadow DOM")}}

Thuộc tính chỉ đọc **`serializable`** của giao diện {{domxref("ShadowRoot")}} trả về `true` nếu shadow root có thể tuần tự hóa.

Nếu được đặt, shadow root có thể được tuần tự hóa bằng cách gọi các phương thức {{DOMxRef('Element.getHTML()')}} hoặc {{DOMxRef('ShadowRoot.getHTML()')}} với tham số `options.serializableShadowRoots` được đặt thành `true`.

Thuộc tính serializable của một shadow root được chỉ định khi shadow root được tạo, hoặc theo kiểu khai báo bằng cách thêm thuộc tính [`shadowrootserializable`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootserializable) trên phần tử `<template>` (kèm một giá trị [`shadowrootmode`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootmode) hợp lệ), hoặc bằng cách đặt tham số [`options.serializable`](/en-US/docs/Web/API/Element/attachShadow#serializable) thành `true` khi dùng [`Element.attachShadow()`](/en-US/docs/Web/API/Element/attachShadow).

## Giá trị

`true` nếu shadow root có thể tuần tự hóa; `false` nếu không.

## Ví dụ

```js
const customElem = document.querySelector("my-shadow-dom-element");
const shadow = customElem.shadowRoot;

// …

// Nó có thể tuần tự hóa không?
const hostElem = shadow.serializable;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
