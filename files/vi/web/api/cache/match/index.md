---
title: "Cache: phương thức match()"
short-title: match()
slug: Web/API/Cache/match
page-type: web-api-instance-method
browser-compat: api.Cache.match
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`match()`** của giao diện {{domxref("Cache")}} trả về một {{jsxref("Promise")}} được giải quyết thành {{domxref("Response")}} gắn với yêu cầu khớp đầu tiên trong đối tượng {{domxref("Cache")}}.
Nếu không tìm thấy kết quả khớp, {{jsxref("Promise")}} được giải quyết thành {{jsxref("undefined")}}.

## Cú pháp

```js-nolint
match(request)
match(request, options)
```

### Tham số

- `request`
  - : {{domxref("Request")}} mà bạn đang cố tìm các phản hồi tương ứng trong
    {{domxref("Cache")}}. Đây có thể là một đối tượng {{domxref("Request")}} hoặc một chuỗi URL.
- `options` {{optional_inline}}
  - : Một đối tượng đặt các tùy chọn cho thao tác `match`.
    Các tùy chọn sẵn có là:
    - `ignoreSearch`
      - : Giá trị boolean chỉ định liệu có bỏ qua
        chuỗi truy vấn trong URL hay không. Ví dụ, nếu đặt thành
        `true` thì phần `?value=bar` của
        `https://example.com/?value=bar` sẽ bị bỏ qua khi thực hiện đối sánh.
        Mặc định là `false`.
    - `ignoreMethod`
      - : Một giá trị boolean mà khi được đặt thành
        `true`, sẽ ngăn thao tác đối sánh xác thực phương thức `http` của
        {{domxref("Request")}} (thông thường chỉ cho phép `GET`
        và `HEAD`). Mặc định là `false`.
    - `ignoreVary`
      - : Một giá trị boolean mà khi được đặt thành
        `true`, sẽ yêu cầu thao tác đối sánh không thực hiện đối sánh header `VARY`
        — tức là, nếu URL khớp thì bạn sẽ nhận được kết quả khớp bất kể
        đối tượng {{domxref("Response")}} có header `VARY` hay không. Mặc định là `false`.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành {{domxref("Response")}} đầu tiên khớp
với yêu cầu, hoặc thành {{jsxref("undefined")}} nếu không tìm thấy kết quả khớp.

> [!NOTE]
> `Cache.match()` về cơ bản gần như giống hệt
> {{domxref("Cache.matchAll()")}}, ngoại trừ việc thay vì được giải quyết với một mảng gồm
> mọi phản hồi khớp, nó chỉ được giải quyết với phản hồi khớp đầu tiên (tức là
> `response[0]`).

## Ví dụ

Ví dụ này được lấy từ ví dụ [custom offline page](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/custom-offline-page/service-worker.js) ([bản demo trực tiếp](https://googlechrome.github.io/samples/service-worker/custom-offline-page/index.html)). Nó dùng cache để cung cấp dữ liệu đã chọn khi một yêu cầu thất bại. Một
điều khoản `catch()` sẽ được kích hoạt khi lời gọi `fetch()` ném ra một
ngoại lệ. Bên trong điều khoản `catch()`, `match()` được dùng để
trả về phản hồi thích hợp.

Trong ví dụ này, chỉ các tài liệu HTML được truy xuất bằng động từ HTTP GET mới được
lưu vào cache. Nếu điều kiện `if ()` của chúng ta là false, thì trình xử lý fetch này sẽ không
chặn yêu cầu. Nếu có bất kỳ trình xử lý fetch nào khác đã được đăng ký, chúng sẽ có
cơ hội gọi `event.respondWith()`. Nếu không có trình xử lý fetch nào gọi
`event.respondWith()`, yêu cầu sẽ được trình duyệt xử lý như thể không hề
có service worker tham gia. Nếu `fetch()` trả về một phản hồi HTTP hợp lệ
với mã phản hồi nằm trong dải 4xx hoặc 5xx, `catch()` sẽ
KHÔNG được gọi.

```js
self.addEventListener("fetch", (event) => {
  // We only want to call event.respondWith() if this is a GET request for an HTML document.
  if (
    event.request.method === "GET" &&
    event.request.headers.get("accept").includes("text/html")
  ) {
    console.log("Handling fetch event for", event.request.url);
    event.respondWith(
      fetch(event.request).catch((e) => {
        console.error("Fetch failed; returning offline page instead.", e);
        return caches
          .open(OFFLINE_CACHE)
          .then((cache) => cache.match(OFFLINE_URL));
      }),
    );
  }
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
