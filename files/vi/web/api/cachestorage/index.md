---
title: CacheStorage
slug: Web/API/CacheStorage
page-type: web-api-interface
browser-compat: api.CacheStorage
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`CacheStorage`** đại diện cho nơi lưu trữ các đối tượng {{domxref("Cache")}}.

Giao diện này:

- Cung cấp một thư mục gốc của mọi bộ nhớ đệm có tên mà {{domxref("ServiceWorker")}}, kiểu worker khác hoặc phạm vi {{domxref("window")}} có thể truy cập được (bạn không bị giới hạn chỉ dùng nó với service worker).
- Duy trì ánh xạ giữa tên chuỗi và các đối tượng {{domxref("Cache")}} tương ứng.

Hãy dùng {{domxref("CacheStorage.open()")}} để lấy một thể hiện {{domxref("Cache")}}.

Hãy dùng {{domxref("CacheStorage.match()")}} để kiểm tra xem một {{domxref("Request")}} cho trước có phải là khóa trong bất kỳ đối tượng {{domxref("Cache")}} nào mà đối tượng `CacheStorage` theo dõi hay không.

Bạn có thể truy cập `CacheStorage` thông qua thuộc tính {{domxref("Window.caches")}} trong cửa sổ hoặc thông qua thuộc tính {{domxref("WorkerGlobalScope.caches")}} trong worker.

> [!NOTE]
> `CacheStorage` luôn từ chối bằng `SecurityError` trên các origin không đáng tin cậy (tức là những origin không dùng HTTPS, dù định nghĩa này có thể sẽ phức tạp hơn trong tương lai). Khi thử nghiệm trên Firefox, bạn có thể vượt qua hạn chế này bằng cách bật tùy chọn **Enable Service Workers over HTTP (when toolbox is open)** trong menu tùy chọn/biểu tượng bánh răng của Firefox DevTools. Ngoài ra, vì `CacheStorage` yêu cầu truy cập hệ thống tệp, nên nó có thể không dùng được trong chế độ riêng tư của Firefox.

> [!NOTE]
> {{domxref("CacheStorage.match()")}} là một phương thức tiện lợi. Bạn có thể triển khai chức năng tương đương để so khớp một mục trong bộ nhớ đệm bằng cách lấy một mảng tên bộ nhớ đệm từ {{domxref("CacheStorage.keys()")}}, mở từng bộ nhớ đệm bằng {{domxref("CacheStorage.open()")}}, rồi so khớp mục bạn muốn bằng {{domxref("Cache.match()")}}.

## Phương thức thể hiện

- {{domxref("CacheStorage.match()")}}
  - : Kiểm tra xem một {{domxref("Request")}} cho trước có phải là khóa trong bất kỳ đối tượng {{domxref("Cache")}} nào mà `CacheStorage` theo dõi hay không, và trả về một {{jsxref("Promise")}} phân giải thành kết quả so khớp đó.
