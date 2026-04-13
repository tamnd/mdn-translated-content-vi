---
title: "Performance: getEntriesByName() method"
short-title: getEntriesByName()
slug: Web/API/Performance/getEntriesByName
page-type: web-api-instance-method
browser-compat: api.Performance.getEntriesByName
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`getEntriesByName()`** trả về một mảng các đối tượng {{domxref("PerformanceEntry")}} hiện có trong performance timeline với _name_ và _type_ đã cho.

Nếu bạn quan tâm đến các performance entry có kiểu nhất định, xem {{domxref("Performance.getEntriesByType", "getEntriesByType()")}}. Để lấy tất cả performance entry, xem {{domxref("Performance.getEntries", "getEntries()")}}.

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
getEntriesByName(name)
getEntriesByName(name, type)
```

### Tham số

- `name`
  - : Tên của các entry cần truy xuất.
- `type` {{optional_inline}}
  - : Kiểu của các entry cần truy xuất, chẳng hạn `"mark"`. Các entry type hợp lệ được liệt kê trong {{domxref("PerformanceEntry.entryType")}}.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng {{domxref("PerformanceEntry")}} có `name` và `type` được chỉ định. Các phần tử sẽ ở thứ tự thời gian dựa trên {{domxref("PerformanceEntry.startTime","startTime")}} của từng entry. Nếu không có đối tượng nào thỏa điều kiện đã chỉ định, một mảng rỗng sẽ được trả về.

## Ví dụ

### Ghi nhật ký marker hiệu năng

Ví dụ sau ghi nhật ký tất cả các đối tượng {{domxref("PerformanceMark")}} có tên `"debug-mark"`.

```js
const debugMarks = performance.getEntriesByName("debug-mark", "mark");
debugMarks.forEach((entry) => {
  console.log(`${entry.name}'s startTime: ${entry.startTime}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Performance.getEntries()")}}
- {{domxref("Performance.getEntriesByType()")}}
