---
title: Cache
slug: Web/API/Cache
page-type: web-api-interface
browser-compat: api.Cache
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`Cache`** cung cấp một cơ chế lưu trữ bền vững cho các cặp đối tượng {{domxref("Request")}} / {{domxref("Response")}} được lưu đệm trong bộ nhớ tồn tại lâu dài. Thời gian sống của một đối tượng `Cache` phụ thuộc vào trình duyệt, nhưng script của một origin đơn lẻ thường có thể trông cậy vào sự hiện diện của một đối tượng `Cache` đã được điền trước đó. Lưu ý rằng giao diện `Cache` được phơi bày cho cả phạm vi cửa sổ lẫn worker. Bạn không bắt buộc phải dùng nó cùng với service worker, dù nó được định nghĩa trong đặc tả service worker.

Một origin có thể có nhiều đối tượng `Cache` được đặt tên. Bạn chịu trách nhiệm triển khai cách script của mình (ví dụ trong một {{domxref("ServiceWorker")}}) xử lý việc cập nhật `Cache`. Các mục trong `Cache` sẽ không được cập nhật trừ khi được yêu cầu rõ ràng; chúng cũng không tự hết hạn trừ khi bị xóa. Hãy dùng {{domxref("CacheStorage.open", "CacheStorage.open()")}} để mở một đối tượng `Cache` có tên cụ thể, rồi gọi bất kỳ phương thức nào của `Cache` để duy trì `Cache`.

