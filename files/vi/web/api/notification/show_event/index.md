---
title: "Notification: sự kiện show"
short-title: show
slug: Web/API/Notification/show_event
page-type: web-api-event
browser-compat: api.Notification.show_event
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Sự kiện **`show`** của giao diện {{domxref("Notification")}} được phát ra khi một {{domxref("Notification")}} được hiển thị.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("show", (event) => { })

onshow = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
