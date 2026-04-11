---
title: "Performance: getEntries() method"
short-title: getEntries()
slug: Web/API/Performance/getEntries
page-type: web-api-instance-method
browser-compat: api.Performance.getEntries
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`getEntries()`** trả về một mảng chứa tất cả các đối tượng {{domxref("PerformanceEntry")}} hiện có trong performance timeline.

Nếu bạn chỉ quan tâm đến performance entry có kiểu hoặc tên nhất định, xem {{domxref("Performance.getEntriesByType", "getEntriesByType()")}} và {{domxref("Performance.getEntriesByName", "getEntriesByName()")}}.

> [!NOTE]
> Phương thức này không thông báo cho bạn về performance entry mới; bạn chỉ nhận được những entry đang có trong performance timeline tại thời điểm gọi phương thức.
> Để nhận thông báo khi entry mới xuất hiện, hãy dùng {{domxref("PerformanceObserver")}}.

Các kiểu entry sau không được phương thức này hỗ trợ và sẽ không bao giờ được trả về, ngay cả khi entry cho chúng tồn tại:

- `"element"` ({{domxref("PerformanceElementTiming")}})
- `"event"` ({{domxref("PerformanceEventTiming")}})
- `"largest-contentful-paint"` ({{domxref("LargestContentfulPaint")}})
- `"layout-shift"` ({{domxref("LayoutShift")}})
- `"longtask"` ({{domxref("PerformanceLongTaskTiming")}})

Để truy cập các entry này, bạn phải dùng {{domxref("PerformanceObserver")}}.

## Cú pháp

```js-nolint
getEntries()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng {{domxref("PerformanceEntry")}}. Các phần tử sẽ ở thứ tự thời gian dựa trên {{domxref("PerformanceEntry.startTime","startTime")}} của từng entry.

## Ví dụ

### Ghi nhật ký tất cả marker và measure hiệu năng

Giả sử bạn đã tạo các đối tượng {{domxref("PerformanceMark")}} và {{domxref("PerformanceMeasure")}} ở những vị trí phù hợp trong mã của mình, bạn có thể muốn ghi tất cả chúng ra console như sau:

```js
// Ví dụ marker/measure
performance.mark("login-started");
performance.mark("login-finished");
performance.mark("form-sent");
performance.mark("video-loaded");
performance.measure("login-duration", "login-started", "login-finished");

const entries = performance.getEntries();

entries.forEach((entry) => {
  if (entry.entryType === "mark") {
    console.log(`${entry.name}'s startTime: ${entry.startTime}`);
  }
  if (entry.entryType === "measure") {
    console.log(`${entry.name}'s duration: ${entry.duration}`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Performance.getEntriesByType()")}}
- {{domxref("Performance.getEntriesByName()")}}
