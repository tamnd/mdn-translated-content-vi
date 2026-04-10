---
title: "Notification: sự kiện click"
short-title: click
slug: Web/API/Notification/click_event
page-type: web-api-event
browser-compat: api.Notification.click_event
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Sự kiện **`click`** của giao diện {{domxref("Notification")}} được phát ra khi người dùng bấm vào {{domxref("Notification")}} đang hiển thị.

Hành vi mặc định là chuyển focus tới viewport của [ngữ cảnh duyệt web](https://html.spec.whatwg.org/multipage/browsers.html#browsing-context) liên quan đến thông báo.
Nếu bạn không muốn hành vi đó, hãy gọi {{domxref("Event/preventDefault", "preventDefault()")}} trên object sự kiện.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("click", (event) => { })

onclick = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

Trong ví dụ sau, chúng ta dùng trình xử lý `onclick` để mở một trang web trong tab mới (được chỉ định bằng tham số `'_blank'`) khi một thông báo được bấm:

```js
notification.onclick = (event) => {
  event.preventDefault(); // ngăn trình duyệt focus vào tab của Notification
  window.open("https://www.mozilla.org", "_blank");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
