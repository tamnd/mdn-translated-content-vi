---
title: Cache
slug: Web/API/Cache
page-type: web-api-interface
browser-compat: api.Cache
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`Cache`** cung cấp một cơ chế lưu trữ bền vững cho các cặp đối tượng {{domxref("Request")}} / {{domxref("Response")}} được lưu đệm trong bộ nhớ lâu dài. Thời gian tồn tại của một đối tượng `Cache` phụ thuộc vào trình duyệt, nhưng các tập lệnh của một origin thường có thể dựa vào sự hiện diện của một đối tượng `Cache` đã được điền trước đó. Lưu ý rằng giao diện `Cache` được tiếp xúc cả trong phạm vi cửa sổ lẫn worker. Bạn không bắt buộc phải sử dụng nó cùng với service worker, dù nó được định nghĩa trong đặc tả service worker.

Một origin có thể có nhiều đối tượng `Cache` được đặt tên. Bạn chịu trách nhiệm triển khai cách tập lệnh của mình (ví dụ: trong một {{domxref("ServiceWorker")}}) xử lý các cập nhật `Cache`. Các mục trong một `Cache` không được cập nhật trừ khi được yêu cầu rõ ràng; chúng không hết hạn trừ khi bị xóa. Hãy dùng {{domxref("CacheStorage.open", "CacheStorage.open()")}} để mở một đối tượng `Cache` được đặt tên cụ thể rồi gọi bất kỳ phương thức nào của `Cache` để duy trì `Cache`.

