---
title: "ServiceWorkerGlobalScope: sự kiện install"
short-title: install
slug: Web/API/ServiceWorkerGlobalScope/install_event
page-type: web-api-event
browser-compat: api.ServiceWorkerGlobalScope.install_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`install`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt khi một {{domxref("ServiceWorkerRegistration")}} có một worker {{domxref("ServiceWorkerRegistration.installing")}} mới.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("install", (event) => { })

oninstall = (event) => { }
```

## Loại sự kiện

Một {{domxref("ExtendableEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ExtendableEvent")}}

## Thuộc tính sự kiện

_Không triển khai bất kỳ thuộc tính cụ thể nào, nhưng kế thừa các thuộc tính từ giao diện cha, {{domxref("Event")}}._

## Ví dụ

Đoạn mã sau đây cho thấy cách trình xử lý sự kiện `install` có thể được sử dụng để điền vào bộ nhớ đệm với một số phản hồi, mà service worker sau đó có thể sử dụng để phục vụ tài nguyên ngoại tuyến:

```js
self.addEventListener("install", (event) => {
  event.waitUntil(
    caches
      .open("v1")
      .then((cache) =>
        cache.addAll([
          "/",
          "/index.html",
          "/style.css",
          "/app.js",
          "/image-list.js",
          "/star-wars-logo.jpg",
          "/gallery/",
          "/gallery/bountyHunters.jpg",
          "/gallery/myLittleVader.jpg",
          "/gallery/snowTroopers.jpg",
        ]),
      ),
  );
});
```

Bạn cũng có thể thiết lập trình xử lý sự kiện bằng cách sử dụng thuộc tính `oninstall`:

```js
self.oninstall = (event) => {
  // …
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("ServiceWorkerGlobalScope/activate_event", "activate")}}
- {{domxref("ServiceWorkerGlobalScope")}}
- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
