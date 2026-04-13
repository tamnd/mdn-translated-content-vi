---
title: "PerformanceEntry: duration property"
short-title: duration
slug: Web/API/PerformanceEntry/duration
page-type: web-api-instance-property
browser-compat: api.PerformanceEntry.duration
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`duration`** trả về một {{domxref("DOMHighResTimeStamp","timestamp", "", "no-code")}} là thời lượng của {{domxref("PerformanceEntry","performance entry", "", "no-code")}}. Ý nghĩa của thuộc tính này phụ thuộc vào giá trị {{domxref("PerformanceEntry.entryType", "entryType")}} của entry.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời lượng của {{domxref("PerformanceEntry","performance entry", "", "no-code")}}. Nếu khái niệm thời lượng không áp dụng cho một chỉ số hiệu năng cụ thể, giá trị trả về là `0`.

Ý nghĩa của thuộc tính này phụ thuộc vào giá trị {{domxref("PerformanceEntry.entryType","entryType")}} của performance entry:

- `event`
  - : Thời gian từ `startTime` của sự kiện đến lần sơn tiếp theo (làm tròn đến 8ms gần nhất).
- `first-input`
  - : Thời gian từ `startTime` của sự kiện nhập đầu tiên đến lần sơn tiếp theo (làm tròn đến 8ms gần nhất).
- `longtask`
  - : Thời gian trôi qua giữa lúc bắt đầu và kết thúc tác vụ, với độ phân giải 1ms.
- `measure`
  - : Thời lượng của phép đo.
- `navigation`
  - : Chênh lệch giữa các thuộc tính {{domxref("PerformanceNavigationTiming.loadEventEnd", "loadEventEnd")}} và {{domxref("PerformanceEntry.startTime", "startTime")}}.
- `resource`
  - : Giá trị {{domxref("PerformanceResourceTiming/responseEnd", "responseEnd")}} của entry trừ đi giá trị {{domxref("PerformanceEntry.startTime","startTime")}} của entry.

Với các kiểu entry sau, `duration` không áp dụng, và trong trường hợp này giá trị luôn là `0`:

- `element`
- `largest-contentful-paint`
- `layout-shift`
- `mark`
- `paint`
- `taskattribution`
- `visibility-state`

## Ví dụ

### Sử dụng thuộc tính duration

Ví dụ sau ghi lại tất cả performance entry được quan sát có `duration` lớn hơn `0`.

```js
function perfObserver(list, observer) {
  list.getEntries().forEach((entry) => {
    if (entry.duration > 0) {
      console.log(`${entry.name}'s duration: ${entry.duration}`);
    }
  });
}
const observer = new PerformanceObserver(perfObserver);
observer.observe({ entryTypes: ["measure", "mark", "resource"] });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
