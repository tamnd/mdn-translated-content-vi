---
title: "Window: sự kiện appinstalled"
short-title: appinstalled
slug: Web/API/Window/appinstalled_event
page-type: web-api-event
browser-compat: api.Window.appinstalled_event
---

{{APIRef}}

The **`appinstalled`** event of the [Web Manifest API](/en-US/docs/Web/Progressive_web_apps/Manifest) is fired when the browser has successfully installed a page as an application.

This event is not cancelable and does not bubble.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("appinstalled", (event) => { })

onappinstalled = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

You can use the `appinstalled` event in an {{domxref("EventTarget/addEventListener", "addEventListener")}} method:

```js
window.addEventListener("appinstalled", () => {
  console.log("Thank you for installing our app!");
});
```

Or use the `onappinstalled` event handler property:

```js
window.onappinstalled = () => {
  console.log("Thank you for installing our app!");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
