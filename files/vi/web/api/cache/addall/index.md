---
title: "Cache: phương thức addAll()"
short-title: addAll()
slug: Web/API/Cache/addAll
page-type: web-api-instance-method
browser-compat: api.Cache.addAll
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`addAll()`** của giao diện {{domxref("Cache")}} nhận một mảng URL, truy xuất chúng và thêm các đối tượng phản hồi thu được vào cache đã cho. Các đối tượng yêu cầu được tạo ra trong quá trình truy xuất trở thành khóa cho các thao tác phản hồi được lưu trữ.

> [!NOTE]
> `addAll()` sẽ ghi đè mọi cặp khóa/giá trị
> đã được lưu trước đó trong cache mà khớp với yêu cầu, nhưng sẽ thất bại nếu một
> thao tác `put()` thu được sẽ ghi đè một mục cache trước đó được lưu bởi chính phương thức `addAll()` đó.

## Cú pháp

```js-nolint
addAll(requests)
```

### Tham số

- `requests`
  - : Một mảng các yêu cầu cho những tài nguyên mà bạn muốn thêm vào cache. Chúng có thể là các đối tượng {{domxref("Request")}} hoặc URL.

    Các yêu cầu này được dùng như tham số cho bộ khởi tạo {{domxref("Request.Request()", "Request()")}}, nên URL tuân theo cùng quy tắc như bộ khởi tạo đó. Cụ thể, URL có thể là URL tương đối so với URL cơ sở, tức {{domxref("Node.baseURI", "baseURI")}} của tài liệu trong ngữ cảnh cửa sổ, hoặc {{domxref("WorkerGlobalScope.location")}} trong ngữ cảnh worker.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với `undefined`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Lược đồ URL không phải là `http` hoặc `https`.

    Trạng thái `Response` không nằm trong dải 200 (tức không phải phản hồi thành công). Điều này xảy ra nếu yêu cầu không trả về thành công, nhưng cũng xảy ra nếu yêu cầu là một yêu cầu _cross-origin no-cors_ (trong trường hợp đó trạng thái được báo cáo luôn là 0).

## Ví dụ

Khối mã này chờ một {{domxref("InstallEvent")}} được kích hoạt, rồi chạy
{{domxref("ExtendableEvent.waitUntil","waitUntil()")}} để xử lý tiến trình cài đặt cho
ứng dụng. Việc này bao gồm gọi {{domxref("CacheStorage.open")}} để tạo một cache
mới, rồi dùng `addAll()` để thêm một loạt tài nguyên vào đó.

```js
this.addEventListener("install", (event) => {
  event.waitUntil(
    caches
      .open("v1")
      .then((cache) =>
        cache.addAll([
          "/",
          "/index.html",
          "/style.css",
          "/app.js",
          "/image-list.js",
          "/star-wars-logo.jpg",
          "/gallery/",
          "/gallery/bountyHunters.jpg",
          "/gallery/myLittleVader.jpg",
          "/gallery/snowTroopers.jpg",
        ]),
      ),
  );
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
