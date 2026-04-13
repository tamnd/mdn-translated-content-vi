---
title: "Response: phương thức tĩnh error()"
short-title: error()
slug: Web/API/Response/error_static
page-type: web-api-static-method
browser-compat: api.Response.error_static
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức tĩnh **`error()`** của giao diện {{domxref("Response")}} trả về một đối tượng `Response` mới gắn với lỗi mạng.

Điều này chủ yếu hữu ích khi viết service worker: nó cho phép service worker gửi phản hồi từ trình xử lý sự kiện {{domxref("ServiceWorkerGlobalScope.fetch_event", "fetch")}} để khiến lời gọi {{domxref("Window/fetch", "fetch()")}} trong mã ứng dụng chính bị reject.

Một phản hồi lỗi có {{domxref("Response.type","type")}} được đặt thành `error`.

## Cú pháp

```js-nolint
Response.error()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("Response")}}.

## Ví dụ

### Trả về lỗi mạng từ service worker

Giả sử một ứng dụng web có service worker với trình xử lý sự kiện `fetch` sau:

```js
// service-worker.js

self.addEventListener("fetch", (event) => {
  const url = new URL(event.request.url);
  if (url.pathname === "/salamander.jpg") {
    event.respondWith(Response.error());
  }
});
```

Với service worker này, mọi yêu cầu fetch từ ứng dụng sẽ đi qua service worker tới mạng, trừ yêu cầu lấy "salamander.jpg", yêu cầu này sẽ bị reject. Điều đó có nghĩa là mã ở main thread sau đây sẽ ném lỗi và handler `catch` sẽ chạy.

```js
// main.js

const image = document.querySelector("#image");

try {
  const response = await fetch("salamander.jpg");
  const blob = await response.blob();
  const objectURL = URL.createObjectURL(blob);
  image.src = objectURL;
} catch (e) {
  console.error(e);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
