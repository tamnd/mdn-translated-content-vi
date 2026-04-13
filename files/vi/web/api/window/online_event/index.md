---
title: "Window: sự kiện online"
short-title: online
slug: Web/API/Window/online_event
page-type: web-api-event
browser-compat: api.Window.online_event
---

{{APIRef}}

The **`online`** event of the {{domxref("Window")}} interface is fired when the browser has gained access to the network and the value of {{domxref("Navigator.onLine")}} switches to `true`.

> [!NOTE]
> This event shouldn't be used to determine the availability of a particular website. Network problems or firewalls might still prevent the website from being reached.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("online", (event) => { })

ononline = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Event handler aliases

In addition to the `Window` interface, the event handler property `ononline` is also available on the following targets:

- {{domxref("HTMLBodyElement")}}
- {{domxref("HTMLFrameSetElement")}}
- {{domxref("SVGSVGElement")}}

## Ví dụ

```js
// addEventListener version
window.addEventListener("online", (event) => {
  console.log("You are now connected to the network.");
});

// ononline version
window.ononline = (event) => {
  console.log("You are now connected to the network.");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [`offline`](/en-US/docs/Web/API/Window/offline_event)
