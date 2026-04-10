---
title: "ServiceWorkerContainer: phương thức getRegistration()"
short-title: getRegistration()
slug: Web/API/ServiceWorkerContainer/getRegistration
page-type: web-api-instance-method
browser-compat: api.ServiceWorkerContainer.getRegistration
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`getRegistration()`** của giao diện {{domxref("ServiceWorkerContainer")}} lấy một đối tượng {{domxref("ServiceWorkerRegistration")}} có URL phạm vi phù hợp với URL client được cung cấp. Phương thức trả về một {{jsxref("Promise")}} phân giải thành một {{domxref("ServiceWorkerRegistration")}} hoặc `undefined`.

## Cú pháp

```js-nolint
getRegistration()
getRegistration(clientURL)
```

### Tham số

- `clientURL` {{optional_inline}}
  - : Đăng ký có phạm vi phù hợp với URL này sẽ được trả về. Các URL tương đối được phân giải với client hiện tại làm cơ sở. Nếu tham số này không được cung cấp, URL của client hiện tại sẽ được sử dụng theo mặc định.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một đối tượng {{domxref("ServiceWorkerRegistration")}} hoặc `undefined`.

## Ví dụ

```js
navigator.serviceWorker.getRegistration("/app").then((registration) => {
  if (registration) {
    document.querySelector("#status").textContent =
      "ServiceWorkerRegistration found.";
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
