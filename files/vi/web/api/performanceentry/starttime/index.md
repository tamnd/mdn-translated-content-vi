---
title: "PerformanceEntry: startTime property"
short-title: startTime
slug: Web/API/PerformanceEntry/startTime
page-type: web-api-instance-property
browser-compat: api.PerformanceEntry.startTime
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`startTime`** trả về {{domxref("DOMHighResTimeStamp","timestamp", "", "no-code")}} đầu tiên được ghi nhận cho {{domxref("PerformanceEntry")}} này. Ý nghĩa của thuộc tính này phụ thuộc vào giá trị {{domxref("PerformanceEntry.entryType", "entryType")}} của entry.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} biểu thị timestamp đầu tiên khi {{domxref("PerformanceEntry")}} được tạo.

Ý nghĩa của thuộc tính này phụ thuộc vào giá trị {{domxref("PerformanceEntry.entryType","entryType")}} của performance entry:

- `element`
  - : Hoặc là giá trị {{domxref("PerformanceElementTiming.renderTime", "renderTime")}} của entry này nếu nó khác `0`, nếu không thì là giá trị {{domxref("PerformanceElementTiming.loadTime", "loadTime")}} của entry này.
- `event`
  - : Thời gian sự kiện được tạo, tức là thuộc tính [`timeStamp`](/en-US/docs/Web/API/Event/timeStamp) của sự kiện.
- `first-input`
  - : Thời gian sự kiện nhập đầu tiên được tạo, tức là thuộc tính [`timeStamp`](/en-US/docs/Web/API/Event/timeStamp) của sự kiện đó.
- `largest-contentful-paint`
  - : Giá trị {{domxref("LargestContentfulPaint.renderTime", "renderTime")}} của entry này nếu nó khác `0`, nếu không thì là giá trị {{domxref("LargestContentfulPaint.loadTime", "loadTime")}} của entry này.
- `layout-shift`
  - : Thời điểm layout shift bắt đầu.
- `longtask`
  - : Thời điểm tác vụ bắt đầu.
- `mark`
  - : Thời điểm mark được tạo bằng lời gọi {{domxref("Performance.mark","performance.mark()")}}.
- `measure`
  - : Thời điểm measure được tạo bằng lời gọi {{domxref("Performance.measure","performance.measure()")}}.
- `navigation`
  - : Luôn là `0`.
- `paint`
  - : Thời điểm paint xảy ra.
- `resource`
  - : Giá trị thuộc tính {{domxref("PerformanceResourceTiming.fetchStart", "fetchStart")}} của entry này.
- `taskattribution`
  - : Luôn là `0`.
- `visibility-state`
  - : Thời điểm thay đổi trạng thái hiển thị xảy ra.

## Ví dụ

### Sử dụng thuộc tính startTime

Ví dụ sau cho thấy cách dùng thuộc tính `startTime`, bạn có thể ghi lại trong quá trình quan sát hiệu năng.

Lưu ý: phương thức {{domxref("performance.mark()")}} cho phép bạn tự đặt `startTime`, và phương thức {{domxref("performance.measure()")}} cho phép đặt điểm bắt đầu của phép đo.

```js
performance.mark("my-mark");
performance.mark("my-other-mark", { startTime: 12.5 });

loginButton.addEventListener("click", (clickEvent) => {
  performance.measure("login-click", { start: clickEvent.timeStamp });
});

function perfObserver(list, observer) {
  list.getEntries().forEach((entry) => {
    if (entry.entryType === "mark") {
      console.log(`${entry.name}'s startTime: ${entry.startTime}`);
    }
    if (entry.entryType === "measure") {
      console.log(`${entry.name}'s duration: ${entry.duration}`);
    }
  });
}
const observer = new PerformanceObserver(perfObserver);
observer.observe({ entryTypes: ["measure", "mark"] });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
