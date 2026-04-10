---
title: "ServiceWorkerContainer: phương thức getRegistrations()"
short-title: getRegistrations()
slug: Web/API/ServiceWorkerContainer/getRegistrations
page-type: web-api-instance-method
browser-compat: api.ServiceWorkerContainer.getRegistrations
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`getRegistrations()`** của giao diện {{domxref("ServiceWorkerContainer")}} lấy tất cả các {{domxref("ServiceWorkerRegistration")}} liên kết với một `ServiceWorkerContainer`, trong một mảng. Phương thức trả về một {{jsxref("Promise")}} resolve thành một mảng các {{domxref("ServiceWorkerRegistration")}}.

## Cú pháp

```js-nolint
getRegistrations()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} resolve thành một mảng các đối tượng {{domxref("ServiceWorkerRegistration")}}.

## Ví dụ

```js
navigator.serviceWorker.getRegistrations().then((registrations) => {
  document.querySelector("#status").textContent =
    "ServiceWorkerRegistrations found.";
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
