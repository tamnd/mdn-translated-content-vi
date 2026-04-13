---
title: InstallEvent
slug: Web/API/InstallEvent
page-type: web-api-interface
browser-compat: api.InstallEvent
---

{{APIRef("Service Workers API")}}

Tham số được truyền vào hàm xử lý sự kiện {{DOMxRef("ServiceWorkerGlobalScope.install_event", "install")}}, giao diện `InstallEvent` đại diện cho hành động cài đặt được gửi đến {{domxref("ServiceWorkerGlobalScope")}} của một {{domxref("ServiceWorker")}}. Là con của {{domxref("ExtendableEvent")}}, nó đảm bảo rằng các sự kiện chức năng như {{domxref("FetchEvent")}} không được gửi trong quá trình cài đặt.

Giao diện này kế thừa từ giao diện {{domxref("ExtendableEvent")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("InstallEvent.InstallEvent", "InstallEvent()")}} {{experimental_inline}}
  - : Tạo một đối tượng `InstallEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ thực thể cha, {{domxref("ExtendableEvent")}}_.

## Phương thức phiên bản

_Kế thừa các phương thức từ thực thể cha, {{domxref("ExtendableEvent")}}_.

- {{domxref("InstallEvent.addRoutes()", "addRoutes()")}} {{experimental_inline}}
  - : Chỉ định một hoặc nhiều tuyến tĩnh, định nghĩa các quy tắc tải tài nguyên được chỉ định và sẽ được sử dụng ngay cả trước khi service worker khởi động.

## Ví dụ

Đoạn code này lấy từ [service worker prefetch sample](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/prefetch/service-worker.js) (xem [prefetch running live](https://googlechrome.github.io/samples/service-worker/prefetch/).) Code gọi {{domxref("ExtendableEvent.waitUntil", "ExtendableEvent.waitUntil()")}} trong {{domxref("ServiceWorkerGlobalScope.install_event", "ServiceWorkerGlobalScope.oninstall")}} và trì hoãn xem xét worker {{domxref("ServiceWorkerRegistration.installing")}} đã được cài đặt cho đến khi promise được truyền vào giải quyết thành công. Promise giải quyết khi tất cả tài nguyên đã được tải và lưu vào cache, hoặc khi có bất kỳ ngoại lệ nào xảy ra.

Đoạn code cũng minh họa phương pháp tốt nhất để tạo phiên bản cache được service worker sử dụng. Mặc dù ví dụ này chỉ có một cache, bạn có thể dùng cách tiếp cận này cho nhiều cache. Code ánh xạ một mã định danh viết tắt cho cache đến một tên cache cụ thể, có phiên bản.

> [!NOTE]
> Các câu lệnh logging có thể xem được trong Google Chrome qua giao diện "Inspect" cho service worker liên quan được truy cập qua chrome://serviceworker-internals.

```js
const CACHE_VERSION = 1;
const CURRENT_CACHES = {
  prefetch: `prefetch-cache-v${CACHE_VERSION}`,
};

self.addEventListener("install", (event) => {
  const urlsToPrefetch = [
    "./static/pre_fetched.txt",
    "./static/pre_fetched.html",
    "https://www.chromium.org/_/rsrc/1302286216006/config/customLogo.gif",
  ];

  console.log(
    "Handling install event. Resources to pre-fetch:",
    urlsToPrefetch,
  );

  event.waitUntil(
    caches
      .open(CURRENT_CACHES["prefetch"])
      .then((cache) =>
        cache.addAll(
          urlsToPrefetch.map(
            (urlToPrefetch) => new Request(urlToPrefetch, { mode: "no-cors" }),
          ),
        ),
      )
      .then(() => {
        console.log("All resources have been fetched and cached.");
      })
      .catch((error) => {
        console.error("Pre-fetching failed:", error);
      }),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [sự kiện `install`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event)
- {{domxref("NotificationEvent")}}
- {{jsxref("Promise")}}
- [Fetch API](/en-US/docs/Web/API/Fetch_API)
