---
title: Bộ nhớ đệm
slug: Web/Progressive_web_apps/Guides/Caching
page-type: guide
sidebar: pwasidebar
---

Khi người dùng mở và tương tác với một website, tất cả tài nguyên mà website cần, bao gồm HTML, JavaScript, CSS, ảnh, phông chữ, cũng như mọi dữ liệu mà ứng dụng yêu cầu một cách tường minh, đều được truy xuất bằng các yêu cầu HTTP(S). Một trong những tính năng cơ bản nhất của PWA là khả năng lưu một số tài nguyên của ứng dụng vào bộ nhớ đệm trên thiết bị một cách tường minh, nghĩa là chúng có thể được truy xuất mà không cần gửi yêu cầu lên mạng.

Có hai lợi ích chính của việc lưu tài nguyên cục bộ trong bộ nhớ đệm: **hoạt động ngoại tuyến** và **đáp ứng**.

- **Hoạt động ngoại tuyến**: Bộ nhớ đệm cho phép PWA hoạt động ở mức độ này hay mức độ khác khi thiết bị không có kết nối mạng.
- **Đáp ứng**: Ngay cả khi thiết bị trực tuyến, PWA thường sẽ phản hồi nhanh hơn nhiều nếu giao diện người dùng của nó được lấy từ cache thay vì từ mạng.

Nhược điểm chính, tất nhiên, là **tính mới**: bộ nhớ đệm kém phù hợp hơn với các tài nguyên cần luôn cập nhật. Ngoài ra, với một số kiểu yêu cầu, chẳng hạn yêu cầu [POST](/en-US/docs/Web/HTTP/Reference/Methods/POST), bộ nhớ đệm không bao giờ phù hợp.

Điều này có nghĩa là việc có nên cache tài nguyên hay không và khi nào cần cache phụ thuộc rất nhiều vào chính tài nguyên đó, và một PWA thường sẽ dùng các chiến lược khác nhau cho các tài nguyên khác nhau. Trong hướng dẫn này, chúng ta sẽ xem một số chiến lược bộ nhớ đệm phổ biến cho PWA, và chiến lược nào phù hợp với tài nguyên nào.

## Tổng quan về công nghệ bộ nhớ đệm

Các công nghệ chính mà một PWA có thể dựa vào để xây dựng chiến lược bộ nhớ đệm là [Fetch API](/en-US/docs/Web/API/Fetch_API), [Service Worker API](/en-US/docs/Web/API/Service_Worker_API), và [Cache API](/en-US/docs/Web/API/Cache).

### Fetch API

Fetch API định nghĩa hàm toàn cục {{domxref("WorkerGlobalScope/fetch", "fetch()")}} để lấy tài nguyên mạng, cùng các giao diện {{domxref("Request")}} và {{domxref("Response")}} đại diện cho yêu cầu và phản hồi mạng. Hàm `fetch()` nhận một `Request` hoặc một URL làm đối số, và trả về một {{jsxref("Promise")}} sẽ được giải quyết thành một `Response`.

Hàm `fetch()` có sẵn cho service worker cũng như cho luồng ứng dụng chính.

### Service Worker API

Service worker là một phần của PWA: đó là một script riêng chạy trên luồng riêng, tách biệt với luồng chính của ứng dụng.

Khi service worker đã hoạt động, bất cứ khi nào ứng dụng yêu cầu một tài nguyên mạng mà service worker kiểm soát, trình duyệt sẽ phát một sự kiện gọi là {{domxref("ServiceWorkerGlobalScope.fetch_event", "fetch")}} trong global scope của service worker. Sự kiện này không chỉ được phát cho các lệnh gọi `fetch()` tường minh từ luồng chính, mà còn cho các yêu cầu mạng ngầm để tải trang và tài nguyên phụ (như JavaScript, CSS, và ảnh) do trình duyệt thực hiện khi điều hướng trang.

Bằng cách lắng nghe sự kiện `fetch`, service worker có thể chặn yêu cầu và trả về một `Response` tùy biến. Cụ thể, nó có thể trả về một phản hồi đã được cache cục bộ thay vì luôn đi tới mạng, hoặc trả về một phản hồi đã cache cục bộ nếu thiết bị đang ngoại tuyến.

### Cache API

