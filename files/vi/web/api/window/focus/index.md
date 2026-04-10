---
title: "Window: phương thức focus()"
short-title: focus()
slug: Web/API/Window/focus
page-type: web-api-instance-method
browser-compat: api.Window.focus
---

{{APIRef}}

Makes a request to bring the window to the front. It may fail due to user settings and the window isn't guaranteed to be frontmost before this method returns.

## Cú pháp

```js-nolint
focus()
```

### Parameters

None.

### Return value

None ({{jsxref("undefined")}}).

## Ví dụ

```js
if (clicked) {
  window.focus();
}
```

## Specifications

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
