---
title: "PerformanceEventTiming: thuộc tính interactionId"
short-title: interactionId
slug: Web/API/PerformanceEventTiming/interactionId
page-type: web-api-instance-property
browser-compat: api.PerformanceEventTiming.interactionId
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`interactionId`** của giao diện {{domxref("PerformanceEventTiming")}} trả về một ID xác định duy nhất tương tác người dùng đã kích hoạt một chuỗi các sự kiện liên quan.

## Giá trị

Một số. Đối với các loại sự kiện mà không có ID tương tác nào được tính, giá trị là 0.

## Mô tả

Khi người dùng tương tác với một trang web, một tương tác người dùng (ví dụ như nhấp chuột) thường kích hoạt một chuỗi sự kiện, chẳng hạn như các sự kiện `pointerdown`, `pointerup` và `click`. Để đo độ trễ của chuỗi sự kiện này, các sự kiện chia sẻ cùng một `interactionId`.

`interactionId` chỉ được tính cho các loại sự kiện sau thuộc về tương tác người dùng. Nếu không, giá trị là `0`.

| Loại sự kiện                                                                                                                                              | Tương tác người dùng |
| --------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- |
| {{domxref("Element/pointerdown_event", "pointerdown")}}, {{domxref("Element/pointerup_event", "pointerup")}}, {{domxref("Element/click_event", "click")}} | click / tap / drag   |
| {{domxref("Element/keydown_event", "keydown")}}, {{domxref("Element/keyup_event", "keyup")}}                                                              | key press            |

`interactionId` cũng cần thiết để tính toán chỉ số {{glossary("Interaction to next paint")}}, giúp phân tích khả năng phản hồi tương tác người dùng trong suốt vòng đời của một trang.

## Ví dụ

### Sử dụng interactionId

Ví dụ sau thu thập thời lượng sự kiện cho tất cả các sự kiện tương ứng với một tương tác. Map `eventLatencies` sau đó có thể được sử dụng để tìm các sự kiện có thời lượng tối đa cho một tương tác người dùng, chẳng hạn.

```js
// The key is the interaction ID.
let eventLatencies = {};

const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.interactionId > 0) {
      const interactionId = entry.interactionId;
      if (!eventLatencies.has(interactionId)) {
        eventLatencies[interactionId] = [];
      }
      eventLatencies[interactionId].push(entry.duration);
    }
  });
});

observer.observe({ type: "event", buffered: true });

// Log events with maximum event duration for a user interaction
Object.entries(eventLatencies).forEach(([k, v]) => {
  console.log(Math.max(...v));
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
