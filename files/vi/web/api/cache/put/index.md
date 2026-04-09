---
title: "Cache: phương thức put()"
short-title: put()
slug: Web/API/Cache/put
page-type: web-api-instance-method
browser-compat: api.Cache.put
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`put()`** của
giao diện {{domxref("Cache")}} cho phép thêm các cặp khóa/giá trị vào đối tượng
{{domxref("Cache")}} hiện tại.

Trong nhiều trường hợp, bạn sẽ chỉ muốn {{domxref("Window/fetch", "fetch()")}}
một hay nhiều yêu cầu, rồi thêm kết quả thẳng vào cache. Trong những trường hợp như vậy,
bạn nên dùng
{{domxref("Cache.add","Cache.add()")}}/{{domxref("Cache.addAll","Cache.addAll()")}}, vì
chúng là các hàm rút gọn cho một hoặc nhiều thao tác như thế.

```js
fetch(url).then((response) => {
  if (!response.ok) {
    throw new TypeError("Bad response status");
  }
  return cache.put(url, response);
});
```

> [!NOTE]
> `put()` sẽ ghi đè mọi cặp khóa/giá trị
> đã được lưu trước đó trong cache mà khớp với yêu cầu.

> [!NOTE]
> {{domxref("Cache.add")}}/{{domxref("Cache.addAll")}} không
> lưu đệm các phản hồi có giá trị `Response.status` không nằm trong
> dải 200, trong khi `Cache.put` cho phép bạn lưu bất kỳ cặp yêu cầu/phản hồi nào. Vì vậy,
> {{domxref("Cache.add")}}/{{domxref("Cache.addAll")}} không thể dùng để lưu
> các phản hồi opaque, còn `Cache.put` thì có thể.

## Cú pháp

```js-nolint
put(request, response)
```

### Tham số

- `request`
  - : Đối tượng {{domxref("Request")}} hoặc URL mà bạn muốn thêm vào cache.
- `response`
  - : {{domxref("Response")}} mà bạn muốn ghép với yêu cầu đó.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với `undefined`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được trả về nếu lược đồ URL không phải là `http` hoặc `https`.

## Ví dụ

Ví dụ này lấy từ ví dụ MDN [simple-service-worker](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker) (xem [simple-service-worker đang chạy trực tiếp](https://bncb2v.csb.app/)).
Ở đây chúng ta chờ một {{domxref("FetchEvent")}} được kích hoạt. Chúng ta xây dựng một phản hồi tùy chỉnh như sau:

1. Kiểm tra xem có tìm thấy kết quả khớp cho yêu cầu trong {{domxref("CacheStorage")}}
   bằng {{domxref("CacheStorage.match","CacheStorage.match()")}} hay không. Nếu có, phục vụ phản hồi đó.
2. Nếu không, mở cache `v1` bằng `open()`, đưa yêu cầu mạng mặc định vào cache bằng `Cache.put()` rồi trả về một
   bản sao của yêu cầu mạng mặc định bằng `return response.clone()`. Cần clone
   vì `put()` sẽ tiêu thụ phần thân phản hồi.
3. Nếu việc này thất bại (ví dụ vì mạng bị ngắt), trả về một phản hồi dự phòng.

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

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Service Worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
