---
title: "PerformanceNavigationTiming: domContentLoadedEventStart property"
short-title: domContentLoadedEventStart
slug: Web/API/PerformanceNavigationTiming/domContentLoadedEventStart
page-type: web-api-instance-property
browser-compat: api.PerformanceNavigationTiming.domContentLoadedEventStart
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`domContentLoadedEventStart`** trả về một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi trình xử lý sự kiện [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event) của tài liệu hiện tại bắt đầu.

Thông thường framework và thư viện sẽ đợi sự kiện `DOMContentLoaded` trước khi bắt đầu chạy mã của họ. Chúng ta có thể dùng các thuộc tính `domContentLoadedEventStart` và [`domContentLoadedEventEnd`](/en-US/docs/Web/API/PerformanceNavigationTiming/domContentLoadedEventEnd) để tính khoảng thời gian thực thi.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi trình xử lý sự kiện [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event) của tài liệu hiện tại bắt đầu.

## Ví dụ

### Đo thời gian xử lý sự kiện `DOMContentLoaded`

Thuộc tính `domContentLoadedEventStart` có thể được dùng để đo thời gian xử lý trình xử lý sự kiện [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event).

Ví dụ dùng {{domxref("PerformanceObserver")}}...

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const domContentLoadedTime =
      entry.domContentLoadedEventEnd - entry.domContentLoadedEventStart;
    console.log(
      `${entry.name}: DOMContentLoaded processing time: ${domContentLoadedTime}ms`,
    );
  });
});

observer.observe({ type: "navigation", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}:

```js
const entries = performance.getEntriesByType("navigation");
entries.forEach((entry) => {
  const domContentLoadedTime =
    entry.domContentLoadedEventEnd - entry.domContentLoadedEventStart;
  console.log(
    `${entry.name}: DOMContentLoaded processing time: ${domContentLoadedTime}ms`,
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [DOMContentLoaded](/en-US/docs/Web/API/Document/DOMContentLoaded_event)
