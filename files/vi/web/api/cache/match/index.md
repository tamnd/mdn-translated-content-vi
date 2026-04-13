---
title: "Cache: phương thức match()"
short-title: match()
slug: Web/API/Cache/match
page-type: web-api-instance-method
browser-compat: api.Cache.match
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`match()`** của giao diện {{domxref("Cache")}} trả về một {{jsxref("Promise")}} phân giải thành {{domxref("Response")}} liên kết với yêu cầu khớp đầu tiên trong đối tượng {{domxref("Cache")}}.
Nếu không tìm thấy kết quả khớp, {{jsxref("Promise")}} phân giải thành {{jsxref("undefined")}}.

## Cú pháp

```js-nolint
match(request)
match(request, options)
```

### Tham số

- `request`
  - : {{domxref("Request")}} mà bạn đang cố tìm phản hồi trong
    {{domxref("Cache")}}. Đây có thể là một đối tượng {{domxref("Request")}} hoặc một chuỗi URL.
- `options` {{optional_inline}}
  - : Một đối tượng đặt các tùy chọn cho thao tác `match`.
    Các tùy chọn có sẵn là:
    - `ignoreSearch`
      - : Một giá trị boolean chỉ định xem có nên
        bỏ qua chuỗi truy vấn trong URL hay không. Ví dụ: nếu đặt thành
        `true`, phần `?value=bar` của
        `https://example.com/?value=bar` sẽ bị bỏ qua khi thực hiện so khớp.
        Giá trị mặc định là `false`.
    - `ignoreMethod`
      - : Một giá trị boolean, khi đặt thành
        `true`, ngăn các thao tác so khớp xác thực phương thức
        {{domxref("Request")}} `http` (thường chỉ `GET`
        và `HEAD` được cho phép). Giá trị mặc định là `false`.
    - `ignoreVary`
      - : Một giá trị boolean, khi đặt thành
        `true`, yêu cầu thao tác so khớp không thực hiện so khớp tiêu đề
        `VARY` — tức nếu URL khớp bạn sẽ nhận được kết quả bất kể
        đối tượng {{domxref("Response")}} có tiêu đề `VARY` hay không. Giá trị
        mặc định là `false`.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành {{domxref("Response")}} đầu tiên khớp
với yêu cầu hoặc thành {{jsxref("undefined")}} nếu không tìm thấy kết quả khớp.

> [!NOTE]
> `Cache.match()` về cơ bản giống với
> {{domxref("Cache.matchAll()")}}, ngoại trừ việc thay vì phân giải thành một mảng
> chứa tất cả các phản hồi khớp, nó chỉ phân giải thành phản hồi khớp đầu tiên (tức là
> `response[0]`).

## Ví dụ

Ví dụ này lấy từ ví dụ [trang offline tùy biến](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/custom-offline-page/service-worker.js) ([live demo](https://googlechrome.github.io/samples/service-worker/custom-offline-page/index.html)). Nó dùng bộ nhớ đệm để cung cấp dữ liệu đã chọn khi một yêu cầu thất bại.
Mệnh đề `catch()` được kích hoạt khi lời gọi `fetch()` ném ra một
ngoại lệ. Bên trong mệnh đề `catch()`, `match()` được dùng để
trả về phản hồi đúng.

Trong ví dụ này, chỉ các tài liệu HTML truy xuất bằng động từ HTTP GET mới được
lưu đệm. Nếu điều kiện `if ()` sai, thì trình xử lý fetch này sẽ không
chặn yêu cầu. Nếu có bất kỳ trình xử lý fetch nào khác được đăng ký, chúng sẽ có cơ hội
gọi `event.respondWith()`. Nếu không có trình xử lý fetch nào gọi
`event.respondWith()`, yêu cầu sẽ được trình duyệt xử lý như thể không
có sự tham gia của service worker. Nếu `fetch()` trả về một phản hồi HTTP hợp lệ
với mã phản hồi trong khoảng 4xx hoặc 5xx, thì `catch()` sẽ
KHÔNG được gọi.

```js
self.addEventListener("fetch", (event) => {
  // Ta chỉ muốn gọi event.respondWith() nếu đây là yêu cầu GET cho tài liệu HTML.
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

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
