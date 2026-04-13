---
title: "NotificationEvent: action property"
short-title: action
slug: Web/API/NotificationEvent/action
page-type: web-api-instance-property
browser-compat: api.NotificationEvent.action
---

{{APIRef("Web Notifications")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`action`** của giao diện {{domxref("NotificationEvent")}} trả về ID chuỗi của nút thông báo mà người dùng đã nhấp. Giá trị này trả về chuỗi rỗng nếu người dùng đã nhấp vào thông báo ở nơi khác ngoài nút hành động, hoặc nếu thông báo không có nút. ID thông báo được đặt trong quá trình tạo Notification thông qua thuộc tính mảng actions và không thể sửa đổi trừ khi thông báo được thay thế.

## Giá trị

Một chuỗi.

## Ví dụ

```js
self.registration.showNotification("New articles available", {
  actions: [{ action: "get", title: "Get now." }],
});

self.addEventListener("notificationclick", (event) => {
  event.notification.close();
  if (event.action === "get") {
    synchronizeReader();
  } else {
    clients.openWindow("/reader");
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
