---
title: "Window: sự kiện rejectionhandled"
short-title: rejectionhandled
slug: Web/API/Window/rejectionhandled_event
page-type: web-api-event
browser-compat: api.Window.rejectionhandled_event
---

{{APIRef("HTML DOM")}}

The **`rejectionhandled`** event is sent to the script's global scope (usually {{domxref("window")}} but also {{domxref("Worker")}}) whenever a rejected JavaScript {{jsxref("Promise")}} is handled late, i.e., when a handler is attached to the promise after its rejection had caused an {{domxref("Window.unhandledrejection_event", "unhandledrejection")}} event.

This can be used in debugging and for general application resiliency, in tandem with the `unhandledrejection` event, which is sent when a promise is rejected but there is no handler for the rejection at the time.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("rejectionhandled", (event) => { })

onrejectionhandled = (event) => { }
```

## Kiểu sự kiện

A {{domxref("PromiseRejectionEvent")}}. Inherits from {{domxref("Event")}}.

{{InheritanceDiagram("PromiseRejectionEvent")}}

## Event properties

- {{domxref("PromiseRejectionEvent.promise")}} {{ReadOnlyInline}}
  - : The JavaScript {{jsxref("Promise")}} that was rejected.
- {{domxref("PromiseRejectionEvent.reason")}} {{ReadOnlyInline}}
  - : A value or {{jsxref("Object")}} indicating why the promise was rejected, as passed to {{jsxref("Promise.reject()")}}.

## Event handler aliases

In addition to the `Window` interface, the event handler property `onrejectionhandled` is also available on the following targets:

- {{domxref("HTMLBodyElement")}}
- {{domxref("HTMLFrameSetElement")}}
- {{domxref("SVGSVGElement")}}

## Ví dụ

You can use the `rejectionhandled` event to log promises that get rejected to the console, along with the reasons why they were rejected:

```js
window.addEventListener("rejectionhandled", (event) => {
  console.log(`Promise rejected; reason: ${event.reason}`);
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Promise rejection events](/en-US/docs/Web/JavaScript/Guide/Using_promises#promise_rejection_events)
- {{domxref("PromiseRejectionEvent")}}
- {{jsxref("Promise")}}
- {{domxref("Window/unhandledrejection_event", "unhandledrejection")}}
