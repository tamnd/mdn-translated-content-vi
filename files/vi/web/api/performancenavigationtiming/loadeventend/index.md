---
title: "PerformanceNavigationTiming: loadEventEnd property"
short-title: loadEventEnd
slug: Web/API/PerformanceNavigationTiming/loadEventEnd
page-type: web-api-instance-property
browser-compat: api.PerformanceNavigationTiming.loadEventEnd
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`loadEventEnd`** trả về một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay sau khi trình xử lý sự kiện [`load`](/en-US/docs/Web/API/Window/load_event) của tài liệu hiện tại hoàn tất.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay sau khi trình xử lý sự kiện [`load`](/en-US/docs/Web/API/Window/load_event) của tài liệu hiện tại hoàn tất.

## Ví dụ

### Đo thời gian xử lý sự kiện `load`

Thuộc tính `loadEventEnd` có thể được dùng để đo thời gian xử lý trình xử lý sự kiện [`load`](/en-US/docs/Web/API/Window/load_event).

Điều này hữu ích để đo thời gian của các trình xử lý [`load`](/en-US/docs/Web/API/Window/load_event) chạy lâu.

```js
window.addEventListener("load", (event) => {
  // Một số mã chạy lâu
});
```

Ví dụ dùng {{domxref("PerformanceObserver")}}...

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const loadEventTime = entry.loadEventEnd - entry.loadEventStart;
    if (loadEventTime > 0) {
      console.log(`${entry.name}: load event handler time: ${loadEventTime}ms`);
    }
  });
});

observer.observe({ type: "navigation", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}:

```js
const entries = performance.getEntriesByType("navigation");
entries.forEach((entry) => {
  const loadEventTime = entry.loadEventEnd - entry.loadEventStart;
  if (loadEventTime > 0) {
    console.log(`${entry.name}:
      load event handler time: ${loadEventTime}ms`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`load`](/en-US/docs/Web/API/Window/load_event) event
