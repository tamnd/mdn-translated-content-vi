---
title: "PerformanceResourceTiming: fetchStart property"
short-title: fetchStart
slug: Web/API/PerformanceResourceTiming/fetchStart
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.fetchStart
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`fetchStart`** biểu thị {{domxref("DOMHighResTimeStamp","timestamp")}} ngay trước khi trình duyệt bắt đầu tìm nạp tài nguyên.

Nếu có chuyển hướng HTTP, thuộc tính này trả về thời điểm ngay trước khi user agent bắt đầu tìm nạp tài nguyên cuối cùng trong chuỗi chuyển hướng.

Không giống nhiều thuộc tính khác của `PerformanceResourceTiming`, thuộc tính `fetchStart` có sẵn cho các yêu cầu cross-origin mà không cần tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} ngay trước khi trình duyệt bắt đầu tìm nạp tài nguyên.

## Ví dụ

### Đo thời gian tìm nạp (không có chuyển hướng)

Các thuộc tính `fetchStart` và {{domxref("PerformanceResourceTiming.responseEnd", "responseEnd")}} có thể dùng để đo tổng thời gian cần để tìm nạp tài nguyên cuối cùng (không tính chuyển hướng). Nếu muốn bao gồm chuyển hướng, tổng thời gian tìm nạp được cung cấp trong thuộc tính {{domxref("PerformanceEntry.duration", "duration")}}.

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
