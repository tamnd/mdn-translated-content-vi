---
title: "PerformanceEventTiming: thuộc tính processingStart"
short-title: processingStart
slug: Web/API/PerformanceEventTiming/processingStart
page-type: web-api-instance-property
browser-compat: api.PerformanceEventTiming.processingStart
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`processingStart`** trả về thời điểm bắt đầu gửi sự kiện. Đây là lúc các trình xử lý sự kiện sắp được thực thi.

## Giá trị

Dấu thời gian {{domxref("DOMHighResTimeStamp")}}.

## Ví dụ

### Sử dụng thuộc tính processingStart

Thuộc tính `processingStart` có thể được sử dụng khi quan sát các mục event timing ({{domxref("PerformanceEventTiming")}}). Ví dụ, để tính toán độ trễ đầu vào hoặc thời gian xử lý sự kiện.

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

- {{domxref("PerformanceEventTiming.processingEnd")}}
