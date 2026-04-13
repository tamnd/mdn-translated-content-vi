---
title: "PerformanceEventTiming: thuộc tính processingEnd"
short-title: processingEnd
slug: Web/API/PerformanceEventTiming/processingEnd
page-type: web-api-instance-property
browser-compat: api.PerformanceEventTiming.processingEnd
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`processingEnd`** trả về thời điểm trình xử lý sự kiện cuối cùng kết thúc thực thi.

Nó bằng với {{domxref("PerformanceEventTiming.processingStart")}} khi không có trình xử lý sự kiện nào như vậy.

## Giá trị

Dấu thời gian {{domxref("DOMHighResTimeStamp")}}.

## Ví dụ

### Sử dụng thuộc tính processingEnd

Thuộc tính `processingEnd` có thể được sử dụng khi quan sát các mục event-timing ({{domxref("PerformanceEventTiming")}}). Ví dụ, để tính toán độ trễ đầu vào hoặc thời gian xử lý sự kiện.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    // Full duration
    const duration = entry.duration;
    // Input delay (before processing event)
    const delay = entry.processingStart - entry.startTime;
    // Synchronous event processing time
    // (between start and end dispatch)
    const time = entry.processingEnd - entry.processingStart;
  });
});
// Register the observer for events
observer.observe({ type: "event", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceEventTiming.processingStart")}}
