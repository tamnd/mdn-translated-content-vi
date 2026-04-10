---
title: Request
slug: Web/API/Request
page-type: web-api-interface
browser-compat: api.Request
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Giao diện **`Request`** của [Fetch API](/en-US/docs/Web/API/Fetch_API) đại diện cho một yêu cầu tài nguyên.

Bạn có thể tạo một đối tượng `Request` mới bằng hàm khởi tạo {{domxref("Request.Request","Request()")}}, nhưng thường gặp hơn là nhận một đối tượng `Request` được trả về từ một thao tác API khác, chẳng hạn `FetchEvent.request` của service worker.

## Constructor

- {{domxref("Request.Request","Request()")}}
  - : Tạo một đối tượng `Request` mới.

## Thuộc tính thể hiện

- {{domxref("Request.body")}} {{ReadOnlyInline}}
  - : Một {{domxref("ReadableStream")}} chứa nội dung body.
- {{domxref("Request.bodyUsed")}} {{ReadOnlyInline}}
  - : Trả về `true` hoặc `false` để cho biết body đã được dùng trong request hay chưa.
- {{domxref("Request.cache")}} {{ReadOnlyInline}}
  - : Chứa chế độ cache của request, ví dụ `default`, `reload`, `no-cache`.
- {{domxref("Request.credentials")}} {{ReadOnlyInline}}
  - : Chứa giá trị điều khiển việc có bao gồm thông tin xác thực trong request hay không, ví dụ `omit`, `same-origin`, `include`. Mặc định là `same-origin`.
- {{domxref("Request.destination")}} {{ReadOnlyInline}}
  - : Chuỗi mô tả loại nội dung đang được yêu cầu.
- {{domxref("Request.duplex")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Chế độ duplex của request, xác định việc trình duyệt có phải gửi toàn bộ request trước khi xử lý response hay không.
- {{domxref("Request.headers")}} {{ReadOnlyInline}}
  - : Chứa đối tượng {{domxref("Headers")}} liên kết với request.
- {{domxref("Request.integrity")}} {{ReadOnlyInline}}
  - : Chứa giá trị [subresource integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity) của request, ví dụ `sha256-BpfBw7ivV8q2jLiT13fxDYAe2tJllusRSZ273h2nFSE=`.
- {{domxref("Request.isHistoryNavigation")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết request có phải là điều hướng lịch sử hay không.
- {{domxref("Request.keepalive")}} {{ReadOnlyInline}}
  - : Chứa thiết lập `keepalive` của request (`true` hoặc `false`), cho biết trình duyệt có tiếp tục giữ request này hoạt động nếu trang khởi tạo nó bị tải dỡ trước khi request hoàn tất hay không.
- {{domxref("Request.method")}} {{ReadOnlyInline}}
  - : Chứa phương thức của request (`GET`, `POST`, v.v.).
- {{domxref("Request.mode")}} {{ReadOnlyInline}}
  - : Chứa chế độ của request, ví dụ `cors`, `no-cors`, `same-origin`, `navigate`.
- {{domxref("Request.redirect")}} {{ReadOnlyInline}}
  - : Chứa chế độ xử lý chuyển hướng. Giá trị có thể là `follow`, `error` hoặc `manual`.
- {{domxref("Request.referrer")}} {{ReadOnlyInline}}
  - : Chứa referrer của request, ví dụ `client`.
- {{domxref("Request.referrerPolicy")}} {{ReadOnlyInline}}
  - : Chứa chính sách referrer của request, ví dụ `no-referrer`.
- {{domxref("Request.signal")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("AbortSignal")}} liên kết với request.
- {{domxref("Request.url")}} {{ReadOnlyInline}}
  - : Chứa URL của request.

## Phương thức thể hiện

- {{domxref("Request.arrayBuffer()")}}
  - : Trả về một promise giải quyết với biểu diễn {{jsxref("ArrayBuffer")}} của body request.
- {{domxref("Request.blob()")}}
  - : Trả về một promise giải quyết với biểu diễn {{domxref("Blob")}} của body request.
- {{domxref("Request.bytes()")}}
  - : Trả về một promise giải quyết với biểu diễn {{jsxref("Uint8Array")}} của body request.
- {{domxref("Request.clone()")}}
  - : Tạo một bản sao của đối tượng `Request` hiện tại.
- {{domxref("Request.formData()")}}
  - : Trả về một promise giải quyết với biểu diễn {{domxref("FormData")}} của body request.
- {{domxref("Request.json()")}}
  - : Trả về một promise giải quyết với kết quả phân tích body request dưới dạng {{JSxRef("JSON")}}.
- {{domxref("Request.text()")}}
  - : Trả về một promise giải quyết với biểu diễn văn bản của body request.

> [!NOTE]
> Các hàm đọc request body chỉ chạy được một lần; các lần gọi tiếp theo sẽ bị từ chối với `TypeError`, cho biết luồng body đã được dùng rồi.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một request mới bằng hàm khởi tạo `Request()` rồi lấy một vài giá trị thuộc tính của request:

```js
const request = new Request("https://www.mozilla.org/favicon.ico");

const url = request.url;
const method = request.method;
const credentials = request.credentials;
```

Sau đó bạn có thể fetch request này bằng cách truyền đối tượng `Request` vào lời gọi {{domxref("Window/fetch", "fetch()")}}, ví dụ:

```js
fetch(request)
  .then((response) => response.blob())
  .then((blob) => {
    image.src = URL.createObjectURL(blob);
  });
```

Trong đoạn mã sau, chúng ta tạo một request mới bằng hàm khởi tạo `Request()` với một số dữ liệu khởi tạo và nội dung body cho một request API cần payload:

```js
const request = new Request("https://example.com", {
  method: "POST",
  body: '{"foo": "bar"}',
});

const url = request.url;
const method = request.method;
const credentials = request.credentials;
const bodyUsed = request.bodyUsed;
```

> [!NOTE]
> Body chỉ có thể là một đối tượng {{domxref("Blob")}}, {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}}, {{domxref("FormData")}}, {{domxref("URLSearchParams")}}, {{domxref("ReadableStream")}} hoặc {{jsxref("String")}}, cũng như một literal chuỗi, nên nếu muốn thêm một object JSON vào payload thì bạn cần stringify object đó.

Sau đó bạn có thể fetch request API này bằng cách truyền đối tượng `Request` vào lời gọi {{domxref("Window/fetch", "fetch()")}} và nhận response:

```js
fetch(request)
  .then((response) => {
    if (response.status !== 200) {
      throw new Error("Something went wrong on API server!");
    }
    return response.json();
  })
  .then((response) => {
    console.debug(response);
    // …
  })
  .catch((error) => {
    console.error(error);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
