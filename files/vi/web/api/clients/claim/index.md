---
title: "Clients: phương thức claim()"
short-title: claim()
slug: Web/API/Clients/claim
page-type: web-api-instance-method
browser-compat: api.Clients.claim
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Phương thức **`claim()`** của giao diện {{domxref("Clients")}} cho phép một service worker đang hoạt động tự đặt mình làm {{domxref("ServiceWorkerContainer.controller", "controller")}} cho mọi client trong {{domxref("ServiceWorkerRegistration.scope", "scope")}} của nó.
Điều này kích hoạt một sự kiện `controllerchange` trên {{domxref("ServiceWorkerContainer","navigator.serviceWorker")}} ở mọi client bắt đầu được service worker này kiểm soát.

Khi một service worker mới được đăng ký, các trang sẽ không dùng nó cho đến lần tải tiếp theo.
Phương thức `claim()` khiến các trang đó được kiểm soát ngay lập tức.
Hãy lưu ý rằng điều này đồng nghĩa service worker của bạn sẽ kiểm soát cả những trang được tải bình thường qua mạng, hoặc có thể qua một service worker khác.

## Cú pháp

```js-nolint
claim()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải thành `undefined`.

## Ví dụ

Ví dụ sau dùng `claim()` bên trong trình lắng nghe sự kiện `activate` của service worker để các client được tải trong cùng scope không cần tải lại trước khi yêu cầu tìm nạp của chúng đi qua service worker này.

```js
self.addEventListener("activate", (event) => {
  event.waitUntil(clients.claim());
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Vòng đời service worker](https://web.dev/articles/service-worker-lifecycle)
- {{domxref("ServiceWorkerGlobalScope.skipWaiting()", "self.skipWaiting()")}} - bỏ qua giai đoạn chờ của service worker
