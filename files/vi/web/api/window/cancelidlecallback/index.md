---
title: "Window: phương thức cancelIdleCallback()"
short-title: cancelIdleCallback()
slug: Web/API/Window/cancelIdleCallback
page-type: web-api-instance-method
browser-compat: api.Window.cancelIdleCallback
---

{{APIRef}}

The **`window.cancelIdleCallback()`** method cancels a callback
previously scheduled with {{domxref("window.requestIdleCallback()")}}.

## Cú pháp

```js-nolint
cancelIdleCallback(handle)
```

### Parameters

- `handle`
  - : The ID value returned by {{domxref("window.requestIdleCallback()")}} when the
    callback was established.

### Return value

None ({{jsxref("undefined")}}).

## Ví dụ

See our [complete example](/en-US/docs/Web/API/Background_Tasks_API#example)
in the article [Cooperative Scheduling of Background Tasks API](/en-US/docs/Web/API/Background_Tasks_API).

## Specifications

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
