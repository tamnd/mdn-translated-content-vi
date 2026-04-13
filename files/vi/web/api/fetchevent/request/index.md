---
title: "FetchEvent: thuộc tính request"
short-title: request
slug: Web/API/FetchEvent/request
page-type: web-api-instance-property
browser-compat: api.FetchEvent.request
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`request`** của giao diện {{domxref("FetchEvent")}} trả về {{domxref("Request")}} đã kích hoạt trình xử lý sự kiện.

Thuộc tính này không thể là null (kể từ phiên bản 46, trong trường hợp của Firefox). Nếu yêu cầu không được cung cấp bằng cách nào khác, đối tượng `options` của hàm khởi tạo phải chứa một yêu cầu (xem {{domxref("FetchEvent.FetchEvent", "FetchEvent()")}}).

## Giá trị

Một đối tượng {{domxref("Request")}}.

## Ví dụ

Đoạn mã này từ [mẫu fetch của service worker](https://github.com/GoogleChrome/samples/blob/gh-pages/service-worker/prefetch/service-worker.js) ([chạy mẫu fetch trực tiếp](https://googlechrome.github.io/samples/service-worker/prefetch/)). Trình xử lý sự kiện {{domxref("ServiceWorkerGlobalScope.fetch_event", "onfetch")}} lắng nghe sự kiện `fetch`. Khi được kích hoạt, truyền promise trở lại trang được kiểm soát vào {{domxref("FetchEvent.respondWith", "FetchEvent.respondWith()")}}.
Promise này giải quyết thành yêu cầu URL khớp đầu tiên trong đối tượng {{domxref("Cache")}}.
Nếu không tìm thấy kết quả khớp, mã tìm nạp phản hồi từ mạng.

Mã cũng xử lý các ngoại lệ được ném từ thao tác {{domxref("Window/fetch", "fetch()")}}. Lưu ý rằng phản hồi lỗi HTTP (ví dụ: 404) sẽ không kích hoạt ngoại lệ. Nó sẽ trả về đối tượng phản hồi bình thường có mã lỗi thích hợp được đặt.

```js
self.addEventListener("fetch", (event) => {
  console.log("Xử lý sự kiện fetch cho", event.request.url);

  event.respondWith(
    caches.match(event.request).then((response) => {
      if (response) {
        console.log("Tìm thấy phản hồi trong bộ nhớ đệm:", response);

        return response;
      }
      console.log(
        "Không tìm thấy phản hồi trong bộ nhớ đệm. Chuẩn bị tìm nạp từ mạng...",
      );

      return fetch(event.request)
        .then((response) => {
          console.log("Phản hồi từ mạng là:", response);

          return response;
        })
        .catch((error) => {
          console.error("Tìm nạp thất bại:", error);

          throw error;
        });
    }),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service worker](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
