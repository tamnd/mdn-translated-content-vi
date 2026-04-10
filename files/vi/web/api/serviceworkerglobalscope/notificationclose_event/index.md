---
title: "ServiceWorkerGlobalScope: sự kiện notificationclose"
short-title: notificationclose
slug: Web/API/ServiceWorkerGlobalScope/notificationclose_event
page-type: web-api-event
browser-compat: api.ServiceWorkerGlobalScope.notificationclose_event
---

{{APIRef("Web Notifications")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`notificationclose`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt khi người dùng đóng một thông báo đã hiển thị được tạo bởi {{domxref("ServiceWorkerRegistration.showNotification()")}}.

Các thông báo được tạo trên luồng chính hoặc trong các workers không phải service workers
bằng cách sử dụng phương thức khởi tạo {{domxref("Notification.Notification","Notification()")}} sẽ
thay vào đó nhận sự kiện {{domxref("Notification/close_event", "close")}} trên đối tượng {{domxref("Notification")}}
của chính nó.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("notificationclose", (event) => { })

onnotificationclose = (event) => { }
```

## Loại sự kiện

Một {{domxref("NotificationEvent")}}. Kế thừa từ {{domxref("ExtendableEvent")}} và {{domxref("Event")}}.

{{InheritanceDiagram("NotificationEvent")}}

## Thuộc tính sự kiện

_Kế thừa các thuộc tính từ giao diện tổ tiên, {{domxref("ExtendableEvent")}} và {{domxref("Event")}}_.

- {{domxref("NotificationEvent.notification")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("Notification")}} đại diện cho thông báo đã được nhấp để kích hoạt sự kiện.
- {{domxref("NotificationEvent.action")}} {{ReadOnlyInline}}
  - : Trả về ID chuỗi của nút thông báo mà người dùng đã nhấp. Giá trị này trả về một chuỗi rỗng nếu người dùng nhấp vào thông báo ở nơi khác chứ không phải nút hành động, hoặc thông báo không có nút.

## Ví dụ

```js
// Inside a service worker.
self.onnotificationclose = (event) => {
  console.log("On notification close: ", event.notification.tag);
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
