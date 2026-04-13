---
title: "FetchEvent: phương thức respondWith()"
short-title: respondWith()
slug: Web/API/FetchEvent/respondWith
page-type: web-api-instance-method
browser-compat: api.FetchEvent.respondWith
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Phương thức **`respondWith()`** của {{domxref("FetchEvent")}} ngăn chặn xử lý tìm nạp mặc định của trình duyệt, và cho phép bạn tự cung cấp promise cho {{domxref("Response")}}.

Trong hầu hết các trường hợp, bạn có thể cung cấp bất kỳ phản hồi nào mà bên nhận hiểu được. Ví dụ, nếu {{HTMLElement('img')}} khởi tạo yêu cầu, phần thân phản hồi cần là dữ liệu hình ảnh. Vì lý do bảo mật, có một số quy tắc toàn cục:

- Bạn chỉ có thể trả về các đối tượng {{domxref("Response")}} có {{domxref("Response.type", "type")}} là `"opaque"` nếu đối tượng {{domxref("fetchEvent.request")}} có {{domxref("request.mode", "mode")}} là `"no-cors"`. Điều này ngăn rò rỉ dữ liệu riêng tư.
- Bạn chỉ có thể trả về các đối tượng {{domxref("Response")}} có {{domxref("Response.type", "type")}} là `"opaqueredirect"` nếu đối tượng {{domxref("fetchEvent.request")}} có {{domxref("request.mode", "mode")}} là `"manual"`.
- Bạn không thể trả về các đối tượng {{domxref("Response")}} có {{domxref("Response.type", "type")}} là `"cors"` nếu đối tượng {{domxref("fetchEvent.request")}} có {{domxref("request.mode", "mode")}} là `"same-origin"`.

## Cú pháp

```js-nolint
respondWith(response)
```

### Tham số

- `response`
  - : Một {{domxref("Response")}} hoặc một {{jsxref("Promise")}} giải quyết thành `Response`. Ngược lại, lỗi mạng được trả về cho Fetch.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NetworkError` {{domxref("DOMException")}}
  - : Được trả về nếu lỗi mạng được kích hoạt trên một số kết hợp nhất định của các giá trị {{domxref("Request.mode","FetchEvent.request.mode")}} và {{domxref("Response.type")}}, như được gợi ý trong các "quy tắc toàn cục" liệt kê ở trên.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu sự kiện chưa được gửi hoặc `respondWith()` đã được gọi.

## Mô tả

### Chỉ định URL cuối cùng của tài nguyên

Từ Firefox 59 trở đi, khi một service worker cung cấp {{domxref("Response")}} cho `FetchEvent.respondWith()`, giá trị {{domxref("Response.url")}} sẽ được truyền đến yêu cầu mạng bị chặn như là URL đã giải quyết cuối cùng. Nếu giá trị {{domxref("Response.url")}} là chuỗi rỗng, thì {{domxref("Request.url","FetchEvent.request.url")}} được dùng làm URL cuối cùng.

Trước đây {{domxref("Request.url","FetchEvent.request.url")}} được dùng làm URL cuối cùng trong mọi trường hợp. {{domxref("Response.url")}} được cung cấp thực tế bị bỏ qua.

Điều này có nghĩa là, ví dụ, nếu một service worker chặn stylesheet hoặc worker script, thì {{domxref("Response.url")}} được cung cấp sẽ được dùng để giải quyết bất kỳ tải tài nguyên con {{cssxref("@import")}} hoặc {{domxref("WorkerGlobalScope.importScripts()","importScripts()")}} tương đối nào ([Firefox bug 1222008](https://bugzil.la/1222008)).

Đối với hầu hết các loại yêu cầu mạng, thay đổi này không có tác động vì bạn không thể quan sát URL cuối cùng. Tuy nhiên có một số trường hợp quan trọng:

- Nếu {{domxref("Window/fetch", "fetch()")}} bị chặn, bạn có thể quan sát URL cuối cùng trên {{domxref("Response.url")}} của kết quả.
- Nếu script [worker](/en-US/docs/Web/API/Web_Workers_API) bị chặn, URL cuối cùng được dùng để đặt [`self.location`](/en-US/docs/Web/API/WorkerGlobalScope/location) và được dùng làm URL cơ sở cho các URL tương đối trong worker script.
- Nếu stylesheet bị chặn, URL cuối cùng được dùng làm URL cơ sở để giải quyết các tải {{cssxref("@import")}} tương đối.

Lưu ý rằng các yêu cầu điều hướng cho {{domxref("Window","Windows")}} và {{domxref("HTMLIFrameElement","iframes")}} KHÔNG dùng URL cuối cùng. Cách mà đặc tả HTML xử lý các chuyển hướng điều hướng dùng URL yêu cầu cho {{domxref("Window.location")}} kết quả. Điều này có nghĩa là các trang web vẫn có thể cung cấp "chế độ xem thay thế" của trang web khi ngoại tuyến mà không thay đổi URL hiển thị cho người dùng.

## Ví dụ

Sự kiện fetch này cố trả về phản hồi từ API bộ nhớ đệm, dùng mạng nếu không thành công.

```js
addEventListener("fetch", (event) => {
  // Ngăn chặn mặc định và tự xử lý yêu cầu.
  event.respondWith(
    (async () => {
      // Cố lấy phản hồi từ bộ nhớ đệm.
      const cachedResponse = await caches.match(event.request);
      // Trả về nếu tìm thấy.
      if (cachedResponse) return cachedResponse;
      // Nếu không tìm thấy kết quả khớp trong bộ nhớ đệm, dùng mạng.
      return fetch(event.request);
    })(),
  );
});
```

> [!NOTE]
> {{domxref("CacheStorage.match()", "caches.match()")}} là phương thức tiện ích. Chức năng tương đương là gọi {{domxref("cache.match()")}} trên mỗi bộ nhớ đệm (theo thứ tự được trả về bởi {{domxref("CacheStorage.keys()", "caches.keys()")}}) cho đến khi {{domxref("Response")}} được trả về.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Fetch API](/en-US/docs/Web/API/Fetch_API)
