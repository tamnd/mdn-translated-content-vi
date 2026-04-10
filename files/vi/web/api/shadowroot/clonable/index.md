---
title: "ShadowRoot: thuộc tính clonable"
short-title: clonable
slug: Web/API/ShadowRoot/clonable
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.clonable
---

{{APIRef("Shadow DOM")}}

Thuộc tính chỉ đọc **`clonable`** của giao diện {{domxref("ShadowRoot")}} trả về `true` nếu shadow root có thể sao chép, và `false` nếu không.

Khi giá trị là `true`, một shadow host được sao chép bằng {{domxref("Node.cloneNode()")}} hoặc {{domxref("Document.importNode()")}} sẽ bao gồm bản sao của shadow root.

Theo mặc định, giá trị này là `false`. Nó có thể được đặt thành `true` bằng tùy chọn `clonable` của phương thức {{domxref("Element.attachShadow()")}} hoặc bằng cách đặt thuộc tính [`shadowrootclonable`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootclonable) của phần tử `<template>` đang được dùng để gắn shadow root theo kiểu khai báo.

## Giá trị

`true` nếu shadow root có thể sao chép; `false` nếu không.

## Ví dụ

```js
const host = document.createElement("div");
const shadowRoot = host.attachShadow({
  mode: "open",
  clonable: true,
});

shadowRoot.clonable;
// true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