Giao diện {{domxref("Cache")}} cung cấp lưu trữ lâu dài cho các cặp `Request`/`Response`. Nó cung cấp các phương thức để thêm và xóa các cặp `Request`/`Response`, và để tra cứu một `Response` đã cache khớp với một `Request` cụ thể. Cache có sẵn ở cả luồng ứng dụng chính và service worker: vì vậy một luồng có thể thêm phản hồi ở đó, và luồng kia có thể lấy lại.

Thông thường nhất, service worker sẽ thêm tài nguyên vào cache trong các trình xử lý sự kiện `install` hoặc `fetch`.

## Khi nào nên cache tài nguyên

PWA có thể cache tài nguyên bất kỳ lúc nào, nhưng trên thực tế có vài thời điểm mà đa số PWA sẽ chọn cache:

- **Trong trình xử lý sự kiện `install` của service worker (precaching)**: Khi một service worker được cài đặt, trình duyệt phát một sự kiện gọi là {{domxref("ServiceWorkerGlobalScope.install_event", "install")}} trong global scope của service worker. Tại thời điểm này, service worker có thể _precache_ tài nguyên, lấy chúng từ mạng và lưu vào cache.

  > [!NOTE]
  > Thời điểm cài đặt service worker không giống thời điểm cài đặt PWA. Sự kiện `install` của service worker diễn ra ngay khi service worker đã được tải xuống và thực thi, điều này thường xảy ra ngay khi người dùng truy cập site của bạn.
  >
  > Ngay cả khi người dùng không bao giờ cài đặt site của bạn như một PWA, service worker của nó vẫn sẽ được cài đặt và kích hoạt.

- **Trong trình xử lý sự kiện `fetch` của service worker**: Khi sự kiện `fetch` của service worker được phát, service worker có thể chuyển tiếp yêu cầu tới mạng và cache phản hồi nhận được, либо nếu cache chưa có phản hồi, либо để cập nhật phản hồi đã cache bằng một phản hồi mới hơn.

- **Khi phản hồi một yêu cầu của người dùng**: Một PWA có thể chủ động mời người dùng tải xuống tài nguyên để dùng sau này, khi thiết bị có thể ngoại tuyến. Ví dụ, một trình phát nhạc có thể mời người dùng tải bài hát về để phát sau. Trong trường hợp này, luồng ứng dụng chính có thể lấy tài nguyên và thêm phản hồi vào cache. Đặc biệt nếu tài nguyên được yêu cầu lớn, PWA có thể dùng [Background Fetch API](/en-US/docs/Web/API/Background_Fetch_API), và khi đó phản hồi sẽ được service worker xử lý, rồi thêm vào cache.

- **Theo định kỳ**: Dùng [Periodic Background Sync API](/en-US/docs/Web/API/Web_Periodic_Background_Synchronization_API), một service worker có thể lấy tài nguyên theo định kỳ và cache phản hồi, để bảo đảm PWA có thể phục vụ các phản hồi tương đối mới ngay cả khi thiết bị ngoại tuyến.

## Chiến lược bộ nhớ đệm

Chiến lược bộ nhớ đệm là một thuật toán quy định khi nào cache một tài nguyên, khi nào phục vụ tài nguyên đã cache, và khi nào lấy tài nguyên từ mạng. Ở phần này chúng ta sẽ tóm tắt một số chiến lược phổ biến.

Đây không phải là danh sách đầy đủ: nó chỉ nhằm minh họa các cách tiếp cận mà một PWA có thể dùng.

Một chiến lược bộ nhớ đệm cân bằng giữa hoạt động ngoại tuyến, độ đáp ứng, và tính mới. Các tài nguyên khác nhau có yêu cầu khác nhau ở đây: ví dụ, giao diện cơ bản của ứng dụng có thể khá tĩnh, trong khi việc hiển thị danh sách sản phẩm có thể đòi hỏi dữ liệu thật mới. Điều này có nghĩa là PWA thường sẽ áp dụng các chiến lược khác nhau cho các tài nguyên khác nhau, và một PWA đơn lẻ có thể dùng tất cả các chiến lược được mô tả ở đây.

### Cache trước

Trong chiến lược này, chúng ta sẽ precache một số tài nguyên, rồi triển khai chiến lược "cache trước" chỉ cho các tài nguyên đó. Cụ thể:

