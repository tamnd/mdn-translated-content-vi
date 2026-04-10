---
title: "Window: scrollByPages() method"
short-title: scrollByPages()
slug: Web/API/Window/scrollByPages
page-type: web-api-instance-method
status:
  - non-standard
browser-compat: api.Window.scrollByPages
---

{{APIRef}} {{Non-standard_header}}

The **`Window.scrollByPages()`** method scrolls the current
document by the specified number of pages.

## Cú pháp

```js-nolint
scrollByPages(pages)
```

### Parameters

- `pages`
  - : The number of pages to scroll. It may be a positive or
    negative integer.

### Return value

None ({{jsxref("undefined")}}).

## Ví dụ

```js
// scroll down the document by 1 page
window.scrollByPages(1);

// scroll up the document by 1 page
window.scrollByPages(-1);
```

## Đặc tả kỹ thuật

DOM Level 0. Not part of specification.

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("window.scroll()")}}
- {{domxref("window.scrollBy()")}}
- {{domxref("window.scrollByLines()")}}
- {{domxref("window.scrollTo()")}}
