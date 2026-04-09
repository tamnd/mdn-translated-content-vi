---
title: "CacheStorage: phương thức match()"
short-title: match()
slug: Web/API/CacheStorage/match
page-type: web-api-instance-method
browser-compat: api.CacheStorage.match
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`match()`** của giao diện {{domxref("CacheStorage")}} kiểm tra xem một {{domxref("Request")}} hoặc chuỗi URL cho trước có phải là khóa của một {{domxref("Response")}} đã được lưu trữ hay không.
Phương thức này trả về một {{jsxref("Promise")}} phân giải thành một {{domxref("Response")}}, hoặc phân giải thành `undefined` nếu không tìm thấy mục khớp.

Bạn có thể truy cập `CacheStorage` thông qua thuộc tính {{domxref("Window.caches")}} trong cửa sổ hoặc thông qua thuộc tính {{domxref("WorkerGlobalScope.caches")}} trong worker.

Các đối tượng `Cache` được tìm kiếm theo thứ tự tạo.

> [!NOTE]
> `caches.match()` là một phương thức tiện lợi.
> Chức năng tương đương là gọi {{domxref("cache.match()")}} trên từng bộ nhớ đệm (theo thứ tự được trả về bởi {{domxref("CacheStorage.keys()", "caches.keys()")}}) cho đến khi một {{domxref("Response")}} được trả về.

## Cú pháp

```js-nolint
match(request)
match(request, options)
```

### Tham số

- `request`
  - : {{domxref("Request")}} mà bạn muốn so khớp. Đây có thể là một đối tượng {{domxref("Request")}} hoặc một chuỗi URL.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính điều khiển cách việc so khớp được thực hiện trong thao tác `match`. Các tùy chọn khả dụng là:
    - `ignoreSearch`
      - : Một giá trị boolean cho biết quá trình so khớp có nên bỏ qua chuỗi truy vấn trong URL hay không. Ví dụ, nếu đặt là `true`, phần `?value=bar` của `https://example.com/?value=bar` sẽ bị bỏ qua khi thực hiện so khớp. Mặc định là `false`.
    - `ignoreMethod`
      - : Một giá trị boolean mà khi đặt là `true`, sẽ ngăn thao tác so khớp kiểm tra phương thức `http` của {{domxref("Request")}} (thông thường chỉ cho phép `GET` và `HEAD`). Mặc định là `false`.
    - `ignoreVary`
      - : Một giá trị boolean mà khi đặt là `true`, sẽ yêu cầu thao tác so khớp không thực hiện việc so khớp tiêu đề `VARY`. Nói cách khác, nếu URL khớp thì bạn sẽ nhận được kết quả khớp bất kể đối tượng {{domxref("Response")}} có tiêu đề `VARY` hay không. Mặc định là `false`.
    - `cacheName`
      - : Một chuỗi đại diện cho bộ nhớ đệm cụ thể để tìm kiếm bên trong.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành {{domxref("Response")}} khớp. Nếu không tìm thấy phản hồi nào khớp với yêu cầu đã chỉ định, promise sẽ phân giải thành `undefined`.

## Ví dụ

Ví dụ này lấy từ [ví dụ service worker đơn giản](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker) của MDN (xem [bản chạy trực tiếp của ví dụ service worker đơn giản](https://bncb2v.csb.app/)).
Ở đây chúng ta chờ một {{domxref("FetchEvent")}} xảy ra. Chúng ta tạo một phản hồi tùy biến như sau:

1. Kiểm tra xem có tìm thấy mục khớp với yêu cầu trong {{domxref("CacheStorage")}} bằng `CacheStorage.match()` hay không. Nếu có, phục vụ mục đó.
2. Nếu không, mở bộ nhớ đệm `v1` bằng `open()`, đưa yêu cầu mạng mặc định vào bộ nhớ đệm bằng {{domxref("Cache.put","Cache.put()")}} và trả về một bản sao của phản hồi mạng mặc định bằng `return response.clone()`. Bước cuối là cần thiết vì `put()` sẽ tiêu thụ phần thân của phản hồi.
3. Nếu việc này thất bại (ví dụ do mạng bị ngắt), trả về một phản hồi dự phòng.

```js
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

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