- Với các tài nguyên đã precache, chúng ta sẽ:
  - Tìm tài nguyên trong cache, và trả về tài nguyên nếu tìm thấy.
  - Nếu không, đi tới mạng. Nếu yêu cầu mạng thành công, cache tài nguyên cho lần sau.
- Với mọi tài nguyên khác, chúng ta sẽ luôn đi tới mạng.

Precache là chiến lược phù hợp cho các tài nguyên mà PWA chắc chắn cần, sẽ không thay đổi trong phiên bản ứng dụng này, và cần được lấy càng nhanh càng tốt. Điều đó bao gồm, chẳng hạn, giao diện người dùng cơ bản của ứng dụng. Nếu được precache, UI của ứng dụng có thể được dựng ngay khi khởi chạy mà không cần bất kỳ yêu cầu mạng nào.

Đầu tiên, service worker precache các tài nguyên tĩnh trong trình xử lý `install` của nó:

```js
const cacheName = "MyCache_1";
const precachedResources = ["/", "/app.js", "/style.css"];

async function precache() {
  const cache = await caches.open(cacheName);
  return cache.addAll(precachedResources);
}

self.addEventListener("install", (event) => {
  event.waitUntil(precache());
});
```

Trong trình xử lý `install`, chúng ta truyền kết quả của thao tác cache vào phương thức {{domxref("ExtendableEvent.waitUntil", "waitUntil()")}} của sự kiện. Điều này có nghĩa là nếu việc cache thất bại vì bất kỳ lý do gì, quá trình cài đặt service worker sẽ thất bại: ngược lại, nếu cài đặt thành công, service worker có thể chắc chắn rằng tài nguyên đã được thêm vào cache.

Trình xử lý `fetch` sẽ như sau:

```js
async function cacheFirst(request) {
  const cachedResponse = await caches.match(request);
  if (cachedResponse) {
    return cachedResponse;
  }
  try {
    const networkResponse = await fetch(request);
    if (networkResponse.ok) {
      const cache = await caches.open("MyCache_1");
      cache.put(request, networkResponse.clone());
    }
    return networkResponse;
  } catch (error) {
    return Response.error();
  }
}

self.addEventListener("fetch", (event) => {
  const url = new URL(event.request.url);
  if (precachedResources.includes(url.pathname)) {
    event.respondWith(cacheFirst(event.request));
  }
});
```

Chúng ta trả về tài nguyên bằng cách gọi phương thức {{domxref("FetchEvent.respondWith()", "respondWith()")}} của sự kiện. Nếu không gọi `respondWith()` cho một yêu cầu cụ thể, yêu cầu đó sẽ được gửi tới mạng như thể service worker không hề chặn nó. Vì vậy, nếu một yêu cầu không được precache, nó sẽ chỉ đi tới mạng.

Khi thêm `networkResponse` vào cache, chúng ta phải clone phản hồi và thêm bản sao vào cache, đồng thời trả về bản gốc. Lý do là các đối tượng `Response` có thể được truyền luồng, nên chỉ có thể đọc một lần.

