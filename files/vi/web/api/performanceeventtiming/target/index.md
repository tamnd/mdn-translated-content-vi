---
title: "PerformanceEventTiming: thuộc tính target"
short-title: target
slug: Web/API/PerformanceEventTiming/target
page-type: web-api-instance-property
browser-compat: api.PerformanceEventTiming.target
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`target`** trả về mục tiêu cuối cùng [`target`](/en-US/docs/Web/API/Event/target) của sự kiện liên quan, tức là nút mà sự kiện được gửi đến lần cuối.

## Giá trị

Một {{domxref("Node")}} mà sự kiện được gửi đến lần cuối.

Hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu `Node` bị ngắt kết nối khỏi DOM của tài liệu hoặc đang ở trong [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM).

## Ví dụ

### Quan sát các sự kiện với một mục tiêu cuối cùng cụ thể

Thuộc tính `target` có thể được sử dụng khi quan sát các mục event-timing ({{domxref("PerformanceEventTiming")}}). Ví dụ, để chỉ ghi lại và đo lường các sự kiện cho một mục tiêu cuối cùng nhất định.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.target && entry.target.id === "myNode") {
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
