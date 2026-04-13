---
title: FetchEvent
slug: Web/API/FetchEvent
page-type: web-api-interface
browser-compat: api.FetchEvent
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Đây là kiểu sự kiện cho các sự kiện `fetch` được gửi đến {{domxref("ServiceWorkerGlobalScope", "phạm vi toàn cục service worker", "", 1)}}. Nó chứa thông tin về lần tìm nạp, bao gồm yêu cầu và cách trình nhận sẽ xử lý phản hồi. Nó cung cấp phương thức {{domxref("FetchEvent.respondWith", "event.respondWith()")}}, cho phép chúng ta cung cấp phản hồi cho lần tìm nạp này.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("FetchEvent.FetchEvent()", "FetchEvent()")}}
  - : Tạo một đối tượng `FetchEvent` mới. Hàm khởi tạo này thường không được dùng. Trình duyệt tạo các đối tượng này và cung cấp chúng cho các hàm callback sự kiện `fetch`.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ tổ tiên của nó, {{domxref("Event")}}_.

- {{domxref("FetchEvent.clientId")}} {{ReadOnlyInline}}
  - : {{domxref("Client.id", "id")}} của {{domxref("Client", "client")}} cùng nguồn gốc đã khởi tạo lần tìm nạp.
- {{domxref("FetchEvent.handled")}} {{ReadOnlyInline}}
  - : Một promise đang chờ trong khi sự kiện chưa được xử lý, và được thực hiện khi đã xử lý xong.
- {{domxref("FetchEvent.isReload")}} {{ReadOnlyInline}} {{Deprecated_inline}} {{Non-standard_inline}}
  - : Trả về `true` nếu sự kiện được gửi bởi người dùng đang cố tải lại trang, và `false` nếu không. Nhấn nút làm mới là tải lại, trong khi nhấp vào liên kết và nhấn nút quay lại thì không.
- {{domxref("FetchEvent.preloadResponse")}} {{ReadOnlyInline}}
  - : Một {{jsxref("Promise")}} cho {{domxref("Response")}}, hoặc `undefined` nếu lần tìm nạp này không phải là điều hướng, hoặc [tải trước điều hướng](/en-US/docs/Web/API/NavigationPreloadManager) không được bật.
- {{domxref("FetchEvent.replacesClientId")}} {{ReadOnlyInline}}
  - : {{domxref("Client.id", "id")}} của {{domxref("Client", "client")}} đang được thay thế trong quá trình điều hướng trang.
- {{domxref("FetchEvent.resultingClientId")}} {{ReadOnlyInline}}
  - : {{domxref("Client.id", "id")}} của {{domxref("Client", "client")}} thay thế client trước trong quá trình điều hướng trang.
- {{domxref("FetchEvent.request")}} {{ReadOnlyInline}}
  - : {{domxref("Request")}} mà trình duyệt dự định thực hiện.

## Phương thức phiên bản

_Kế thừa các phương thức từ phần tử cha, {{domxref("ExtendableEvent")}}_.

- {{domxref("FetchEvent.respondWith()")}}
  - : Ngăn chặn xử lý tìm nạp mặc định của trình duyệt, và tự cung cấp (promise cho) một phản hồi.
- {{domxref("ExtendableEvent.waitUntil()")}}
  - : Kéo dài thời gian sống của sự kiện. Được dùng để thông báo cho trình duyệt về các tác vụ kéo dài ngoài việc trả về phản hồi, chẳng hạn như streaming và bộ nhớ đệm.

## Ví dụ

Sự kiện fetch này sử dụng mặc định của trình duyệt cho các yêu cầu không phải GET.
Đối với các yêu cầu GET, nó cố trả về kết quả khớp trong bộ nhớ đệm, và dùng mạng dự phòng. Nếu tìm thấy kết quả khớp trong bộ nhớ đệm, nó cập nhật bộ nhớ đệm không đồng bộ cho lần sau.

```js
self.addEventListener("fetch", (event) => {
  // Để trình duyệt thực hiện mặc định của nó
  // cho các yêu cầu không phải GET.
  if (event.request.method !== "GET") return;

  // Ngăn chặn mặc định và tự xử lý yêu cầu.
  event.respondWith(
    (async () => {
      // Cố lấy phản hồi từ bộ nhớ đệm.
      const cache = await caches.open("dynamic-v1");
      const cachedResponse = await cache.match(event.request);

      if (cachedResponse) {
        // Nếu tìm thấy kết quả khớp trong bộ nhớ đệm, trả về nó, nhưng cũng
        // cập nhật mục trong bộ nhớ đệm trong nền.
        event.waitUntil(cache.add(event.request));
        return cachedResponse;
      }

      // Nếu không tìm thấy kết quả khớp trong bộ nhớ đệm, dùng mạng.
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

- [Sự kiện `fetch`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/fetch_event)
- {{jsxref("Promise")}}
- [Fetch API](/en-US/docs/Web/API/Fetch_API)
