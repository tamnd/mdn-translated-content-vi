---
title: "HTMLCanvasElement: contextlost event"
short-title: contextlost
slug: Web/API/HTMLCanvasElement/contextlost_event
page-type: web-api-event
browser-compat: api.HTMLCanvasElement.contextlost_event
---

{{APIRef("Canvas API")}}

Sự kiện **`contextlost`** của [Canvas API](/en-US/docs/Web/API/Canvas_API) được phát ra nếu user agent phát hiện bộ nhớ nền gắn với context [`CanvasRenderingContext2D`](/en-US/docs/Web/API/CanvasRenderingContext2D) bị mất. Context có thể bị mất vì nhiều lý do như lỗi driver hoặc ứng dụng hết bộ nhớ.

Theo mặc định, user agent sẽ cố khôi phục context rồi phát ra sự kiện [`contextrestored`](/en-US/docs/Web/API/HTMLCanvasElement/contextrestored_event). Mã người dùng có thể ngăn việc khôi phục bằng cách gọi [`Event.preventDefault()`](/en-US/docs/Web/API/Event/preventDefault) trong lúc xử lý sự kiện.

## Cú pháp

```js-nolint
addEventListener("contextlost", (event) => { })

oncontextlost = (event) => { }
```
