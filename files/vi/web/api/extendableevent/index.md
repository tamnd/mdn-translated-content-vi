---
title: ExtendableEvent
slug: Web/API/ExtendableEvent
page-type: web-api-interface
browser-compat: api.ExtendableEvent
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Giao diện **`ExtendableEvent`** mở rộng vòng đời của các sự kiện [`install`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event) và [`activate`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/activate_event) được phát ra trên phạm vi toàn cục như một phần của vòng đời service worker. Điều này đảm bảo rằng các sự kiện chức năng (như {{domxref("FetchEvent")}}) không được phát ra cho đến khi nó nâng cấp lược đồ cơ sở dữ liệu và xóa các mục nhập bộ nhớ đệm lỗi thời.

Nếu {{domxref("ExtendableEvent.waitUntil","waitUntil()")}} được gọi bên ngoài trình xử lý `ExtendableEvent`, trình duyệt sẽ ném ra `InvalidStateError`; lưu ý rằng nhiều lần gọi sẽ xếp chồng lên nhau và các promise kết quả sẽ được thêm vào danh sách [extend lifetime promises](https://w3c.github.io/ServiceWorker/#extendableevent-extend-lifetime-promises).

Giao diện này kế thừa từ giao diện {{domxref("Event")}}.

{{InheritanceDiagram}}

> [!NOTE]
> Giao diện này chỉ khả dụng khi phạm vi toàn cục là {{domxref("ServiceWorkerGlobalScope")}}. Nó không khả dụng khi là {{domxref("Window")}}, hoặc phạm vi của một loại worker khác.

## Hàm khởi tạo

- {{domxref("ExtendableEvent.ExtendableEvent()", "ExtendableEvent()")}}
  - : Tạo một đối tượng `ExtendableEvent` mới.

## Thuộc tính phiên bản

_Không thực hiện bất kỳ thuộc tính cụ thể nào, nhưng kế thừa các thuộc tính từ đối tượng cha, {{domxref("Event")}}._

## Phương thức phiên bản

_Kế thừa các phương thức từ đối tượng cha, {{domxref("Event")}}_.

- {{domxref("ExtendableEvent.waitUntil", "ExtendableEvent.waitUntil()")}}
  - : Mở rộng vòng đời của sự kiện. Nó được thiết kế để được gọi trong trình xử lý sự kiện [`install`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event) cho worker đang cài đặt và trên trình xử lý sự kiện [`activate`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/activate_event) cho worker đang hoạt động.

## Ví dụ

Đoạn code này lấy từ [service worker prefetch sample](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/prefetch/service-worker.js). Code gọi {{domxref("ExtendableEvent.waitUntil()")}} trong {{domxref("ServiceWorkerGlobalScope.install_event", "oninstall")}}, trì hoãn việc coi worker đang cài đặt là đã cài đặt cho đến khi promise được truyền vào giải quyết thành công.

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

- [Using Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Service workers basic code example](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Using web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
