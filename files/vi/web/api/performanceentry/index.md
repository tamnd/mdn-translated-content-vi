---
title: PerformanceEntry
slug: Web/API/PerformanceEntry
page-type: web-api-interface
browser-compat: api.PerformanceEntry
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Đối tượng **`PerformanceEntry`** đóng gói một chỉ số hiệu năng đơn lẻ, là một phần của performance timeline của trình duyệt.

Performance API cung cấp các chỉ số dựng sẵn là những lớp con chuyên biệt của `PerformanceEntry`. Điều này bao gồm các entry cho tải tài nguyên, thời gian sự kiện, và nhiều hơn nữa.

Bạn cũng có thể tạo một performance entry bằng cách gọi các phương thức {{domxref("Performance.mark()")}} hoặc {{domxref("Performance.measure()")}} tại một điểm cụ thể trong ứng dụng. Điều này cho phép bạn thêm các chỉ số riêng của mình vào performance timeline.

Các thể hiện `PerformanceEntry` luôn thuộc một trong các lớp con sau:

- {{domxref("LargestContentfulPaint")}}
- {{domxref("LayoutShift")}}
- {{domxref("PerformanceEventTiming")}}
- {{domxref("PerformanceLongAnimationFrameTiming")}}
- {{domxref("PerformanceLongTaskTiming")}}
- {{domxref("PerformanceMark")}}
- {{domxref("PerformanceMeasure")}}
- {{domxref("PerformanceNavigationTiming")}}
- {{domxref("PerformancePaintTiming")}}
- {{domxref("PerformanceResourceTiming")}}
- {{domxref("PerformanceScriptTiming")}}
- {{domxref("PerformanceServerTiming")}}
- {{domxref("TaskAttributionTiming")}}
- {{domxref("VisibilityStateEntry")}}

## Thuộc tính instance

- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị tên của performance entry. Giá trị phụ thuộc vào lớp con.
- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị loại chỉ số hiệu năng. Ví dụ, `"mark"` khi dùng {{domxref("PerformanceMark")}}.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm bắt đầu của chỉ số hiệu năng.
- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời lượng của performance entry.

## Phương thức instance

- {{domxref("PerformanceEntry.toJSON","PerformanceEntry.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `PerformanceEntry`.

## Ví dụ

### Làm việc với performance entry

Ví dụ sau tạo các đối tượng `PerformanceEntry` thuộc các kiểu {{domxref("PerformanceMark")}} và {{domxref("PerformanceMeasure")}}.
Các lớp con `PerformanceMark` và `PerformanceMeasure` kế thừa các thuộc tính `duration`, `entryType`, `name`, và `startTime` từ `PerformanceEntry` và gán cho chúng các giá trị phù hợp.

```js
// Đặt tại vị trí trong mã bắt đầu đăng nhập
performance.mark("login-started");

// Đặt tại vị trí trong mã kết thúc đăng nhập
performance.mark("login-finished");

// Đo thời lượng đăng nhập
performance.measure("login-duration", "login-started", "login-finished");

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
