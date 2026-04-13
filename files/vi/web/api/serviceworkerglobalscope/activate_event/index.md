---
title: "ServiceWorkerGlobalScope: sự kiện activate"
short-title: activate
slug: Web/API/ServiceWorkerGlobalScope/activate_event
page-type: web-api-event
browser-compat: api.ServiceWorkerGlobalScope.activate_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`activate`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt khi một {{domxref("ServiceWorkerRegistration")}} có một worker {{domxref("ServiceWorkerRegistration.active")}} mới.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("activate", (event) => { })

onactivate = (event) => { }
```

## Loại sự kiện

Một {{domxref("ExtendableEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ExtendableEvent")}}

## Thuộc tính sự kiện

_Không triển khai bất kỳ thuộc tính cụ thể nào, nhưng kế thừa các thuộc tính từ giao diện cha, {{domxref("Event")}}._

## Ví dụ

Đoạn mã sau đây cho thấy cách bạn có thể sử dụng trình xử lý sự kiện `activate` để nâng cấp bộ nhớ đệm.

```js
self.addEventListener("activate", (event) => {
  const cacheAllowlist = ["v2"];

  event.waitUntil(
    caches.keys().then((cacheNames) =>
      Promise.all(
        cacheNames.map((cacheName) => {
          if (!cacheAllowlist.includes(cacheName)) {
            return caches.delete(cacheName);
          }
          return undefined;
        }),
      ),
    ),
  );
});
```

Bạn cũng có thể thiết lập trình xử lý sự kiện bằng cách sử dụng thuộc tính `onactivate`:

```js
self.onactivate = (event) => {
  // …
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("ServiceWorkerGlobalScope/install_event", "install")}}
- {{domxref("ServiceWorkerGlobalScope")}}
- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
