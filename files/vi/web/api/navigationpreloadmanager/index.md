---
title: NavigationPreloadManager
slug: Web/API/NavigationPreloadManager
page-type: web-api-interface
browser-compat: api.NavigationPreloadManager
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`NavigationPreloadManager`** của [Service Worker API](/en-US/docs/Web/API/Service_Worker_API) cung cấp các phương thức để quản lý việc tải trước tài nguyên song song với khởi động service worker.

Nếu được hỗ trợ, một đối tượng thuộc loại này được trả về bởi {{domxref("ServiceWorkerRegistration.navigationPreload")}}. Kết quả của yêu cầu tải trước được chờ bằng promise được trả về bởi {{domxref("FetchEvent.preloadResponse")}}.

## Phương thức phiên bản

- {{domxref("NavigationPreloadManager.enable()")}}
  - : Bật tải trước navigation, trả về một {{jsxref("Promise")}} phân giải với {{jsxref('undefined')}}.
- {{domxref("NavigationPreloadManager.disable()")}}
  - : Tắt tải trước navigation, trả về một {{jsxref("Promise")}} phân giải với {{jsxref('undefined')}}.
- {{domxref("NavigationPreloadManager.setHeaderValue()")}}
  - : Đặt giá trị của header HTTP {{HTTPHeader("Service-Worker-Navigation-Preload")}} được gửi trong các yêu cầu tải trước và trả về một {{jsxref("Promise")}} rỗng.