Bạn cũng chịu trách nhiệm định kỳ dọn các mục cache. Mỗi trình duyệt đều có một giới hạn cứng về dung lượng lưu trữ cache mà một origin nhất định có thể sử dụng. Có thể ước lượng mức dùng quota của `Cache` qua phương thức {{domxref("StorageManager.estimate()")}}. Trình duyệt sẽ cố gắng hết sức để quản lý dung lượng đĩa, nhưng nó có thể xóa vùng lưu trữ `Cache` của một origin. Thông thường, trình duyệt sẽ xóa toàn bộ dữ liệu của một origin hoặc không xóa gì cả. Hãy đảm bảo bạn quản lý phiên bản cache theo tên và chỉ dùng cache từ phiên bản script có thể vận hành an toàn với chúng. Xem [Xóa cache cũ](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers#deleting_old_caches) để biết thêm thông tin.

> [!NOTE]
> Thuật toán đối sánh khóa phụ thuộc vào [header VARY](https://www.fastly.com/blog/best-practices-using-vary-header) trong giá trị. Vì vậy, khi đối sánh một khóa mới, cần xem xét cả khóa lẫn giá trị của các mục trong đối tượng `Cache`.

> [!NOTE]
> Caching API không tuân theo các header lưu đệm HTTP.

## Phương thức thực thể

- {{domxref("Cache.match()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết thành phản hồi gắn với yêu cầu khớp đầu tiên trong đối tượng `Cache`.
- {{domxref("Cache.matchAll()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết thành một mảng gồm mọi phản hồi khớp trong đối tượng `Cache`.
- {{domxref("Cache.add()")}}
  - : Nhận một URL, truy xuất nó và thêm đối tượng phản hồi thu được vào cache đã cho. Về mặt chức năng, điều này tương đương với việc gọi `fetch()`, rồi dùng `put()` để thêm kết quả vào cache.
- {{domxref("Cache.addAll()")}}
  - : Nhận một mảng URL, truy xuất chúng và thêm các đối tượng phản hồi thu được vào cache đã cho.
- {{domxref("Cache.put()")}}
  - : Nhận cả một yêu cầu lẫn phản hồi của nó và thêm chúng vào cache đã cho.
- {{domxref("Cache.delete()")}}
  - : Tìm mục `Cache` có khóa là yêu cầu, trả về một {{jsxref("Promise")}} được giải quyết thành `true` nếu tìm thấy và xóa được một mục `Cache` khớp. Nếu không tìm thấy mục `Cache` nào, promise được giải quyết thành `false`.
- {{domxref("Cache.keys()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết thành một mảng các khóa của `Cache`.

## Ví dụ

Đoạn mã này lấy từ [mẫu service worker selective caching](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/selective-caching/service-worker.js) (xem [bản chạy thử selective caching](https://googlechrome.github.io/samples/service-worker/selective-caching/)). Mã dùng {{domxref("CacheStorage.open()")}} để mở mọi đối tượng `Cache` có header `Content-Type` bắt đầu bằng `font/`.

Sau đó, mã dùng {{domxref("Cache.match()")}} để kiểm tra xem trong cache đã có phông chữ khớp hay chưa; nếu có thì trả về ngay. Nếu không có phông chữ khớp, mã sẽ lấy phông chữ từ mạng và dùng {{domxref("Cache.put()")}} để lưu đệm tài nguyên đã lấy.

Mã xử lý các ngoại lệ phát sinh từ thao tác {{domxref("Window/fetch", "fetch()")}}. Lưu ý rằng phản hồi lỗi HTTP (ví dụ 404) sẽ không gây ra ngoại lệ. Nó sẽ trả về một đối tượng phản hồi bình thường với mã lỗi thích hợp.

Đoạn mã này cũng cho thấy một thực hành tốt để quản lý phiên bản cache mà service worker sử dụng. Dù trong ví dụ này chỉ có một cache, cùng cách tiếp cận đó vẫn dùng được cho nhiều cache. Nó ánh xạ một mã định danh rút gọn của cache sang một tên cache cụ thể có phiên bản. Mã cũng xóa mọi cache không được nêu trong `CURRENT_CACHES`.

Trong ví dụ mã này, `caches` là một thuộc tính của {{domxref("ServiceWorkerGlobalScope")}}. Nó nắm giữ đối tượng `CacheStorage`, qua đó có thể truy cập giao diện {{domxref("CacheStorage")}}.

> [!NOTE]
> Trong Chrome, truy cập `chrome://inspect/#service-workers` rồi nhấp liên kết "inspect" bên dưới service worker đã đăng ký để xem các câu lệnh ghi log cho nhiều hành động mà script [`service-worker.js`](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/selective-caching/service-worker.js) đang thực hiện.

```js
const CACHE_VERSION = 1;
const CURRENT_CACHES = {
  font: `font-cache-v${CACHE_VERSION}`,
};

self.addEventListener("activate", (event) => {
  // Delete all caches that aren't named in CURRENT_CACHES.
  // While there is only one cache in this example, the same logic
  // will handle the case where there are multiple versioned caches.
  const expectedCacheNamesSet = new Set(Object.values(CURRENT_CACHES));
  event.waitUntil(
    caches.keys().then((cacheNames) =>
      Promise.all(
        cacheNames.map((cacheName) => {
          if (!expectedCacheNamesSet.has(cacheName)) {
            // If this cache name isn't present in the set of
            // "expected" cache names, then delete it.
            console.log("Deleting out of date cache:", cacheName);
            return caches.delete(cacheName);
          }
          return undefined;
        }),
      ),
    ),
  );
});

self.addEventListener("fetch", (event) => {
  console.log("Handling fetch event for", event.request.url);

  event.respondWith(
    caches
      .open(CURRENT_CACHES.font)
      .then((cache) => cache.match(event.request))
      .then((response) => {
        if (response) {
          // If there is an entry in the cache for event.request,
          // then response will be defined and we can just return it.
          // Note that in this example, only font resources are cached.
          console.log(" Found response in cache:", response);

          return response;
        }

        // Otherwise, if there is no entry in the cache for event.request,
        // response will be undefined, and we need to fetch() the resource.
        console.log(
          " No response for %s found in cache. About to fetch " +
            "from network…",
          event.request.url,
        );

        // We call .clone() on the request since we might use it
        // in a call to cache.put() later on.
        // Both fetch() and cache.put() "consume" the request,
        // so we need to make a copy.
        // (see https://developer.mozilla.org/en-US/docs/Web/API/Request/clone)
        return fetch(event.request.clone()).then((response) => {
          console.log(
            "  Response for %s from network is: %O",
            event.request.url,
            response,
          );

          if (
            response.status < 400 &&
            response.headers.has("content-type") &&
            response.headers.get("content-type").match(/^font\//i)
          ) {
            // This avoids caching responses that we know are errors
            // (i.e. HTTP status code of 4xx or 5xx).
            // We also only want to cache responses that correspond
            // to fonts, i.e. have a Content-Type response header that
            // starts with "font/".
            // Note that for opaque filtered responses
            // https://fetch.spec.whatwg.org/#concept-filtered-response-opaque
            // we can't access to the response headers, so this check will
            // always fail and the font won't be cached.
            // All of the Google Web Fonts are served from a domain that
            // supports CORS, so that isn't an issue here.
            // It is something to keep in mind if you're attempting
            // to cache other resources from a cross-origin
            // domain that doesn't support CORS, though!
            console.log("  Caching the response to", event.request.url);
            // We call .clone() on the response to save a copy of it
            // to the cache. By doing so, we get to keep the original
            // response object which we will return back to the controlled
            // page.
            // https://developer.mozilla.org/en-US/docs/Web/API/Request/clone
            cache.put(event.request, response.clone());
          } else {
            console.log("  Not caching the response to", event.request.url);
          }

          // Return the original response object, which will be used to
          // fulfill the resource request.
          return response;
        });
      })
      .catch((error) => {
        // This catch() will handle exceptions that arise from the match()
        // or fetch() operations.
        // Note that a HTTP error response (e.g. 404) will NOT trigger
        // an exception.
        // It will return a normal response object that has the appropriate
        // error code set.
        console.error("  Error in fetch handler:", error);

        throw error;
      }),
  );
});
```

### Cookie và đối tượng Cache

[Fetch API](/en-US/docs/Web/API/Fetch_API) yêu cầu các header {{httpheader("Set-Cookie")}} phải bị loại bỏ trước khi trả về một đối tượng {{domxref("Response")}} từ {{domxref("Window/fetch", "fetch()")}}. Vì vậy, một `Response` được lưu trong `Cache` sẽ không chứa header `Set-Cookie`, và do đó cũng sẽ không làm bất kỳ cookie nào được lưu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Service Worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã service worker cơ bản](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Dùng web worker](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
