---
title: "ServiceWorkerRegistration: thuộc tính periodicSync"
short-title: periodicSync
slug: Web/API/ServiceWorkerRegistration/periodicSync
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ServiceWorkerRegistration.periodicSync
---

{{APIRef("Service Workers API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`periodicSync`** của giao diện {{domxref("ServiceWorkerRegistration")}} trả về một tham chiếu đến giao diện {{domxref('PeriodicSyncManager')}}, cho phép đăng ký các tác vụ chạy ở các khoảng thời gian cụ thể.

## Giá trị

Một đối tượng {{domxref('PeriodicSyncManager')}}.

## Ví dụ

Bạn có thể truy cập thuộc tính từ tập lệnh chính hoặc service worker đã đăng ký.

Đây là một ví dụ từ tập lệnh chính:

```js
// reference registration
const registration = await navigator.serviceWorker.ready;

// feature detection
if ("periodicSync" in registration) {
  // Background Periodic Sync functionality
  const periodicSync = registration.periodicSync;
}
```

Từ [service worker](/en-US/docs/Web/API/Service_Worker_API):

```js
// service worker script

const periodicSync = self.registration.periodicSync;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Trải nghiệm ngoại tuyến phong phú hơn với Periodic Background Sync API](https://developer.chrome.com/docs/capabilities/periodic-background-sync)
