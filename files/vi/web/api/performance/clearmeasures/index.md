---
title: "Performance: clearMeasures() method"
short-title: clearMeasures()
slug: Web/API/Performance/clearMeasures
page-type: web-api-instance-method
browser-compat: api.Performance.clearMeasures
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`clearMeasures()`** xóa tất cả hoặc các đối tượng {{domxref("PerformanceMeasure")}} cụ thể khỏi timeline hiệu năng của trình duyệt.

## Cú pháp

```js-nolint
clearMeasures()
clearMeasures(name)
```

### Tham số

- `name` {{optional_inline}}
  - : Một chuỗi biểu thị {{domxref("PerformanceEntry.name", "name")}} của đối tượng {{domxref("PerformanceMeasure")}}. Nếu bỏ qua đối số này, tất cả các entry có {{domxref("PerformanceEntry.entryType","entryType")}} là `"measure"` sẽ bị xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa các measure

Để dọn sạch tất cả performance measure, hoặc chỉ các entry cụ thể, hãy dùng phương thức `clearMeasures()` như sau:

```js
// Tạo một loạt measure
performance.measure("from navigation");
performance.mark("a");
performance.measure("from mark a", "a");
performance.measure("from navigation");
performance.measure("from mark a", "a");
performance.mark("b");
performance.measure("between a and b", "a", "b");

performance.getEntriesByType("measure").length; // 5

// Chỉ xóa các entry measure "from navigation"
performance.clearMeasures("from navigation");
performance.getEntriesByType("measure").length; // 3

// Xóa tất cả entry measure
performance.clearMeasures();
performance.getEntriesByType("measure").length; // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceMeasure")}}
