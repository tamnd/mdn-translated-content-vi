---
title: "ServiceWorkerGlobalScope: phương thức skipWaiting()"
short-title: skipWaiting()
slug: Web/API/ServiceWorkerGlobalScope/skipWaiting
page-type: web-api-instance-method
browser-compat: api.ServiceWorkerGlobalScope.skipWaiting
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Phương thức **`skipWaiting()`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} buộc service worker đang chờ trở thành service worker đang hoạt động.

Sử dụng phương thức này với {{domxref("Clients.claim()")}} để đảm bảo rằng các cập nhật đối với service worker cơ bản có hiệu lực ngay lập tức cho cả client hiện tại và tất cả các client đang hoạt động khác.

## Cú pháp

```js-nolint
skipWaiting()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết với `undefined` sau khi cố gắng kích hoạt service worker mới đã cài đặt.

## Ví dụ

Trong khi `self.skipWaiting()` có thể được gọi tại bất kỳ thời điểm nào trong quá trình thực thi của service worker, nó sẽ chỉ có hiệu quả nếu có một service worker mới đã cài đặt có thể vẫn ở trạng thái `waiting`. Do đó, thông thường gọi `self.skipWaiting()` từ bên trong trình xử lý {{domxref("InstallEvent")}}.

Ví dụ sau khiến một service worker mới đã cài đặt tiến vào trạng thái `activating`, bất kể đã có service worker đang hoạt động hay chưa.

```js
self.addEventListener("install", (event) => {
  // The promise that skipWaiting() returns can be safely ignored.
  self.skipWaiting();

  // Perform any other actions required for your
  // service worker to install, potentially inside
  // of event.waitUntil();
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Mẫu mã service workers cơ bản](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- {{domxref("Clients.claim()")}}
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
