---
title: "ScreenOrientation: sự kiện change"
short-title: change
slug: Web/API/ScreenOrientation/change_event
page-type: web-api-event
browser-compat: api.ScreenOrientation.change_event
---

{{APIRef("Screen Orientation API")}}

Sự kiện **`change`** của giao diện {{domxref("ScreenOrientation")}} được kích hoạt khi hướng của màn hình thay đổi, ví dụ khi người dùng xoay điện thoại di động của họ.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Trong ví dụ sau, callback `change` in ra {{DOMxRef("ScreenOrientation.type", "screen orientation type", "", "nocode")}} và {{DOMxRef("ScreenOrientation.angle", "angle", "", "nocode")}} mới.

```js
screen.orientation.addEventListener("change", (event) => {
  const type = event.target.type;
  const angle = event.target.angle;
  console.log(`ScreenOrientation change: ${type}, ${angle} degrees.`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
