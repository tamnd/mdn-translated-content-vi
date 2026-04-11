---
title: "PerformanceResourceTiming: finalResponseHeadersStart property"
short-title: finalResponseHeadersStart
slug: Web/API/PerformanceResourceTiming/finalResponseHeadersStart
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.finalResponseHeadersStart
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`finalResponseHeadersStart`** trả về {{domxref("DOMHighResTimeStamp","timestamp")}} ngay sau khi trình duyệt nhận byte đầu tiên của phản hồi tài liệu cuối cùng (ví dụ 200 OK) từ máy chủ.

Điều này khác với **{{domxref("PerformanceResourceTiming.requestStart", "requestStart")}}** (cũng có thể được biểu diễn bằng **{{domxref("PerformanceResourceTiming.firstInterimResponseStart", "firstInterimResponseStart")}}**), vì nó bắt đầu từ những byte đầu tiên của bất kỳ phản hồi nào, bao gồm cả phản hồi tạm thời (ví dụ 103 Early Hints), còn phản hồi cuối có thể đến muộn hơn nhiều.

Khi không có phản hồi tạm thời, `requestStart` giống với `finalResponseHeadersStart` và `firstInterimResponseStart` là 0.

Không có thuộc tính _end_ cho `finalResponseHeadersStart`.

## Giá trị

Thuộc tính `finalResponseHeadersStart` có thể có các giá trị sau:

- Một {{domxref("DOMHighResTimeStamp")}} ngay sau khi trình duyệt nhận byte đầu tiên của phản hồi cuối cùng từ máy chủ.
- `0` nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

## Ví dụ

### Đo thời gian yêu cầu

Các thuộc tính `finalResponseHeadersStart` và {{domxref("PerformanceResourceTiming.requestStart", "requestStart")}} có thể dùng để đo xem trình duyệt mất bao lâu để bắt đầu nhận phản hồi cuối sau khi gửi yêu cầu.

```js
const request = entry.finalResponseHeadersStart - entry.requestStart;
```

Ví dụ sau dùng {{domxref("PerformanceObserver")}} để thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Tùy chọn `buffered` được dùng để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const request = entry.finalResponseHeadersStart - entry.requestStart;
    if (request > 0) {
      console.log(`${entry.name}: final response time: ${request}ms`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ sau dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này.

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const request = entry.finalResponseHeadersStart - entry.requestStart;
  if (request > 0) {
    console.log(`${entry.name}: final response time: ${request}ms`);
  }
});
```

Ví dụ sau cho thấy cách đo thời gian giữa header phản hồi đầu tiên và cuối cùng.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const diff = entry.finalResponseHeadersStart - entry.responseStart;
    if ((entry.finalResponseHeadersStart > 0) & (diff > 0)) {
      console.log(
        `${entry.name}: time between first and final response start: ${diff}ms`,
      );
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

### Thông tin timing liên miền

Nếu giá trị của thuộc tính `finalResponseHeadersStart` là `0`, tài nguyên có thể là một yêu cầu cross-origin. Để cho phép xem thông tin timing cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

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
- {{domxref("PerformanceResourceTiming.firstInterimResponseStart", "firstInterimResponseStart")}}
