---
title: "Window: phương thức sizeToContent()"
short-title: sizeToContent()
slug: Web/API/Window/sizeToContent
page-type: web-api-instance-method
status:
  - non-standard
browser-compat: api.Window.sizeToContent
---

{{APIRef}}{{Non-standard_Header}}

The **`Window.sizeToContent()`** method sizes the window
according to its content. In order for it to work, the DOM content should be loaded when
this function is called—for example, once the {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}} event has
been thrown.

Since Firefox 20, the minimal size of the window is clamped to prevent the window from
being too small for the user to interact with.

## Cú pháp

```js-nolint
sizeToContent()
```

### Parameters

None.

### Return value

None ({{jsxref("undefined")}}).

## Ví dụ

```js
window.sizeToContent();
```

## Specifications

This feature is not part of any specification.

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Window")}}
