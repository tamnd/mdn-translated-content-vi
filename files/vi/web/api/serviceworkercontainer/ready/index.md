---
title: "ServiceWorkerContainer: thuộc tính ready"
short-title: ready
slug: Web/API/ServiceWorkerContainer/ready
page-type: web-api-instance-property
browser-compat: api.ServiceWorkerContainer.ready
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`ready`** của giao diện {{domxref("ServiceWorkerContainer")}} cung cấp một cách để trì hoãn việc thực thi mã cho đến khi service worker hoạt động.

Thuộc tính trả về một {{jsxref("Promise")}} sẽ không bao giờ reject, và chờ vô thời hạn cho đến khi {{domxref("ServiceWorkerRegistration")}} liên kết với trang hiện tại có một worker {{domxref("ServiceWorkerRegistration.active","active")}}.
Khi điều kiện đó được đáp ứng, nó resolve với {{domxref("ServiceWorkerRegistration")}}.

## Giá trị

Một {{jsxref("Promise")}} sẽ không bao giờ reject, và có thể eventually resolve với một {{domxref("ServiceWorkerRegistration")}} khi có một service worker đang hoạt động.

## Ví dụ

### Trì hoãn mã cho đến khi có service worker hoạt động

```js
if ("serviceWorker" in navigator) {
  navigator.serviceWorker.ready.then((registration) => {
    console.log(`A service worker is active: ${registration.active}`);

    // At this point, you can call methods that require an active
    // service worker, like registration.pushManager.subscribe()
  });
} else {
  console.error("Service workers are not supported.");
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
