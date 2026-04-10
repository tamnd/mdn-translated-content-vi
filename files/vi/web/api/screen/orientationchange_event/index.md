---
title: "Screen: sự kiện orientationchange"
short-title: orientationchange
slug: Web/API/Screen/orientationchange_event
page-type: web-api-event
status:
  - deprecated
  - non-standard
browser-compat: api.Screen.orientationchange_event
---

{{APIRef("Screen Orientation API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Sự kiện `orientationchange` được kích hoạt khi hướng của thiết bị thay đổi.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("orientationchange", (event) => { })

onorientationchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Đặc tả kỹ thuật

Tính năng này không phải là một phần của bất kỳ đặc tả kỹ thuật nào. Nó không còn nằm trong lộ trình trở thành tiêu chuẩn.

Sử dụng sự kiện {{domxref("ScreenOrientation.change_event", "change")}} của `ScreenOrientation` thay thế.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý hướng màn hình](/en-US/docs/Web/API/CSS_Object_Model/Managing_screen_orientation)
