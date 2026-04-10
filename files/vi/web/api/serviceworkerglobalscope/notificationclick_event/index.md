---
title: "ServiceWorkerGlobalScope: sự kiện notificationclick"
short-title: notificationclick
slug: Web/API/ServiceWorkerGlobalScope/notificationclick_event
page-type: web-api-event
browser-compat: api.ServiceWorkerGlobalScope.notificationclick_event
---

{{APIRef("Web Notifications")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`notificationclick`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt để cho biết rằng một thông báo hệ thống được tạo bởi {{domxref("ServiceWorkerRegistration.showNotification()")}} đã được nhấp.

Các thông báo được tạo trên luồng chính hoặc trong các workers không phải service workers
bằng cách sử dụng phương thức khởi tạo {{domxref("Notification.Notification","Notification()")}} sẽ
thay vào đó nhận sự kiện {{domxref("Notification/click_event", "click")}} trên đối tượng {{domxref("Notification")}}
của chính nó.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("notificationclick", (event) => { })

onnotificationclick = (event) => { }
```

## Loại sự kiện

Một {{domxref("NotificationEvent")}}. Kế thừa từ {{domxref("ExtendableEvent")}} và {{domxref("Event")}}.

{{InheritanceDiagram("NotificationEvent")}}

## Thuộc tính sự kiện

_Kế thừa các thuộc tính từ các giao diện tổ tiên, {{domxref("ExtendableEvent")}} và {{domxref("Event")}}_.

- {{domxref("NotificationEvent.notification")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("Notification")}} đại diện cho thông báo đã được nhấp để kích hoạt sự kiện.
- {{domxref("NotificationEvent.action")}} {{ReadOnlyInline}}
  - : Trả về ID chuỗi của nút thông báo mà người dùng đã nhấp. Giá trị này trả về một chuỗi rỗng nếu người dùng nhấp vào thông báo ở nơi khác chứ không phải nút hành động, hoặc thông báo không có nút.

## Ví dụ

Bạn có thể sử dụng sự kiện `notificationclick` trong phương thức {{domxref("EventTarget/addEventListener", "addEventListener")}}:

```js
self.addEventListener("notificationclick", (event) => {
  console.log("On notification click: ", event.notification.tag);
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

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onnotificationclick`:

```js
self.onnotificationclick = (event) => {
  console.log("On notification click: ", event.notification.tag);
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
};
```

Bạn có thể xử lý các hành động sự kiện bằng cách sử dụng `event.action` trong trình xử lý sự kiện `notificationclick`:

```js
navigator.serviceWorker.register("sw.js");
Notification.requestPermission().then((result) => {
  if (result === "granted") {
    navigator.serviceWorker.ready.then((registration) => {
      // Show a notification that includes an action titled Archive.
      registration.showNotification("New mail from Alice", {
        actions: [
          {
            action: "archive",
            title: "Archive",
          },
        ],
      });
    });
  }
});

self.addEventListener("notificationclick", (event) => {
  event.notification.close();
  if (event.action === "archive") {
    // User selected the Archive action.
    archiveEmail();
  } else {
    // User selected (e.g., clicked in) the main body of notification.
    clients.openWindow("/inbox");
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
- [Notifications API](/en-US/docs/Web/API/Notifications_API)
