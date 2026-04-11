---
title: "PerformanceResourceTiming: responseEnd property"
short-title: responseEnd
slug: Web/API/PerformanceResourceTiming/responseEnd
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.responseEnd
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`responseEnd`** trả về {{domxref("DOMHighResTimeStamp","timestamp")}} ngay sau khi trình duyệt nhận byte cuối cùng của tài nguyên hoặc ngay trước khi kết nối vận chuyển bị đóng, tùy điều kiện nào đến trước.

Không giống nhiều thuộc tính khác của `PerformanceResourceTiming`, thuộc tính `responseEnd` có sẵn cho các yêu cầu cross-origin mà không cần tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} ngay sau khi trình duyệt nhận byte cuối cùng của tài nguyên hoặc ngay trước khi kết nối vận chuyển bị đóng, tùy điều kiện nào đến trước.

## Ví dụ

### Đo thời gian tìm nạp (không có chuyển hướng)

Các thuộc tính `responseEnd` và {{domxref("PerformanceResourceTiming.fetchStart", "fetchStart")}} có thể dùng để đo tổng thời gian cần để tìm nạp tài nguyên cuối cùng (không tính chuyển hướng). Nếu muốn bao gồm cả chuyển hướng, tổng thời gian tìm nạp được cung cấp trong thuộc tính {{domxref("PerformanceEntry.duration", "duration")}}.

```js
const timeToFetch = entry.responseEnd - entry.fetchStart;
```

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const timeToFetch = entry.responseEnd - entry.fetchStart;
    if (timeToFetch > 0) {
      console.log(`${entry.name}: Time to fetch: ${timeToFetch}ms`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const timeToFetch = entry.responseEnd - entry.fetchStart;
  if (timeToFetch > 0) {
    console.log(`${entry.name}: Time to fetch: ${timeToFetch}ms`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