- {{domxref("NavigationPreloadManager.getState()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành đối tượng với các thuộc tính cho biết liệu tải trước có được bật hay không, và giá trị nào sẽ được gửi trong header HTTP {{HTTPHeader("Service-Worker-Navigation-Preload")}} trong các yêu cầu tải trước.

## Mô tả

Service worker xử lý các sự kiện {{domxref("Window/fetch", "fetch()")}} thay mặt cho một trang web, cho các trang trong một phạm vi nhất định. Khi người dùng điều hướng đến một trang sử dụng service worker, trình duyệt khởi động worker (nếu nó chưa chạy), sau đó gửi cho nó một sự kiện fetch và chờ kết quả. Khi nhận được sự kiện, worker trả về tài nguyên từ bộ nhớ đệm nếu có, hoặc tải tài nguyên từ máy chủ từ xa (lưu một bản sao để trả về trong các yêu cầu tương lai).

Service worker không thể xử lý các sự kiện từ trình duyệt cho đến khi nó khởi động. Điều này không thể tránh được, nhưng thường không có nhiều tác động. Service worker thường đã được khởi động (chúng vẫn hoạt động trong một thời gian sau khi xử lý các yêu cầu khác). Ngay cả khi service worker phải khởi động, phần lớn thời gian nó có thể trả về các giá trị từ bộ nhớ đệm, rất nhanh. Tuy nhiên, trong những trường hợp worker phải khởi động trước khi có thể bắt đầu tải tài nguyên từ xa, thì độ trễ có thể đáng kể.

`NavigationPreloadManager` cung cấp cơ chế cho phép tải tài nguyên chạy song song với việc khởi động service worker, để khi worker có thể xử lý yêu cầu fetch từ trình duyệt, tài nguyên có thể đã được tải xuống đầy đủ hoặc một phần. Điều này làm cho trường hợp worker phải khởi động "không tệ hơn" so với khi worker đã khởi động, và trong một số trường hợp còn tốt hơn.

Trình quản lý tải trước gửi header HTTP {{HTTPHeader("Service-Worker-Navigation-Preload")}} với các yêu cầu tải trước, cho phép các phản hồi được tùy chỉnh cho các yêu cầu tải trước. Điều này có thể được dùng, chẳng hạn, để giảm dữ liệu gửi xuống chỉ còn một phần của trang gốc, hoặc để tùy chỉnh phản hồi dựa trên trạng thái đăng nhập của người dùng.

## Ví dụ

Các ví dụ ở đây lấy từ [Speed up Service Worker with Navigation Preloads](https://web.dev/blog/navigation-preload) (developer.chrome.com).

### Phát hiện tính năng và bật tải trước navigation

Bên dưới, chúng ta bật tải trước navigation trong trình xử lý sự kiện `activate` của service worker, sau khi sử dụng {{domxref("ServiceWorkerRegistration.navigationPreload")}} để xác định xem tính năng có được hỗ trợ không (điều này trả về `NavigationPreloadManager` cho service worker hoặc `undefined` nếu tính năng không được hỗ trợ).

```js
addEventListener("activate", (event) => {
  event.waitUntil(
    (async () => {
      if (self.registration.navigationPreload) {
        // Enable navigation preloads!
        await self.registration.navigationPreload.enable();
      }
    })(),
  );
});
```

### Sử dụng phản hồi đã tải trước

Đoạn code sau cho thấy trình xử lý sự kiện fetch của service worker sử dụng phản hồi đã tải trước ({{domxref("FetchEvent.preloadResponse")}}).

Trình xử lý sự kiện `fetch` gọi {{domxref("FetchEvent.respondWith", "FetchEvent.respondWith()")}} để truyền promise trở lại trang được kiểm soát. Promise này sẽ phân giải với tài nguyên được yêu cầu, có thể từ bộ nhớ đệm, yêu cầu fetch đã tải trước, hoặc yêu cầu mạng mới.

Nếu có URL yêu cầu khớp trong đối tượng {{domxref("Cache")}}, code trả về promise đã giải quyết để tải phản hồi từ bộ nhớ đệm. Nếu không tìm thấy trong bộ nhớ đệm, code trả về phản hồi đã tải trước đã giải quyết ({{domxref("FetchEvent.preloadResponse")}}). Nếu không có mục bộ nhớ đệm khớp hoặc phản hồi đã tải trước, code bắt đầu thao tác fetch mới từ mạng và trả về promise (chưa giải quyết) cho thao tác fetch đó.

```js
addEventListener("fetch", (event) => {
  event.respondWith(
    (async () => {
      // Respond from the cache if we can
      const cachedResponse = await caches.match(event.request);
      if (cachedResponse) return cachedResponse;

      // Else, use the preloaded response, if it's there
      const response = await event.preloadResponse;
      if (response) return response;

      // Else try the network.
      return fetch(event.request);
    })(),
  );
});
```

### Phản hồi tùy chỉnh

Trình duyệt gửi header HTTP {{HTTPHeader("Service-Worker-Navigation-Preload")}} cùng với các yêu cầu tải trước, với giá trị directive mặc định là `true`. Điều này cho phép máy chủ phân biệt giữa các yêu cầu fetch thông thường và yêu cầu tải trước, và gửi các phản hồi khác nhau trong từng trường hợp nếu cần.

> [!NOTE]
> Nếu phản hồi từ tải trước và thao tác fetch thông thường có thể khác nhau, thì máy chủ phải đặt `Vary: Service-Worker-Navigation-Preload` để đảm bảo các phản hồi khác nhau được lưu vào bộ nhớ đệm.

Giá trị header có thể được thay đổi thành bất kỳ giá trị chuỗi nào khác bằng cách sử dụng {{domxref("NavigationPreloadManager.setHeaderValue()")}} để cung cấp thêm ngữ cảnh cho thao tác tải trước. Ví dụ: bạn có thể đặt giá trị thành ID của tài nguyên được lưu vào bộ nhớ đệm gần đây nhất, để máy chủ sẽ không trả về bất kỳ tài nguyên nào trừ khi chúng thực sự cần thiết.

```js
navigator.serviceWorker.ready
  .then((registration) =>
    registration.navigationPreload.setHeaderValue(newValue),
  )
  .then(() => {
    console.log("Done!");
  });
```

### Lấy trạng thái

Bạn có thể sử dụng {{domxref("NavigationPreloadManager.getState()")}} để kiểm tra xem tải trước navigation có được bật hay không và để xác định giá trị directive nào được gửi cùng với header HTTP {{HTTPHeader("Service-Worker-Navigation-Preload")}} cho các yêu cầu tải trước.

```js
navigator.serviceWorker.ready
  .then((registration) => registration.navigationPreload.getState())
  .then((state) => {
    console.log(state.enabled); // boolean
    console.log(state.headerValue); // string
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Speed up Service Worker with Navigation Preloads](https://web.dev/blog/navigation-preload) (developer.chrome.com)
