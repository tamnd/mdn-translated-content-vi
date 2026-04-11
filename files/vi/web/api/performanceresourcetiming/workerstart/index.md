---
title: "PerformanceResourceTiming: workerStart property"
short-title: workerStart
slug: Web/API/PerformanceResourceTiming/workerStart
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.workerStart
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`workerStart`** của giao diện {{domxref("PerformanceResourceTiming")}} trả về một
{{domxref("DOMHighResTimeStamp")}} ngay trước khi phát {{domxref("FetchEvent")}} nếu luồng Service Worker đang chạy, hoặc ngay trước khi khởi động luồng Service Worker nếu nó chưa chạy. Nếu tài nguyên không bị Service Worker chặn thì thuộc tính này luôn trả về 0.

## Giá trị

Thuộc tính `workerStart` có thể có các giá trị sau:

- Một {{domxref("DOMHighResTimeStamp")}}.
- `0` nếu không dùng service worker.
- `0` nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

## Ví dụ

### Đo thời gian xử lý của ServiceWorker

Các thuộc tính `workerStart` và {{domxref("PerformanceResourceTiming.fetchStart", "fetchStart")}} có thể dùng để đo thời gian xử lý của một {{domxref("ServiceWorker")}}.

```js
const workerProcessingTime = entry.fetchStart - entry.workerStart;
```

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const workerProcessingTime = entry.fetchStart - entry.workerStart;
    if (workerProcessingTime > 0) {
      console.log(
        `${entry.name}: Worker processing time: ${workerProcessingTime}ms`,
      );
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const workerProcessingTime = entry.fetchStart - entry.workerStart;
  if (workerProcessingTime > 0) {
    console.log(
      `${entry.name}: Worker processing time: ${workerProcessingTime}ms`,
    );
  }
});
```

### Thông tin timing liên miền

Nếu giá trị của thuộc tính `workerStart` là `0`, tài nguyên có thể là một yêu cầu cross-origin. Để cho phép xem thông tin timing cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

Ví dụ, để cho phép `https://developer.mozilla.org` xem timing tài nguyên, tài nguyên cross-origin nên gửi:

```http
Timing-Allow-Origin: https://developer.mozilla.org
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Timing-Allow-Origin")}}
