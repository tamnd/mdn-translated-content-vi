---
title: "ServiceWorkerGlobalScope: sự kiện fetch"
short-title: fetch
slug: Web/API/ServiceWorkerGlobalScope/fetch_event
page-type: web-api-event
browser-compat: api.ServiceWorkerGlobalScope.fetch_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`fetch`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt trong phạm vi toàn cục của service worker khi luồng ứng dụng chính thực hiện một yêu cầu mạng. Nó cho phép service worker chặn các yêu cầu mạng và gửi các phản hồi tùy chỉnh (ví dụ: từ bộ nhớ đệm cục bộ).

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("fetch", (event) => { })

onfetch = (event) => { }
```

## Mô tả

Sự kiện `fetch` được kích hoạt trong phạm vi toàn cục của service worker khi luồng ứng dụng chính thực hiện một yêu cầu mạng. Điều này không chỉ bao gồm các lệnh gọi {{domxref("WorkerGlobalScope/fetch", "fetch()")}} rõ ràng từ luồng chính, mà còn các yêu cầu mạng ngầm để tải các trang và tài nguyên phụ (như JavaScript, CSS và hình ảnh) được trình duyệt thực hiện sau khi điều hướng trang.

Trình xử lý sự kiện được truyền một đối tượng {{domxref("FetchEvent")}}, cung cấp quyền truy cập vào yêu cầu dưới dạng một thể hiện {{domxref("Request")}}.

`FetchEvent` cũng cung cấp phương thức {{domxref("FetchEvent.respondWith()", "respondWith()")}}, nhận một {{domxref("Response")}} (hoặc một `Promise` giải quyết thành một `Response`) làm tham số.
Điều này cho phép trình xử lý sự kiện service worker cung cấp phản hồi được trả về cho yêu cầu trong luồng chính.

Ví dụ, service worker có thể trả về:

- Một phản hồi được lưu trữ cục bộ lấy từ giao diện {{domxref("Cache")}}.
- Một phản hồi mà service worker tổng hợp, sử dụng các phương thức như {{domxref("Response.json()")}} hoặc phương thức khởi tạo {{domxref("Response.Response()", "Response()")}}.
- Một lỗi mạng, sử dụng phương thức {{domxref("Response.error_static()", "Response.error()")}}. Điều này sẽ khiến lệnh gọi `fetch()` bị từ chối.

Phương thức `respondWith()` chỉ có thể được gọi một lần cho một yêu cầu nhất định. Nếu nhiều trình lắng nghe sự kiện `fetch` được thêm vào, chúng sẽ được gọi theo thứ tự chúng được đăng ký cho đến khi một trong số chúng gọi `respondWith()`.

Phương thức `respondWith()` phải được gọi đồng bộ: nghĩa là, bạn không thể gọi nó trong trình xử lý `then`.

Thông thường, trình xử lý sự kiện `fetch` sẽ thực thi các chiến lược khác nhau tùy thuộc vào các đặc điểm của yêu cầu như URL của nó:

```js
function strategy1() {
  return fetch("picnic.jpg");
}

function strategy2() {
  return Response.error();
}

const pattern1 = /^\/salamander/;
const pattern2 = /^\/lizard/;

self.addEventListener("fetch", (event) => {
  const url = new URL(event.request.url);
  if (pattern1.test(url.pathname)) {
    event.respondWith(strategy1());
  } else if (pattern2.test(url.pathname)) {
    event.respondWith(strategy2());
  }
});
```

Nếu `respondWith()` không được gọi trong trình xử lý, thì user agent sẽ tự động thực hiện yêu cầu mạng ban đầu.
Ví dụ: trong mã trên, tất cả các yêu cầu không khớp với `pattern1` hoặc `pattern2` được thực hiện như thể service worker không tồn tại.

## Loại sự kiện

Một {{domxref("FetchEvent")}}.

## Ví dụ

### Bộ nhớ đệm dự phòng sang mạng

Trình xử lý sự kiện `fetch` này trước tiên cố gắng tìm phản hồi trong bộ nhớ đệm. Nếu tìm thấy phản hồi, nó trả về phản hồi đã lưu trữ. Nếu không, nó cố gắng lấy tài nguyên từ mạng.

```js
async function cacheThenNetwork(request) {
  const cachedResponse = await caches.match(request);
  if (cachedResponse) {
    console.log("Found response in cache:", cachedResponse);
    return cachedResponse;
  }
  console.log("Falling back to network");
  return fetch(request);
}

self.addEventListener("fetch", (event) => {
  console.log(`Handling fetch event for ${event.request.url}`);
  event.respondWith(cacheThenNetwork(event.request));
});
```

### Chỉ bộ nhớ đệm

Trình xử lý sự kiện `fetch` này triển khai chiến lược "chỉ bộ nhớ đệm" cho các tập lệnh và bảng kiểu. Nếu thuộc tính {{domxref("Request.destination", "destination")}} của yêu cầu là `"script"` hoặc `"style"`, trình xử lý chỉ tìm kiếm trong bộ nhớ đệm, trả về lỗi nếu không tìm thấy phản hồi.
Tất cả các yêu cầu khác được chuyển đến mạng.

```js
async function cacheOnly(request) {
  const cachedResponse = await caches.match(request);
  if (cachedResponse) {
    console.log("Found response in cache:", cachedResponse);
    return cachedResponse;
  }
  return Response.error();
}

self.addEventListener("fetch", (event) => {
  if (
    event.request.destination === "script" ||
    event.request.destination === "style"
  ) {
    event.respondWith(cacheOnly(event.request));
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Mẫu mã service workers cơ bản](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- Phương thức {{domxref("WorkerGlobalScope/fetch", "fetch()")}}
- Giao diện {{domxref("Request")}}
- Giao diện {{domxref("Response")}}
