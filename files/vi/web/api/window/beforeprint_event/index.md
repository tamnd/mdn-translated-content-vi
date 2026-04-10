---
title: "Window: sự kiện beforeprint"
short-title: beforeprint
slug: Web/API/Window/beforeprint_event
page-type: web-api-event
browser-compat: api.Window.beforeprint_event
---

{{APIRef}}

The **`beforeprint`** event is fired when the associated document is about to be printed or previewed for printing.

The {{domxref("Window.afterprint_event", "afterprint")}} and `beforeprint` events allow pages to change their content before printing starts (perhaps to remove a banner, for example) and then revert those changes after printing has completed. In general, you should prefer the use of a [`@media print`](/en-US/docs/Web/CSS/Guides/Media_queries/Using#targeting_media_types) CSS at-rule, but it may be necessary to use these events in some cases.

## Cú pháp

Use the event name in methods like {{domxref("EventTarget.addEventListener", "addEventListener()")}}, or set an event handler property.

```js-nolint
addEventListener("beforeprint", (event) => { })

onbeforeprint = (event) => { }
```

## Kiểu sự kiện

A generic {{domxref("Event")}}.

## Ví dụ

Using `addEventListener()`:

```js
window.addEventListener("beforeprint", (event) => {
  console.log("Before print");
});
```

Using the `onbeforeprint` event handler property:

```js
window.onbeforeprint = (event) => {
  console.log("Before print");
};
```

## Specifications

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- Related events: {{domxref("Window/afterprint_event", "afterprint")}}