- {{domxref("CacheStorage.has()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành `true` nếu tồn tại đối tượng {{domxref("Cache")}} khớp với `cacheName`.
- {{domxref("CacheStorage.open()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành đối tượng {{domxref("Cache")}} khớp với `cacheName` (một bộ nhớ đệm mới sẽ được tạo nếu nó chưa tồn tại).
- {{domxref("CacheStorage.delete()")}}
  - : Tìm đối tượng {{domxref("Cache")}} khớp với `cacheName`, và nếu tìm thấy, xóa đối tượng {{domxref("Cache")}} đó rồi trả về một {{jsxref("Promise")}} phân giải thành `true`. Nếu không tìm thấy đối tượng {{domxref("Cache")}} nào, promise sẽ phân giải thành `false`.
- {{domxref("CacheStorage.keys()")}}
  - : Trả về một {{jsxref("Promise")}} sẽ phân giải với một mảng chứa các chuỗi tương ứng với mọi đối tượng {{domxref("Cache")}} có tên mà `CacheStorage` đang theo dõi. Dùng phương thức này để duyệt qua danh sách tất cả các đối tượng {{domxref("Cache")}}.

## Ví dụ

Đoạn mã này lấy từ [ví dụ service worker đơn giản](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker) của MDN (xem [bản chạy trực tiếp của ví dụ service worker đơn giản](https://bncb2v.csb.app/)).
Tập lệnh service worker này chờ sự kiện {{domxref("ServiceWorkerGlobalScope/install_event", "install")}} được kích hoạt, sau đó chạy {{domxref("ExtendableEvent.waitUntil","waitUntil")}} để xử lý quá trình cài đặt cho ứng dụng. Việc này bao gồm gọi {{domxref("CacheStorage.open")}} để tạo một bộ nhớ đệm mới, rồi dùng {{domxref("Cache.addAll")}} để thêm một loạt tài nguyên vào đó.

Trong khối mã thứ hai, chúng ta chờ một {{domxref("FetchEvent")}} xảy ra. Chúng ta tạo một phản hồi tùy biến như sau:

1. Kiểm tra xem có tìm thấy mục khớp với yêu cầu trong CacheStorage hay không. Nếu có, phục vụ mục đó.
2. Nếu không, lấy yêu cầu từ mạng, sau đó cũng mở bộ nhớ đệm đã tạo trong khối đầu tiên và thêm một bản sao của yêu cầu vào đó bằng {{domxref("Cache.put")}} (`cache.put(event.request, response.clone())`).
3. Nếu việc này thất bại (ví dụ do mạng bị ngắt), trả về một phản hồi dự phòng.

Cuối cùng, trả về bất cứ giá trị nào mà phản hồi tùy biến nhận được, bằng cách dùng {{domxref("FetchEvent.respondWith")}}.

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

self.addEventListener("fetch", (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      // caches.match() luôn phân giải
      // nhưng nếu thành công thì response sẽ có giá trị
      if (response !== undefined) {
        return response;
      }
      return fetch(event.request)
        .then((response) => {
          // response chỉ có thể được dùng một lần
          // cần lưu bản sao để đặt một bản vào cache
          // và phục vụ bản còn lại
          let responseClone = response.clone();

          caches
            .open("v1")
            .then((cache) => cache.put(event.request, responseClone));
          return response;
        })
        .catch(() => caches.match("/gallery/myLittleVader.jpg"));
    }),
  );
});
```

Đoạn này cho thấy API có thể được dùng ngoài ngữ cảnh service worker, và dùng toán tử `await` để mã dễ đọc hơn nhiều.

```js
// Cố lấy dữ liệu từ cache, nếu không có thì lấy trực tiếp.
async function getData() {
  const cacheVersion = 1;
  const cacheName = `myapp-${cacheVersion}`;
  const url = "https://jsonplaceholder.typicode.com/todos/1";
  let cachedData = await getCachedData(cacheName, url);

  if (cachedData) {
    console.log("Retrieved cached data");
    return cachedData;
  }

  console.log("Fetching fresh data");

  const cacheStorage = await caches.open(cacheName);
  await cacheStorage.add(url);
  cachedData = await getCachedData(cacheName, url);
  await deleteOldCaches(cacheName);

  return cachedData;
}

// Lấy dữ liệu từ cache.
async function getCachedData(cacheName, url) {
  const cacheStorage = await caches.open(cacheName);
  const cachedResponse = await cacheStorage.match(url);

  if (!cachedResponse || !cachedResponse.ok) {
    return false;
  }

  return await cachedResponse.json();
}

// Xóa mọi cache cũ để tôn trọng dung lượng đĩa của người dùng.
async function deleteOldCaches(currentCache) {
  const keys = await caches.keys();

  for (const key of keys) {
    const isOurCache = key.startsWith("myapp-");
    if (currentCache === key || !isOurCache) {
      continue;
    }
    caches.delete(key);
  }
}

try {
  const data = await getData();
  console.log({ data });
} catch (error) {
  console.error({ error });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
- [Chế độ duyệt web riêng tư / ẩn danh](/en-US/docs/Web/API/Web_Storage_API#private_browsing_incognito_modes)
