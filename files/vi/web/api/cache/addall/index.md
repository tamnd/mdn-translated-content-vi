---
title: "Cache: phương thức addAll()"
short-title: addAll()
slug: Web/API/Cache/addAll
page-type: web-api-instance-method
browser-compat: api.Cache.addAll
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`addAll()`** của giao diện {{domxref("Cache")}} nhận một mảng URL, lấy dữ liệu từ chúng và thêm các đối tượng phản hồi kết quả vào bộ nhớ đệm đã cho. Các đối tượng yêu cầu được tạo ra trong quá trình truy xuất trở thành khóa cho các thao tác phản hồi đã lưu.

> [!NOTE]
> `addAll()` sẽ ghi đè bất kỳ cặp khóa/giá trị nào trước đó đã lưu trong bộ nhớ đệm mà khớp với yêu cầu, nhưng sẽ thất bại nếu một thao tác `put()` kết quả sẽ ghi đè một mục bộ nhớ đệm trước đó được lưu bởi cùng phương thức `addAll()`.

## Cú pháp

```js-nolint
addAll(requests)
```

### Tham số

- `requests`
  - : Một mảng yêu cầu cho các tài nguyên bạn muốn thêm vào bộ nhớ đệm. Đây có thể là các đối tượng {{domxref("Request")}} hoặc URL.

    Các yêu cầu này được dùng làm tham số cho hàm khởi tạo {{domxref("Request.Request()", "Request()")}}, nên URL tuân theo các quy tắc tương tự như hàm khởi tạo đó. Đặc biệt, URL có thể là tương đối so với URL cơ sở, tức là {{domxref("Node.baseURI", "baseURI")}} của tài liệu trong ngữ cảnh cửa sổ, hoặc {{domxref("WorkerGlobalScope.location")}} trong ngữ cảnh worker.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành `undefined`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Lược đồ URL không phải là `http` hoặc `https`.

    Trạng thái phản hồi không nằm trong khoảng 200 (tức không phải phản hồi thành công). Điều này xảy ra nếu yêu cầu không trả về thành công, nhưng cũng xảy ra nếu yêu cầu là một yêu cầu _cross-origin no-cors_ (trong trường hợp đó trạng thái báo cáo luôn là 0).

## Ví dụ

Khối mã này chờ một {{domxref("InstallEvent")}} xảy ra, sau đó chạy
{{domxref("ExtendableEvent.waitUntil","waitUntil()")}} để xử lý quá trình cài đặt cho
ứng dụng. Việc này bao gồm gọi {{domxref("CacheStorage.open")}} để tạo một bộ nhớ đệm mới,
sau đó dùng `addAll()` để thêm một loạt tài nguyên vào đó.

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

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
