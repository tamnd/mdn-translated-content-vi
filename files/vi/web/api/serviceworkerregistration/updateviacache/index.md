---
title: "ServiceWorkerRegistration: thuộc tính updateViaCache"
short-title: updateViaCache
slug: Web/API/ServiceWorkerRegistration/updateViaCache
page-type: web-api-instance-property
browser-compat: api.ServiceWorkerRegistration.updateViaCache
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`updateViaCache`** của giao diện {{domxref("ServiceWorkerRegistration")}} trả về giá trị của cài đặt được sử dụng để xác định các trường hợp mà trình duyệt sẽ tham vấn bộ nhớ đệm HTTP khi cố gắng cập nhật service worker hoặc bất kỳ tập lệnh nào được nhập qua {{domxref("WorkerGlobalScope.importScripts", "importScripts()")}}.

## Giá trị

Trả về một trong các giá trị sau:

- `imports`, có nghĩa là bộ nhớ đệm HTTP không được tham vấn cho các cập nhật đối với tập lệnh service worker, nhưng được tham vấn cho các tập lệnh được nhập bằng {{domxref("WorkerGlobalScope.importScripts", "importScripts()")}}. Đây là giá trị mặc định.
- `all`, có nghĩa là bộ nhớ đệm HTTP được tham vấn cho các cập nhật đối với tập lệnh service worker và cho các tập lệnh được nhập bằng {{domxref("WorkerGlobalScope.importScripts", "importScripts()")}}.
- `none`, có nghĩa là bộ nhớ đệm HTTP không bao giờ được tham vấn.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng updateViaCache.

```js
if ("serviceWorker" in navigator) {
  navigator.serviceWorker
    .register("/service-worker.js", {
      updateViaCache: "none",
    })
    .then((registration) => {
      registration.addEventListener("updatefound", () => {
        // If updatefound is fired, it means that there's
        // a new service worker being installed.
        console.log(`Value of updateViaCache: ${registration.updateViaCache}`);
      });
    })
    .catch((error) => {
      console.error(`Service worker registration failed: ${error}`);
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
