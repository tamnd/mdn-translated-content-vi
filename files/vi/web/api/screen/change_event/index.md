---
title: "Screen: sự kiện change"
short-title: change
slug: Web/API/Screen/change_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.Screen.change_event
---

{{APIRef("Window Management API")}}{{SeeCompatTable}}{{securecontext_header}}

Sự kiện **`change`** của giao diện {{domxref("Screen")}} được kích hoạt trên một màn hình cụ thể khi một hoặc nhiều thuộc tính sau thay đổi trên đó:

- {{domxref("Screen.width", "width")}}
- {{domxref("Screen.height", "height")}}
- {{domxref("Screen.availWidth", "availWidth")}}
- {{domxref("Screen.availHeight", "availHeight")}}
- {{domxref("Screen.colorDepth", "colorDepth")}}
- {{domxref("Screen.orientation", "orientation")}}

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
const firstScreen = (await window.getScreenDetails()).screens[0];
firstScreen.addEventListener("change", (event) => {
  console.log("Màn hình đầu tiên đã thay đổi.", event, firstScreen);
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
