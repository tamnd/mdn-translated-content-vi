---
title: "PerformanceNavigationTiming: unloadEventEnd property"
short-title: unloadEventEnd
slug: Web/API/PerformanceNavigationTiming/unloadEventEnd
page-type: web-api-instance-property
browser-compat: api.PerformanceNavigationTiming.unloadEventEnd
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`unloadEventEnd`** trả về một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay sau khi trình xử lý sự kiện [`unload`](/en-US/docs/Web/API/Window/unload_event) của tài liệu trước đó hoàn tất.

## Giá trị

Thuộc tính `unloadEventEnd` có thể có các giá trị sau:

- Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay sau khi trình xử lý sự kiện [`unload`](/en-US/docs/Web/API/Window/unload_event) của tài liệu trước đó hoàn tất.
- `0` nếu không có tài liệu trước đó.
- `0` nếu trang trước đó ở một nguồn gốc khác.

## Ví dụ

### Đo thời gian xử lý sự kiện `unload`

Thuộc tính `unloadEventEnd` có thể được dùng để đo thời gian xử lý trình xử lý sự kiện [`unload`](/en-US/docs/Web/API/Window/unload_event).

Điều này hữu ích để đo thời gian của các trình xử lý [`unload`](/en-US/docs/Web/API/Window/load_event) chạy lâu.

```js
window.addEventListener("unload", (event) => {
  // Một số mã chạy lâu
});
```

Ví dụ dùng {{domxref("PerformanceObserver")}}...

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const unloadEventTime = entry.unloadEventEnd - entry.unloadEventStart;
    if (unloadEventTime > 0) {
      console.log(
        `${entry.name}: unload event handler time: ${unloadEventTime}ms`,
      );
    }
  });
});

observer.observe({ type: "navigation", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}:

```js
const entries = performance.getEntriesByType("navigation");
entries.forEach((entry) => {
  const unloadEventTime = entry.unloadEventEnd - entry.unloadEventStart;
  if (unloadEventTime > 0) {
    console.log(`${entry.name}:
      load event handler time: ${unloadEventTime}ms`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`unload`](/en-US/docs/Web/API/Window/unload_event) event
