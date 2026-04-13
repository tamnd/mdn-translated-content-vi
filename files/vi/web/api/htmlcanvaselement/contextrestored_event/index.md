---
title: "HTMLCanvasElement: contextrestored event"
short-title: contextrestored
slug: Web/API/HTMLCanvasElement/contextrestored_event
page-type: web-api-event
browser-compat: api.HTMLCanvasElement.contextrestored_event
---

{{APIRef("Canvas API")}}

Sự kiện **`contextrestored`** của [Canvas API](/en-US/docs/Web/API/Canvas_API) được phát ra nếu user agent khôi phục bộ nhớ nền cho một context [`CanvasRenderingContext2D`](/en-US/docs/Web/API/CanvasRenderingContext2D).

Sau khi nhận sự kiện này, bạn có thể vẽ lại, lấy lại tài nguyên và khởi tạo lại trạng thái context.

## Cú pháp

```js-nolint
addEventListener("contextrestored", (event) => { })

oncontextrestored = (event) => { }
```
