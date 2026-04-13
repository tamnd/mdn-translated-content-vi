---
title: "Notification: thuộc tính navigate"
short-title: navigate
slug: Web/API/Notification/navigate
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Notification.navigate
---

{{APIRef("Web Notifications")}}{{securecontext_header}}{{SeeCompatTable}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`navigate`** của giao diện {{domxref("Notification")}} chứa URL mà user agent sẽ điều hướng tới khi người dùng kích hoạt thông báo.

Đây là giá trị đã được phân giải của URL, nếu có, được chỉ định trong tùy chọn `navigate` của constructor {{domxref("Notification.Notification", "Notification()")}} hoặc {{domxref("ServiceWorkerRegistration.showNotification()"}}.

Thông thường, việc kích hoạt một thông báo không bền vững sẽ phát sự kiện {{domxref("Notification.click_event", "click")}} trên object {{domxref("Notification")}} của nó, và việc kích hoạt một thông báo bền vững sẽ phát sự kiện {{domxref("ServiceWorkerGlobalScope.notificationclick_event", "notificationclick")}} trên {{domxref("ServiceWorkerGlobalScope")}}.

Khi một thông báo có URL điều hướng được người dùng kích hoạt, user agent sẽ điều hướng tới URL đã chỉ định thay vì phát một trong hai sự kiện này. Điều đó cho phép thông báo dẫn người dùng tới một trang cụ thể mà không cần bộ xử lý sự kiện.

## Giá trị

Một chuỗi chứa {{glossary("URL")}}, hoặc chuỗi rỗng nếu chưa đặt URL điều hướng.

## Ví dụ

### Đọc giá trị thuộc tính navigate

Thuộc tính `navigate` trả về chuỗi URL đã phân giải khi có URL điều hướng, hoặc chuỗi rỗng nếu không có.

```js
const notification = new Notification("New message from Alice", {
  body: "Hey, are you free for lunch?",
  navigate: "/messages/alice",
});

// Thuộc tính chứa URL tuyệt đối đã phân giải
console.log(notification.navigate); // ví dụ "https://example.com/messages/alice"

// Nếu không có tùy chọn navigate, thuộc tính là chuỗi rỗng
const basic = new Notification("Hello!");
console.log(basic.navigate); // ""
```

### Dùng navigate với service worker

Khi dùng thông báo bền vững thông qua service worker, tùy chọn `navigate` cho phép thông báo mở một trang khi được kích hoạt mà không cần xử lý sự kiện {{domxref("ServiceWorkerGlobalScope.notificationclick_event", "notificationclick")}}.

```js
// Bên trong service worker
self.registration.showNotification("Order shipped!", {
  body: "Your order #1234 has been shipped.",
  navigate: "/orders/1234",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
- Constructor {{domxref("Notification.Notification", "Notification()")}}
- {{domxref("ServiceWorkerRegistration.showNotification()")}}
