---
title: "PerformanceResourceTiming: responseStart property"
short-title: responseStart
slug: Web/API/PerformanceResourceTiming/responseStart
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.responseStart
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`responseStart`** trả về {{domxref("DOMHighResTimeStamp","timestamp")}} ngay sau khi trình duyệt nhận byte đầu tiên của phản hồi từ máy chủ, cache hoặc tài nguyên cục bộ.

## Giá trị

Thuộc tính `responseStart` có thể có các giá trị sau:

- Một {{domxref("DOMHighResTimeStamp")}} ngay sau khi trình duyệt nhận byte đầu tiên của phản hồi từ máy chủ.
- `0` nếu tài nguyên được lấy tức thời từ cache.
- `0` nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.
- `0` nếu tài nguyên là một yêu cầu bị hủy.

## Ví dụ

### Đo thời gian yêu cầu

Các thuộc tính `responseStart` và {{domxref("PerformanceResourceTiming.requestStart", "requestStart")}} có thể dùng để đo thời gian yêu cầu mất bao lâu.

```js
const request = entry.responseStart - entry.requestStart;
```

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const request = entry.responseStart - entry.requestStart;
    if (request > 0) {
      console.log(`${entry.name}: Request time: ${request}ms`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const request = entry.responseStart - entry.requestStart;
  if (request > 0) {
    console.log(`${entry.name}: Request time: ${request}ms`);
  }
});
```

### Thông tin timing liên miền

Nếu giá trị của thuộc tính `responseStart` là `0`, tài nguyên có thể là một yêu cầu cross-origin. Để cho phép xem thông tin timing cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

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
