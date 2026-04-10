---
title: "Window: thuộc tính navigation"
short-title: navigation
slug: Web/API/Window/navigation
page-type: web-api-instance-property
browser-compat: api.Window.navigation
---

{{APIRef("Navigation API")}}

The **`navigation`** read-only property of the {{domxref("Window")}} interface returns the current `window`'s associated {{domxref("Navigation")}} object.

This is the entry point for the {{domxref("Navigation API", "", "", "nocode")}}.

## Giá trị

A {{domxref("Navigation")}} object instance.

## Ví dụ

```js
let currentNavEntries = window.navigation.entries();
```

## Specifications

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
- [Navigation API live demo](https://mdn.github.io/dom-examples/navigation-api/) ([view demo source](https://github.com/mdn/dom-examples/tree/main/navigation-api))
