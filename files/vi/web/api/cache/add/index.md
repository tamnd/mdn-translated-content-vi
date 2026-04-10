---
title: "Cache: phương thức add()"
short-title: add()
slug: Web/API/Cache/add
page-type: web-api-instance-method
browser-compat: api.Cache.add
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`add()`** của giao diện {{domxref("Cache")}} nhận một URL, lấy dữ liệu từ đó và thêm đối tượng phản hồi kết quả vào bộ nhớ đệm đã cho.

Phương thức `add()` tương đương về chức năng với đoạn mã sau:

```js
fetch(url).then((response) => {
  if (!response.ok) {
    throw new TypeError("bad response status");
  }
  return cache.put(url, response);
});
```

Đối với các thao tác phức tạp hơn, bạn sẽ cần dùng {{domxref("Cache.put","Cache.put()")}} trực tiếp.

> [!NOTE]
> `add()` sẽ ghi đè bất kỳ cặp khóa/giá trị nào trước đó đã lưu trong bộ nhớ đệm mà khớp với yêu cầu.

## Cú pháp

```js-nolint
add(request)
```

### Tham số

- `request`
  - : Một yêu cầu cho tài nguyên bạn muốn thêm vào bộ nhớ đệm. Đây có thể là một đối tượng {{domxref("Request")}} hoặc một URL.

    Tham số này được dùng làm tham số cho hàm khởi tạo {{domxref("Request.Request()", "Request()")}}, nên URL tuân theo các quy tắc tương tự như hàm khởi tạo đó. Đặc biệt, URL có thể là tương đối so với URL cơ sở, tức là {{domxref("Node.baseURI", "baseURI")}} của tài liệu trong ngữ cảnh cửa sổ, hoặc {{domxref("WorkerGlobalScope.location")}} trong ngữ cảnh worker.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành `undefined`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Lược đồ URL không phải là `http` hoặc `https`.

    Trạng thái phản hồi không nằm trong khoảng 200 (tức không phải phản hồi thành công). Điều này xảy ra nếu yêu cầu không trả về thành công, nhưng cũng xảy ra nếu yêu cầu là một yêu cầu _cross-origin no-cors_ (trong trường hợp đó trạng thái báo cáo luôn là 0).

## Ví dụ

Khối mã này chờ một {{domxref("InstallEvent")}} xảy ra, sau đó gọi {{domxref("ExtendableEvent.waitUntil","waitUntil()")}} để xử lý quá trình cài đặt cho ứng dụng. Việc này bao gồm gọi {{domxref("CacheStorage.open")}} để tạo một bộ nhớ đệm mới, sau đó dùng `Cache.add` để thêm một tài nguyên vào đó.

```js
this.addEventListener("install", (event) => {
  event.waitUntil(caches.open("v1").then((cache) => cache.add("/index.html")));
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
