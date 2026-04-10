---
title: "ServiceWorkerRegistration: sự kiện updatefound"
short-title: updatefound
slug: Web/API/ServiceWorkerRegistration/updatefound_event
page-type: web-api-event
browser-compat: api.ServiceWorkerRegistration.updatefound_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Sự kiện **`updatefound`** của giao diện {{domxref("ServiceWorkerRegistration")}} được kích hoạt bất cứ khi nào thuộc tính {{domxref("ServiceWorkerRegistration.installing")}} có được một service worker mới.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("updatefound", (event) => { })

onupdatefound = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

```js
const registration = await navigator.serviceWorker.getRegistration();
if (registration) {
  registration.addEventListener("updatefound", () => {
    console.log("Đã tìm thấy bản cập nhật Service Worker!");
  });
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
