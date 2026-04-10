---
title: "Window: sự kiện languagechange"
short-title: languagechange
slug: Web/API/Window/languagechange_event
page-type: web-api-event
browser-compat: api.Window.languagechange_event
---

{{APIRef}}

The **`languagechange`** event is fired at the global scope object when the user's preferred language changes.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("languagechange", (event) => { })

onlanguagechange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Event handler aliases

In addition to the `Window` interface, the event handler property `onlanguagechange` is also available on the following targets:

- {{domxref("HTMLBodyElement")}}
- {{domxref("HTMLFrameSetElement")}}
- {{domxref("SVGSVGElement")}}

## Ví dụ

You can use the `languagechange` event in an {{domxref("EventTarget/addEventListener", "addEventListener")}} method:

```js
window.addEventListener("languagechange", () => {
  console.log("languagechange event detected!");
});
```

Or use the `onlanguagechange` event handler property:

```js
window.onlanguagechange = (event) => {
  console.log("languagechange event detected!");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("navigator.language")}}
- {{domxref("navigator.languages")}}
- {{domxref("navigator")}}
