---
title: NotificationEvent
slug: Web/API/NotificationEvent
page-type: web-api-interface
browser-compat: api.NotificationEvent
---

{{APIRef("Web Notifications")}}{{AvailableInWorkers("service")}}

Giao diện **`NotificationEvent`** của {{domxref("Notifications API", "", "", "nocode")}} đại diện cho sự kiện thông báo được gửi trên {{domxref("ServiceWorkerGlobalScope")}} của một {{domxref("ServiceWorker")}}.

Giao diện này kế thừa từ giao diện {{domxref("ExtendableEvent")}}.

> [!NOTE]
> Chỉ các sự kiện thông báo liên tục, được kích hoạt tại đối tượng {{domxref("ServiceWorkerGlobalScope")}}, mới triển khai giao diện `NotificationEvent`. Các sự kiện thông báo không liên tục, được kích hoạt tại đối tượng {{domxref("Notification")}}, triển khai giao diện `Event`.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("NotificationEvent.NotificationEvent","NotificationEvent()")}}
  - : Tạo một đối tượng `NotificationEvent` mới.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("ExtendableEvent")}}_.

- {{domxref("NotificationEvent.notification")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("Notification")}} đại diện cho thông báo đã được nhấp để kích hoạt sự kiện.
- {{domxref("NotificationEvent.action")}} {{ReadOnlyInline}}
  - : Trả về ID chuỗi của nút thông báo mà người dùng đã nhấp. Giá trị này trả về chuỗi rỗng nếu người dùng đã nhấp vào thông báo ở nơi khác ngoài nút hành động, hoặc nếu thông báo không có nút.

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ giao diện cha, {{domxref("ExtendableEvent")}}_.

## Ví dụ

```js
self.addEventListener("notificationclick", (event) => {
  console.log(`On notification click: ${event.notification.tag}`);
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

> [!NOTE]
> Giao diện này được chỉ định trong [Notifications API](/en-US/docs/Web/API/Notifications_API), nhưng được truy cập thông qua {{domxref("ServiceWorkerGlobalScope")}}.

## Tương thích trình duyệt

{{Compat}}
