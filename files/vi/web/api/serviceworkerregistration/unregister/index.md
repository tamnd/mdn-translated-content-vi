---
title: "ServiceWorkerRegistration: phương thức unregister()"
short-title: unregister()
slug: Web/API/ServiceWorkerRegistration/unregister
page-type: web-api-instance-method
browser-compat: api.ServiceWorkerRegistration.unregister
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

**`unregister()`** là phương thức của giao diện {{domxref("ServiceWorkerRegistration")}} hủy đăng ký service worker và trả về một {{jsxref("Promise")}}. Promise sẽ được phân giải thành `false` nếu không tìm thấy đăng ký nào, còn nếu không nó sẽ phân giải thành `true` bất kể việc hủy đăng ký có thực sự xảy ra hay không (nó có thể không hủy đăng ký nếu ai đó vừa gọi {{domxref("ServiceWorkerContainer.register()")}} với cùng phạm vi.) Service worker sẽ hoàn thành mọi thao tác đang diễn ra trước khi bị hủy đăng ký.

## Cú pháp

```js-nolint
unregister()
```

### Tham số

Không.

### Giá trị trả về

{{jsxref("Promise")}} được phân giải với một giá trị boolean cho biết service worker đã được hủy đăng ký hay chưa.

## Ví dụ

Ví dụ đơn giản sau đăng ký một service worker, sau đó ngay lập tức hủy đăng ký nó:

```js
if ("serviceWorker" in navigator) {
  navigator.serviceWorker
    .register("/sw.js", { scope: "/" })
    .then((registration) => {
      // đăng ký thành công
      console.log("Registration succeeded.");
      registration.unregister().then((boolean) => {
        // nếu boolean = true, việc hủy đăng ký thành công
      });
    })
    .catch((error) => {
      // đăng ký thất bại
      console.error(`Registration failed with ${error}`);
    });
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service workers](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
