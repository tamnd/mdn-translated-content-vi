---
title: "Cache: phương thức put()"
short-title: put()
slug: Web/API/Cache/put
page-type: web-api-instance-method
browser-compat: api.Cache.put
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`put()`** của giao diện
{{domxref("Cache")}} cho phép thêm các cặp khóa/giá trị vào đối tượng
{{domxref("Cache")}} hiện tại.

Thông thường, bạn chỉ muốn {{domxref("Window/fetch", "fetch()")}}
một hoặc nhiều yêu cầu, sau đó thêm kết quả trực tiếp vào bộ nhớ đệm. Trong những trường hợp
như vậy, bạn nên dùng
{{domxref("Cache.add","Cache.add()")}}/{{domxref("Cache.addAll","Cache.addAll()")}}, vì
đây là các hàm viết tắt cho một hoặc nhiều thao tác này.

```js
fetch(url).then((response) => {
  if (!response.ok) {
    throw new TypeError("Bad response status");
  }
  return cache.put(url, response);
});
```

> [!NOTE]
> `put()` sẽ ghi đè bất kỳ cặp khóa/giá trị nào trước đó đã lưu trong bộ nhớ đệm mà khớp với yêu cầu.

> [!NOTE]
> {{domxref("Cache.add")}}/{{domxref("Cache.addAll")}} không
> lưu đệm các phản hồi có giá trị `Response.status` không nằm trong khoảng 200,
> trong khi `Cache.put` cho phép bạn lưu bất kỳ cặp yêu cầu/phản hồi nào. Do đó,
> {{domxref("Cache.add")}}/{{domxref("Cache.addAll")}} không thể dùng để lưu
> các phản hồi opaque, trong khi `Cache.put` có thể.

## Cú pháp

```js-nolint
put(request, response)
```

### Tham số

- `request`
  - : Đối tượng {{domxref("Request")}} hoặc URL bạn muốn thêm vào bộ nhớ đệm.
- `response`
  - : {{domxref("Response")}} bạn muốn ghép với yêu cầu.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành `undefined`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được trả về nếu lược đồ URL không phải là `http` hoặc `https`.

## Ví dụ

Ví dụ này lấy từ ví dụ [simple-service-worker](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker) của MDN (xem [simple-service-worker chạy trực tiếp](https://bncb2v.csb.app/)).
Ở đây chúng ta chờ một {{domxref("FetchEvent")}} xảy ra. Chúng ta tạo một phản hồi tùy biến
như sau:

1. Kiểm tra xem có tìm thấy mục khớp với yêu cầu trong {{domxref("CacheStorage")}}
   bằng {{domxref("CacheStorage.match","CacheStorage.match()")}} hay không. Nếu có, phục vụ mục đó.
2. Nếu không, mở bộ nhớ đệm `v1` bằng `open()`, đặt yêu cầu mạng mặc định
   vào bộ nhớ đệm bằng `Cache.put()` và trả về một bản sao của yêu cầu mạng mặc định bằng
   `return response.clone()`. Clone là cần thiết vì `put()` tiêu thụ phần thân phản hồi.
3. Nếu việc này thất bại (ví dụ do mạng bị ngắt), trả về một phản hồi dự phòng.

```js
let response;
const cachedResponse = caches
  .match(event.request)
  .then((r) => (r !== undefined ? r : fetch(event.request)))
  .then((r) => {
    response = r;
    caches.open("v1").then((cache) => cache.put(event.request, response));
    return response.clone();
  })
  .catch(() => caches.match("/gallery/myLittleVader.jpg"));
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
