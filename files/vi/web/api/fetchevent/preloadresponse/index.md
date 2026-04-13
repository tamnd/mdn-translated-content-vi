---
title: "FetchEvent: thuộc tính preloadResponse"
short-title: preloadResponse
slug: Web/API/FetchEvent/preloadResponse
page-type: web-api-instance-property
browser-compat: api.FetchEvent.preloadResponse
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`preloadResponse`** của giao diện {{domxref("FetchEvent")}} trả về một {{jsxref("Promise")}} giải quyết thành {{domxref("Response")}} tải trước điều hướng nếu [tải trước điều hướng](/en-US/docs/Web/API/NavigationPreloadManager) được kích hoạt, hoặc `undefined` nếu không.

Tải trước điều hướng được kích hoạt nếu [tải trước điều hướng được bật](/en-US/docs/Web/API/NavigationPreloadManager/enable), yêu cầu là yêu cầu `GET`, và yêu cầu là yêu cầu điều hướng (được trình duyệt tạo khi tải trang và iframe).

Một service worker có thể chờ promise này trong trình xử lý sự kiện fetch để theo dõi việc hoàn thành yêu cầu tìm nạp được thực hiện trong quá trình khởi động service worker.

## Giá trị

Một {{jsxref("Promise")}} giải quyết thành {{domxref("Response")}} hoặc `undefined`.

## Ví dụ

Đoạn mã này từ [Tăng tốc Service Worker với Navigation Preloads](https://web.dev/blog/navigation-preload).

Trình xử lý sự kiện {{domxref("ServiceWorkerGlobalScope.fetch_event", "onfetch")}} lắng nghe sự kiện `fetch`.
Khi được kích hoạt, trình xử lý gọi {{domxref("FetchEvent.respondWith", "FetchEvent.respondWith()")}} để truyền promise trở lại trang được kiểm soát.
Promise này sẽ giải quyết với tài nguyên được yêu cầu.

Nếu có yêu cầu URL khớp trong đối tượng {{domxref("Cache")}}, mã trả về promise để tìm nạp phản hồi từ bộ nhớ đệm.
Nếu không tìm thấy kết quả khớp trong bộ nhớ đệm, mã trả về promise trong `preloadResponse`.
Nếu không có phản hồi từ bộ nhớ đệm hoặc tải trước khớp, mã tìm nạp phản hồi từ mạng và trả về promise liên quan.

```js
addEventListener("fetch", (event) => {
  event.respondWith(
    (async () => {
      // Phản hồi từ bộ nhớ đệm nếu có thể
      const cachedResponse = await caches.match(event.request);
      if (cachedResponse) return cachedResponse;

      // Dùng phản hồi tải trước nếu có
      const response = await event.preloadResponse;
      if (response) return response;

      // Thử mạng nếu không có.
      return fetch(event.request);
    })(),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tăng tốc Service Worker với Navigation Preloads](https://web.dev/blog/navigation-preload)
- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service worker](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
