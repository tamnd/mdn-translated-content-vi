---
title: "Notification: thuộc tính icon"
short-title: icon
slug: Web/API/Notification/icon
page-type: web-api-instance-property
browser-compat: api.Notification.icon
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`icon`** của giao diện {{domxref("Notification")}} chứa URL của biểu tượng sẽ được hiển thị như một phần của thông báo, như được chỉ định trong tùy chọn `icon` của constructor {{domxref("Notification.Notification","Notification()")}}.

## Giá trị

Một chuỗi.

## Ví dụ

Trong [ứng dụng To-do list](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API) của chúng tôi ([xem ứng dụng chạy trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)), chúng tôi dùng constructor {{domxref("Notification.Notification","Notification()")}} để phát một thông báo, truyền vào các đối số để chỉ định body, icon và title mà chúng tôi muốn.

```js
const notification = new Notification("To do list", {
  body: text,
  icon: img,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
