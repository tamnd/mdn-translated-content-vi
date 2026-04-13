---
title: "Window: thuộc tính origin"
short-title: origin
slug: Web/API/Window/origin
page-type: web-api-instance-property
browser-compat: api.origin
---

{{APIRef("DOM")}}

The **`origin`** read-only property of the {{domxref("Window")}} interface returns the origin of the global scope, serialized as a string.

## Giá trị

A string.

## Ví dụ

Executed from inside window scope, the following snippet will log the document's global scope's origin to the console.

```js
console.log(window.origin); // On this page returns 'https://developer.mozilla.org'
```

If the origin is not a scheme/host/port tuple (say you are trying to run it locally, i.e., via `file://` URL), `origin` will return the string `"null"`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [`WorkerGlobalScope.origin`](/en-US/docs/Web/API/WorkerGlobalScope/origin)
- {{Glossary("origin")}} glossary term
