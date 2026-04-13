---
title: "NotificationEvent: notification property"
short-title: notification
slug: Web/API/NotificationEvent/notification
page-type: web-api-instance-property
browser-compat: api.NotificationEvent.notification
---

{{APIRef("Web Notifications")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`notification`** của giao diện {{domxref("NotificationEvent")}} trả về thực thể của {{domxref("Notification")}} đã được nhấp để kích hoạt sự kiện. {{domxref("Notification")}} cung cấp quyền truy cập chỉ đọc vào nhiều thuộc tính được đặt tại thời điểm khởi tạo Notification như `tag` và thuộc tính `data` cho phép bạn lưu trữ thông tin để sử dụng trì hoãn trong sự kiện `notificationclick`.

## Giá trị

Một đối tượng {{domxref("Notification")}}.

## Ví dụ

```js
self.addEventListener("notificationclick", (event) => {
  console.log("On notification click");

  // Data can be attached to the notification so that you
  // can process it in the notificationclick handler.
  console.log(`Notification Tag: ${event.notification.tag}`);
  console.log(`Notification Data: ${event.notification.data}`);
  event.notification.close();

  // This looks to see if the current is already open and
  // focuses if it is
  event.waitUntil(
    clients
      .matchAll({
        type: "window",
      })
      .then((clientList) => {
        for (const client of clientList) {
          if (client.url === "/" && "focus" in client) return client.focus();
        }
        if (clients.openWindow) return clients.openWindow("/");
      }),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
