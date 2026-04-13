---
title: "PerformanceEventTiming: thuộc tính cancelable"
short-title: cancelable
slug: Web/API/PerformanceEventTiming/cancelable
page-type: web-api-instance-property
browser-compat: api.PerformanceEventTiming.cancelable
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`cancelable`** trả về thuộc tính [`cancelable`](/en-US/docs/Web/API/Event/cancelable) của sự kiện liên quan, cho biết liệu sự kiện có thể bị hủy hay không.

## Giá trị

Một giá trị boolean. `true` nếu sự kiện liên quan có thể bị hủy, `false` nếu không.

## Ví dụ

### Quan sát các sự kiện không thể hủy

Thuộc tính `cancelable` có thể được sử dụng khi quan sát các mục event-timing ({{domxref("PerformanceEventTiming")}}). Ví dụ, để chỉ ghi lại và đo lường các sự kiện không thể hủy.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (!entry.cancelable) {
      const delay = entry.processingStart - entry.startTime;
      console.log(entry.name, delay);
    }
  });
});

// Register the observer for events
observer.observe({ type: "event", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
