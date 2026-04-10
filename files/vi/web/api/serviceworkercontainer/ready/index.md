---
title: "ServiceWorkerContainer: thuộc tính ready"
short-title: ready
slug: Web/API/ServiceWorkerContainer/ready
page-type: web-api-instance-property
browser-compat: api.ServiceWorkerContainer.ready
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`ready`** của giao diện {{domxref("ServiceWorkerContainer")}} cung cấp một cách để trì hoãn việc thực thi mã cho đến khi một service worker hoạt động.

Thuộc tính trả về một {{jsxref("Promise")}} sẽ không bao giờ bị từ chối, và chờ đợi vô thời hạn cho đến khi {{domxref("ServiceWorkerRegistration")}} được liên kết với trang hiện tại có một worker {{domxref("ServiceWorkerRegistration.active","đang hoạt động")}}.
Khi điều kiện đó được đáp ứng, nó phân giải với {{domxref("ServiceWorkerRegistration")}}.

## Giá trị

Một {{jsxref("Promise")}} sẽ không bao giờ bị từ chối, và cuối cùng có thể phân giải với một {{domxref("ServiceWorkerRegistration")}} khi có một service worker đang hoạt động.

## Ví dụ

### Trì hoãn mã cho đến khi có một service worker đang hoạt động

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
