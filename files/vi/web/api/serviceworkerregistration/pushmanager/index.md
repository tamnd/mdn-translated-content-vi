---
title: "ServiceWorkerRegistration: thuộc tính pushManager"
short-title: pushManager
slug: Web/API/ServiceWorkerRegistration/pushManager
page-type: web-api-instance-property
browser-compat: api.ServiceWorkerRegistration.pushManager
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`pushManager`** của giao diện {{domxref("ServiceWorkerRegistration")}} trả về một tham chiếu đến giao diện {{domxref("PushManager")}} để quản lý các đăng ký push; điều này bao gồm hỗ trợ cho việc đăng ký, lấy đăng ký đang hoạt động, và truy cập trạng thái quyền push.

## Giá trị

Một đối tượng {{domxref("PushManager")}}.

## Ví dụ

```js
this.onpush = (event) => {
  console.log(event.data);
  // From here we can write the data to IndexedDB, send it to any open
  // windows, display a notification, etc.
};

navigator.serviceWorker
  .register("serviceworker.js")
  .then((serviceWorkerRegistration) => {
    serviceWorkerRegistration.pushManager.subscribe().then(
      (pushSubscription) => {
        console.log(pushSubscription.subscriptionId);
        console.log(pushSubscription.endpoint);
        // The push subscription details needed by the application
        // server are now available, and can be sent to it using,
        // for example, the fetch() API.
      },
      (error) => {
        // During development it often helps to log errors to the
        // console. In a production environment it might make sense to
        // also report information about errors back to the
        // application server.
        console.error(error);
      },
    );
  });
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Push API](/en-US/docs/Web/API/Push_API)