Bạn có thể tự hỏi vì sao vẫn chuyển sang mạng với các tài nguyên đã precache. Nếu chúng đã được precache, chẳng phải ta có thể chắc chắn chúng sẽ có trong cache sao? Lý do là cache có thể bị xóa, bởi trình duyệt hoặc bởi người dùng. Dù điều này không thường xảy ra, nó sẽ làm PWA không thể dùng được nếu không thể quay lại mạng. Xem [Xóa dữ liệu đã cache](#deleting_cached_data).

### Cache trước với làm mới cache

Nhược điểm của "cache trước" là một khi phản hồi đã nằm trong cache, nó sẽ không bao giờ được làm mới cho tới khi một phiên bản mới của service worker được cài đặt.

Chiến lược "cache trước với làm mới cache", còn gọi là "stale while revalidate", tương tự "cache trước", ngoại trừ việc chúng ta luôn gửi yêu cầu tới mạng, kể cả sau khi cache hit, và dùng phản hồi để làm mới cache. Điều này có nghĩa là ta có được độ đáp ứng của "cache trước", nhưng vẫn nhận được phản hồi tương đối mới (miễn là yêu cầu được thực hiện đủ thường xuyên).

Đây là lựa chọn tốt khi độ đáp ứng quan trọng, và tính mới cũng quan trọng nhưng không phải yếu tố sống còn.

Trong phiên bản này, chúng ta triển khai "cache trước với làm mới cache" cho tất cả tài nguyên ngoại trừ JSON.

```js
function isCacheable(request) {
  const url = new URL(request.url);
  return !url.pathname.endsWith(".json");
}

async function cacheFirstWithRefresh(request) {
  const fetchResponsePromise = fetch(request).then(async (networkResponse) => {
    if (networkResponse.ok) {
      const cache = await caches.open("MyCache_1");
      cache.put(request, networkResponse.clone());
    }
    return networkResponse;
  });

  return (await caches.match(request)) || (await fetchResponsePromise);
}

self.addEventListener("fetch", (event) => {
  if (isCacheable(event.request)) {
    event.respondWith(cacheFirstWithRefresh(event.request));
  }
});
```

Lưu ý rằng chúng ta cập nhật cache không đồng bộ (trong một trình xử lý `then()`), nên ứng dụng không phải chờ phản hồi mạng trước khi có thể dùng phản hồi từ cache.

### Mạng trước

Chiến lược cuối cùng chúng ta xem xét, "mạng trước", là nghịch đảo của cache trước: chúng ta thử lấy tài nguyên từ mạng. Nếu yêu cầu mạng thành công, chúng ta trả về phản hồi và cập nhật cache. Nếu thất bại, chúng ta thử cache.

Điều này hữu ích cho những yêu cầu mà việc có phản hồi mới nhất là quan trọng, nhưng phản hồi đã cache vẫn tốt hơn không có gì. Danh sách tin nhắn gần đây của một ứng dụng nhắn tin có thể thuộc nhóm này.

Trong ví dụ dưới đây, chúng ta dùng "mạng trước" cho các yêu cầu lấy mọi tài nguyên nằm dưới đường dẫn "inbox" của ứng dụng.

```js
async function networkFirst(request) {
  try {
    const networkResponse = await fetch(request);
    if (networkResponse.ok) {
      const cache = await caches.open("MyCache_1");
      cache.put(request, networkResponse.clone());
    }
    return networkResponse;
  } catch (error) {
    const cachedResponse = await caches.match(request);
    return cachedResponse || Response.error();
  }
}

self.addEventListener("fetch", (event) => {
  const url = new URL(event.request.url);
  if (url.pathname.match(/^\/inbox/)) {
    event.respondWith(networkFirst(event.request));
  }
});
```

Vẫn còn những yêu cầu mà không có phản hồi nào còn hơn một phản hồi có thể đã cũ, và với chúng thì chỉ chiến lược "chỉ mạng" là phù hợp. Ví dụ, nếu ứng dụng đang hiển thị danh sách sản phẩm hiện có, người dùng sẽ khó chịu nếu danh sách này đã lỗi thời.

## Xóa dữ liệu đã cache

Cache có dung lượng lưu trữ giới hạn, và trình duyệt có thể xóa dữ liệu đã cache của ứng dụng nếu vượt quá giới hạn. Các giới hạn và hành vi cụ thể phụ thuộc vào từng trình duyệt: xem [Storage quotas and eviction criteria](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria) để biết chi tiết. Trên thực tế, việc xóa dữ liệu đã cache là một sự kiện rất hiếm. Người dùng cũng có thể xóa cache của ứng dụng bất cứ lúc nào.

PWA nên dọn dẹp mọi phiên bản cũ của cache trong sự kiện {{domxref("ServiceWorkerGlobalScope.activate_event", "activate")}} của service worker: khi sự kiện này được phát, service worker có thể chắc chắn rằng không còn phiên bản cũ nào của service worker đang chạy nữa, nên dữ liệu cache cũ không còn cần thiết.

## Xem thêm

- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
- [Fetch API](/en-US/docs/Web/API/Fetch_API)
- [Storage quotas and eviction criteria](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria)
- [Strategies for service worker caching](https://developer.chrome.com/docs/workbox/caching-strategies-overview) trên developer.chrome.com (2021)
- [The Offline Cookbook](https://web.dev/articles/offline-cookbook) trên web.dev (2020)