Bạn cũng chịu trách nhiệm dọn dẹp định kỳ các mục trong bộ nhớ đệm. Mỗi trình duyệt có giới hạn cứng về dung lượng bộ nhớ đệm mà một origin nhất định có thể sử dụng. Ước tính mức sử dụng hạn ngạch `Cache` có sẵn thông qua phương thức {{domxref("StorageManager.estimate()")}}. Trình duyệt cố gắng hết sức để quản lý dung lượng đĩa, nhưng có thể xóa bộ nhớ đệm `Cache` của một origin. Trình duyệt thường sẽ xóa toàn bộ dữ liệu của một origin hoặc không xóa gì cả. Hãy đảm bảo phiên bản hóa các bộ nhớ đệm theo tên và chỉ sử dụng chúng từ phiên bản tập lệnh có thể thao tác an toàn trên đó. Xem [Xóa bộ nhớ đệm cũ](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers#deleting_old_caches) để biết thêm thông tin.

> [!NOTE]
> Thuật toán so khớp khóa phụ thuộc vào [tiêu đề VARY](https://www.fastly.com/blog/best-practices-using-vary-header) trong giá trị. Vì vậy việc so khớp một khóa mới cần nhìn vào cả khóa và giá trị của các mục trong đối tượng `Cache`.

> [!NOTE]
> API bộ nhớ đệm không tuân theo các tiêu đề HTTP caching.

## Phương thức thể hiện

- {{domxref("Cache.match()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành phản hồi liên kết với yêu cầu khớp đầu tiên trong đối tượng `Cache`.
- {{domxref("Cache.matchAll()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một mảng chứa tất cả các phản hồi khớp trong đối tượng `Cache`.
- {{domxref("Cache.add()")}}
  - : Nhận một URL, lấy dữ liệu từ đó và thêm đối tượng phản hồi kết quả vào bộ nhớ đệm đã cho. Chức năng này tương đương với việc gọi `fetch()`, sau đó dùng `put()` để thêm kết quả vào bộ nhớ đệm.
- {{domxref("Cache.addAll()")}}
  - : Nhận một mảng URL, lấy dữ liệu từ chúng và thêm các đối tượng phản hồi kết quả vào bộ nhớ đệm đã cho.
- {{domxref("Cache.put()")}}
  - : Nhận cả yêu cầu và phản hồi của nó rồi thêm vào bộ nhớ đệm đã cho.
- {{domxref("Cache.delete()")}}
  - : Tìm mục `Cache` có khóa là yêu cầu đó, trả về một {{jsxref("Promise")}} phân giải thành `true` nếu tìm thấy và xóa được mục `Cache` khớp. Nếu không tìm thấy mục `Cache` nào, promise phân giải thành `false`.
- {{domxref("Cache.keys()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một mảng chứa các khóa `Cache`.

## Ví dụ

Đoạn mã này lấy từ [mẫu caching chọn lọc của service worker](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/selective-caching/service-worker.js) (xem [live demo của selective caching](https://googlechrome.github.io/samples/service-worker/selective-caching/)). Mã dùng {{domxref("CacheStorage.open()")}} để mở bất kỳ đối tượng `Cache` nào có tiêu đề `Content-Type` bắt đầu bằng `font/`.

Sau đó mã dùng {{domxref("Cache.match()")}} để xem đã có phông chữ khớp nào trong bộ nhớ đệm hay chưa, và nếu có, trả về nó. Nếu không có phông chữ khớp, mã sẽ lấy phông chữ từ mạng và dùng {{domxref("Cache.put()")}} để lưu tài nguyên đã lấy vào bộ nhớ đệm.

Mã xử lý các ngoại lệ phát sinh từ thao tác {{domxref("Window/fetch", "fetch()")}}. Lưu ý rằng một phản hồi HTTP lỗi (ví dụ: 404) sẽ không kích hoạt ngoại lệ. Nó sẽ trả về một đối tượng phản hồi bình thường có mã lỗi phù hợp.

Đoạn mã cũng cho thấy một phương pháp hay nhất để phiên bản hóa các bộ nhớ đệm mà service worker sử dụng. Dù ví dụ này chỉ có một bộ nhớ đệm, cách tiếp cận tương tự có thể dùng cho nhiều bộ nhớ đệm được phiên bản hóa. Nó ánh xạ một định danh viết tắt cho một bộ nhớ đệm sang một tên bộ nhớ đệm được phiên bản hóa cụ thể. Mã cũng xóa tất cả các bộ nhớ đệm không có tên trong `CURRENT_CACHES`.

Trong ví dụ mã, `caches` là một thuộc tính của {{domxref("ServiceWorkerGlobalScope")}}. Nó chứa đối tượng `CacheStorage`, qua đó có thể truy cập giao diện {{domxref("CacheStorage")}}.

> [!NOTE]
> Trong Chrome, truy cập `chrome://inspect/#service-workers` và nhấp vào liên kết "inspect" bên dưới service worker đã đăng ký để xem các câu lệnh nhật ký cho các hành động khác nhau mà tập lệnh [`service-worker.js`](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/selective-caching/service-worker.js) đang thực hiện.

```js
const CACHE_VERSION = 1;
const CURRENT_CACHES = {
  font: `font-cache-v${CACHE_VERSION}`,
};

self.addEventListener("activate", (event) => {
  // Xóa mọi bộ nhớ đệm không có tên trong CURRENT_CACHES.
  // Dù ví dụ này chỉ có một bộ nhớ đệm, logic tương tự
  // sẽ xử lý trường hợp có nhiều bộ nhớ đệm được phiên bản hóa.
  const expectedCacheNamesSet = new Set(Object.values(CURRENT_CACHES));
  event.waitUntil(
    caches.keys().then((cacheNames) =>
      Promise.all(
        cacheNames.map((cacheName) => {
          if (!expectedCacheNamesSet.has(cacheName)) {
            // Nếu tên bộ nhớ đệm này không có trong tập hợp
            // tên bộ nhớ đệm "dự kiến", thì xóa nó.
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
          // Nếu có một mục trong bộ nhớ đệm cho event.request,
          // thì response sẽ được định nghĩa và ta có thể trả về nó.
          // Lưu ý trong ví dụ này chỉ các tài nguyên phông chữ được lưu đệm.
          console.log(" Found response in cache:", response);

          return response;
        }

        // Ngược lại, nếu không có mục nào trong bộ nhớ đệm cho event.request,
        // response sẽ là undefined, và ta cần fetch() tài nguyên.
        console.log(
          " No response for %s found in cache. About to fetch " +
            "from network…",
          event.request.url,
        );

        // Ta gọi .clone() trên request vì có thể dùng nó
        // trong lời gọi cache.put() sau này.
        // Cả fetch() và cache.put() đều "tiêu thụ" request,
        // nên ta cần tạo một bản sao.
        // (xem https://developer.mozilla.org/en-US/docs/Web/API/Request/clone)
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
            // Tránh lưu đệm các phản hồi mà ta biết là lỗi
            // (tức mã trạng thái HTTP 4xx hoặc 5xx).
            // Ta cũng chỉ muốn lưu đệm các phản hồi tương ứng
            // với phông chữ, tức có tiêu đề phản hồi Content-Type
            // bắt đầu bằng "font/".
            // Lưu ý rằng với các phản hồi đã lọc opaque
            // https://fetch.spec.whatwg.org/#concept-filtered-response-opaque
            // ta không thể truy cập tiêu đề phản hồi, nên bước kiểm tra này sẽ
            // luôn thất bại và phông chữ sẽ không được lưu đệm.
            // Tất cả Google Web Fonts được phục vụ từ tên miền hỗ trợ CORS,
            // nên đây không phải vấn đề ở đây.
            // Đây là điều cần lưu tâm nếu bạn định
            // lưu đệm tài nguyên khác từ tên miền cross-origin
            // không hỗ trợ CORS!
            console.log("  Caching the response to", event.request.url);
            // Ta gọi .clone() trên phản hồi để lưu một bản sao
            // vào bộ nhớ đệm. Bằng cách này, ta giữ được đối tượng
            // phản hồi gốc để trả về cho trang được kiểm soát.
            // https://developer.mozilla.org/en-US/docs/Web/API/Request/clone
            cache.put(event.request, response.clone());
          } else {
            console.log("  Not caching the response to", event.request.url);
          }

          // Trả về đối tượng phản hồi gốc, sẽ được dùng để
          // đáp ứng yêu cầu tài nguyên.
          return response;
        });
      })
      .catch((error) => {
        // catch() này sẽ xử lý ngoại lệ phát sinh từ thao tác match()
        // hoặc fetch().
        // Lưu ý rằng một phản hồi lỗi HTTP (ví dụ 404) sẽ KHÔNG kích hoạt
        // ngoại lệ.
        // Nó sẽ trả về một đối tượng phản hồi bình thường có mã lỗi phù hợp.
        console.error("  Error in fetch handler:", error);

        throw error;
      }),
  );
});
```

### Cookie và đối tượng Cache

[Fetch API](/en-US/docs/Web/API/Fetch_API) yêu cầu tiêu đề {{httpheader("Set-Cookie")}} bị loại bỏ trước khi trả về đối tượng {{domxref("Response")}} từ {{domxref("Window/fetch", "fetch()")}}. Vì vậy một `Response` được lưu trong `Cache` sẽ không chứa tiêu đề `Set-Cookie`, và do đó sẽ không khiến cookie nào được lưu.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service workers](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
