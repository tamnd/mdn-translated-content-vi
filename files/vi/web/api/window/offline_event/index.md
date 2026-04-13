---
title: "Window: sự kiện offline"
short-title: offline
slug: Web/API/Window/offline_event
page-type: web-api-event
browser-compat: api.Window.offline_event
---

{{APIRef}}

The **`offline`** event of the {{domxref("Window")}} interface is fired when the browser has lost access to the network and the value of {{domxref("Navigator.onLine")}} switches to `false`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("offline", (event) => { })

onoffline = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Event handler aliases

In addition to the `Window` interface, the event handler property `onoffline` is also available on the following targets:

- {{domxref("HTMLBodyElement")}}
- {{domxref("HTMLFrameSetElement")}}
- {{domxref("SVGSVGElement")}}

## Ví dụ

```js
// addEventListener version
window.addEventListener("offline", (event) => {
  console.log("The network connection has been lost.");
});

// onoffline version
window.onoffline = (event) => {
  console.log("The network connection has been lost.");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [`online`](/en-US/docs/Web/API/Window/online_event)
