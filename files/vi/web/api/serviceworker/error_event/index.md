---
title: "ServiceWorker: sự kiện error"
short-title: error
slug: Web/API/ServiceWorker/error_event
page-type: web-api-event
browser-compat: api.ServiceWorker.error_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Sự kiện `error` được kích hoạt bất cứ khi nào xảy ra lỗi trong service worker.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

Đoạn mã sau đây lấy một tham chiếu đến đối tượng {{domxref("ServiceWorker")}} thông qua {{domxref("ServiceWorkerRegistration.active")}} và thiết lập trình xử lý `onerror` trên đối tượng kết quả:

```js
// trong trang đang được điều khiển
if (navigator.serviceWorker) {
  navigator.serviceWorker.register("service-worker.js");

  navigator.serviceWorker.ready.then((registration) => {
    registration.active.onerror = (event) => {
      console.log("Đã xảy ra lỗi trong service worker!");
    };
  });
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
