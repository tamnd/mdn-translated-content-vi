---
title: "ServiceWorker: sự kiện error"
short-title: error
slug: Web/API/ServiceWorker/error_event
page-type: web-api-event
browser-compat: api.ServiceWorker.error_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Sự kiện `error` được kích hoạt bất cứ khi nào một lỗi xảy ra trong service worker.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Đoạn mã sau lấy một handle đến đối tượng {{domxref("ServiceWorker")}} thông qua {{domxref("ServiceWorkerRegistration.active")}} và thiết lập một trình xử lý `onerror` trên đối tượng kết quả:

```js
// in the page being controlled
if (navigator.serviceWorker) {
  navigator.serviceWorker.register("service-worker.js");

  navigator.serviceWorker.ready.then((registration) => {
    registration.active.onerror = (event) => {
      console.log("An error occurred in the service worker!");
    };
  });
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
