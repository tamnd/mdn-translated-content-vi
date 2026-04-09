---
title: "Cache: phương thức add()"
short-title: add()
slug: Web/API/Cache/add
page-type: web-api-instance-method
browser-compat: api.Cache.add
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`add()`** của giao diện {{domxref("Cache")}} nhận một URL, truy xuất nó và thêm đối tượng phản hồi thu được vào cache đã cho.

Phương thức `add()` về mặt chức năng tương đương với:

```js
fetch(url).then((response) => {
  if (!response.ok) {
    throw new TypeError("bad response status");
  }
  return cache.put(url, response);
});
```

Với các thao tác phức tạp hơn, bạn sẽ cần dùng trực tiếp {{domxref("Cache.put","Cache.put()")}}.

> [!NOTE]
> `add()` sẽ ghi đè mọi cặp khóa/giá trị đã được lưu trước đó trong cache mà khớp với yêu cầu.

## Cú pháp

```js-nolint
add(request)
```

### Tham số

- `request`
  - : Một yêu cầu cho tài nguyên mà bạn muốn thêm vào cache. Đây có thể là một đối tượng {{domxref("Request")}} hoặc một URL.

    Tham số này được dùng như tham số cho bộ khởi tạo {{domxref("Request.Request()", "Request()")}}, nên URL tuân theo cùng quy tắc như bộ khởi tạo đó. Cụ thể, URL có thể là URL tương đối so với URL cơ sở, tức {{domxref("Node.baseURI", "baseURI")}} của tài liệu trong ngữ cảnh cửa sổ, hoặc {{domxref("WorkerGlobalScope.location")}} trong ngữ cảnh worker.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với `undefined`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Lược đồ URL không phải là `http` hoặc `https`.

    Trạng thái `Response` không nằm trong dải 200 (tức không phải phản hồi thành công). Điều này xảy ra nếu yêu cầu không trả về thành công, nhưng cũng xảy ra nếu yêu cầu là một yêu cầu _cross-origin no-cors_ (trong trường hợp đó trạng thái được báo cáo luôn là 0).

## Ví dụ

Khối mã này chờ một {{domxref("InstallEvent")}} được kích hoạt, rồi gọi {{domxref("ExtendableEvent.waitUntil","waitUntil()")}} để xử lý tiến trình cài đặt của ứng dụng. Việc này bao gồm gọi {{domxref("CacheStorage.open")}} để tạo một cache mới, sau đó dùng `Cache.add` để thêm một tài nguyên vào đó.

```js
this.addEventListener("install", (event) => {
  event.waitUntil(caches.open("v1").then((cache) => cache.add("/index.html")));
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Service Worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
