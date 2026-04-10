---
title: "Window: sự kiện afterprint"
short-title: afterprint
slug: Web/API/Window/afterprint_event
page-type: web-api-event
browser-compat: api.Window.afterprint_event
---

{{APIRef}}

The **`afterprint`** event is fired after the associated document has started printing or the print preview has been closed.

The {{domxref("Window.beforeprint_event", "beforeprint")}} and `afterprint` events allow pages to change their content before printing starts (perhaps to remove a banner, for example) and then revert those changes after printing has completed. In general, you should prefer the use of a [`@media print`](/en-US/docs/Web/CSS/Guides/Media_queries/Using#targeting_media_types) CSS at-rule, but it may be necessary to use these events in some cases.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("afterprint", (event) => { })

onafterprint = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Sử dụng `addEventListener()`:

```js
window.addEventListener("afterprint", (event) => {
  console.log("After print");
});
```

Using the `onafterprint` event handler property:

```js
window.onafterprint = (event) => {
  console.log("After print");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- Related events: {{domxref("Window/beforeprint_event", "beforeprint")}}
