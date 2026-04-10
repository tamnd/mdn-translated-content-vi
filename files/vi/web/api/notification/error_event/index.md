---
title: "Notification: sự kiện error"
short-title: error
slug: Web/API/Notification/error_event
page-type: web-api-event
browser-compat: api.Notification.error_event
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Sự kiện **`error`** của giao diện {{domxref("Notification")}} được phát ra khi có lỗi xảy ra với một {{domxref("Notification")}} (trong nhiều trường hợp là lỗi khiến thông báo không thể hiển thị).

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
