---
title: "CacheStorage: phương thức match()"
short-title: match()
slug: Web/API/CacheStorage/match
page-type: web-api-instance-method
browser-compat: api.CacheStorage.match
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`match()`** của giao diện {{domxref("CacheStorage")}} kiểm tra xem một {{domxref("Request")}} hoặc chuỗi URL cho trước có phải là khóa cho một {{domxref("Response")}} đã lưu hay không.
Phương thức này trả về một {{jsxref("Promise")}} cho một {{domxref("Response")}}, hoặc một {{jsxref("Promise")}} phân giải thành `undefined` nếu không tìm thấy kết quả khớp.

Bạn có thể truy cập `CacheStorage` thông qua thuộc tính {{domxref("Window.caches")}} trong cửa sổ hoặc thông qua thuộc tính {{domxref("WorkerGlobalScope.caches")}} trong worker.

Các đối tượng `Cache` được tìm kiếm theo thứ tự tạo.

> [!NOTE]
> `caches.match()` là một phương thức tiện lợi.
> Chức năng tương đương là gọi {{domxref("cache.match()")}} trên từng bộ nhớ đệm (theo thứ tự trả về bởi {{domxref("CacheStorage.keys()", "caches.keys()")}}) cho đến khi một {{domxref("Response")}} được trả về.

## Cú pháp

```js-nolint
match(request)
match(request, options)
```

### Tham số

- `request`
  - : {{domxref("Request")}} bạn muốn so khớp. Đây có thể là một đối tượng {{domxref("Request")}}
    hoặc một chuỗi URL.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính kiểm soát cách so khớp được thực hiện trong thao tác
    `match`. Các tùy chọn có sẵn là:
    - `ignoreSearch`
      - : Một giá trị boolean chỉ định xem quá trình
        so khớp có nên bỏ qua chuỗi truy vấn trong URL hay không. Ví dụ: nếu đặt
        thành `true`, phần `?value=bar` của
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
        `VARY`. Nói cách khác, nếu URL khớp bạn sẽ nhận được kết quả
        bất kể đối tượng {{domxref("Response")}} có tiêu đề `VARY`
        hay không. Giá trị mặc định là `false`.
    - `cacheName`
      - : Một chuỗi biểu diễn một bộ nhớ đệm
        cụ thể để tìm kiếm trong đó.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành {{domxref("Response")}} khớp. Nếu
không tìm thấy phản hồi nào khớp với yêu cầu được chỉ định, promise phân giải
thành `undefined`.

## Ví dụ

Ví dụ này lấy từ [ví dụ service worker đơn giản](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker) của MDN (xem [bản chạy trực tiếp của service worker đơn giản](https://bncb2v.csb.app/)).
Ở đây chúng ta chờ một {{domxref("FetchEvent")}} xảy ra. Chúng ta tạo một phản hồi tùy biến
như sau:

1. Kiểm tra xem có tìm thấy mục khớp với yêu cầu trong {{domxref("CacheStorage")}}
   bằng `CacheStorage.match()` hay không. Nếu có, phục vụ mục đó.
2. Nếu không, mở bộ nhớ đệm `v1` bằng `open()`, đặt yêu cầu mạng mặc định
   vào bộ nhớ đệm bằng {{domxref("Cache.put","Cache.put()")}} và trả về
   một bản sao của yêu cầu mạng mặc định bằng `return response.clone()`. Điều
   cuối cùng này là cần thiết vì `put()` tiêu thụ phần thân phản hồi.
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

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
