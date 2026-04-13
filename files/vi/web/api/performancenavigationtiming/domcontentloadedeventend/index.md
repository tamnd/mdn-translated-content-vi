---
title: "PerformanceNavigationTiming: domContentLoadedEventEnd property"
short-title: domContentLoadedEventEnd
slug: Web/API/PerformanceNavigationTiming/domContentLoadedEventEnd
page-type: web-api-instance-property
browser-compat: api.PerformanceNavigationTiming.domContentLoadedEventEnd
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`domContentLoadedEventEnd`** trả về một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay sau khi trình xử lý sự kiện [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event) của tài liệu hiện tại hoàn tất.

Thông thường framework và thư viện sẽ đợi sự kiện `DOMContentLoaded` trước khi bắt đầu chạy mã của họ. Chúng ta có thể dùng các thuộc tính `domContentLoadedEventEnd` và [`domContentLoadedEventStart`](/en-US/docs/Web/API/PerformanceNavigationTiming/domContentLoadedEventStart) để tính khoảng thời gian thực thi.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay sau khi trình xử lý sự kiện [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event) của tài liệu hiện tại hoàn tất.

## Ví dụ

### Đo thời gian xử lý sự kiện `DOMContentLoaded`

Thuộc tính `domContentLoadedEventEnd` có thể được dùng để đo thời gian xử lý trình xử lý sự kiện [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event).

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
