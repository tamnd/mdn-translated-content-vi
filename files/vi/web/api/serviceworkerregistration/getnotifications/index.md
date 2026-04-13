---
title: "ServiceWorkerRegistration: phương thức getNotifications()"
short-title: getNotifications()
slug: Web/API/ServiceWorkerRegistration/getNotifications
page-type: web-api-instance-method
browser-compat: api.ServiceWorkerRegistration.getNotifications
---

{{APIRef("Web Notifications")}}{{SecureContext_Header}} {{AvailableInWorkers}}

**`getNotifications()`** là phương thức của giao diện {{domxref("ServiceWorkerRegistration")}} trả về danh sách các thông báo theo thứ tự chúng được tạo từ nguồn gốc hiện tại thông qua đăng ký service worker hiện tại. Các nguồn gốc có thể có nhiều đăng ký service worker đang hoạt động nhưng khác phạm vi. Các thông báo được tạo bởi một service worker trên cùng một nguồn gốc sẽ không khả dụng cho các service worker đang hoạt động khác trên cùng nguồn gốc đó.

## Cú pháp

```js-nolint
getNotifications()
getNotifications(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn để lọc những thông báo được trả về. Các tùy chọn khả dụng là:
    - `tag` {{optional_inline}}
      - : Một chuỗi đại diện cho thẻ của thông báo. Nếu được chỉ định, chỉ những thông báo có thẻ này mới được trả về.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải thành danh sách các đối tượng {{domxref("Notification")}}.

## Ví dụ

```js
navigator.serviceWorker.register("sw.js");

const options = { tag: "user_alerts" };

navigator.serviceWorker.ready.then((registration) => {
  registration.getNotifications(options).then((notifications) => {
    // làm gì đó với các thông báo của bạn
  });
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
