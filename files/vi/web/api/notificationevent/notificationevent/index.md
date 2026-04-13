---
title: "NotificationEvent: NotificationEvent() constructor"
short-title: NotificationEvent()
slug: Web/API/NotificationEvent/NotificationEvent
page-type: web-api-constructor
browser-compat: api.NotificationEvent.NotificationEvent
---

{{APIRef("Web Notifications")}}{{AvailableInWorkers("service")}}

Hàm khởi tạo **`NotificationEvent()`** tạo một đối tượng {{domxref("NotificationEvent")}} mới.

## Cú pháp

```js-nolint
new NotificationEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên sự kiện. Phân biệt chữ hoa chữ thường và các trình duyệt đặt giá trị là `notificationclick` hoặc `notificationclose`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("ExtendableEvent/ExtendableEvent", "ExtendableEvent()")}}_, có thể có các thuộc tính sau:
    - `notification`
      - : Một đối tượng {{domxref("Notification")}} được dùng làm thông báo mà sự kiện được gửi trên đó.
    - `action` {{optional_inline}}
      - : Hành động liên quan đến thông báo. Mặc định là `""`.

### Giá trị trả về

Một đối tượng {{domxref("NotificationEvent()")}} mới.

## Ví dụ

```js
const n = new Notification("Hello");
const myNotificationEvent = new NotificationEvent(type, { notification: n });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
