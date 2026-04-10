---
title: "CacheStorage: phương thức open()"
short-title: open()
slug: Web/API/CacheStorage/open
page-type: web-api-instance-method
browser-compat: api.CacheStorage.open
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`open()`** của giao diện
{{domxref("CacheStorage")}} trả về một {{jsxref("Promise")}} phân giải thành
đối tượng {{domxref("Cache")}} khớp với `cacheName`.

Bạn có thể truy cập `CacheStorage` thông qua thuộc tính {{domxref("Window.caches")}} trong cửa sổ hoặc thông qua thuộc tính {{domxref("WorkerGlobalScope.caches")}} trong worker.

> [!NOTE]
> Nếu {{domxref("Cache")}} được chỉ định không tồn tại, một bộ nhớ đệm
> mới sẽ được tạo với `cacheName` đó và một {{jsxref("Promise")}} phân giải
> thành đối tượng {{domxref("Cache")}} mới này được trả về.

## Cú pháp

```js-nolint
open(cacheName)
```

### Tham số

- `cacheName`
  - : Tên của bộ nhớ đệm bạn muốn mở.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành đối tượng {{domxref("Cache")}} được yêu cầu.

## Ví dụ

Ví dụ này lấy từ [ví dụ service worker đơn giản](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker) của MDN (xem [bản chạy trực tiếp của service worker đơn giản](https://bncb2v.csb.app/)).
Ở đây chúng ta chờ một {{domxref("InstallEvent")}} xảy ra, sau đó chạy
{{domxref("ExtendableEvent.waitUntil","waitUntil()")}} để xử lý quá trình cài đặt cho
ứng dụng. Việc này bao gồm gọi `CacheStorage.open()` để tạo một bộ nhớ đệm mới,
sau đó dùng {{domxref("Cache.addAll()")}} để thêm một loạt tài nguyên vào đó.

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
          "/gallery/bountyHunters.jpg",
          "/gallery/myLittleVader.jpg",
          "/gallery/snowTroopers.jpg",
        ]),
      ),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
