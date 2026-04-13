---
title: "Performance: getEntriesByType() method"
short-title: getEntriesByType()
slug: Web/API/Performance/getEntriesByType
page-type: web-api-instance-method
browser-compat: api.Performance.getEntriesByType
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`getEntriesByType()`** trả về một mảng các đối tượng {{domxref("PerformanceEntry")}} hiện có trong performance timeline cho một _type_ đã cho.

Nếu bạn quan tâm đến các performance entry có tên nhất định, xem {{domxref("Performance.getEntriesByName", "getEntriesByName()")}}. Để lấy tất cả performance entry, xem {{domxref("Performance.getEntries", "getEntries()")}}.

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
getEntriesByType(type)
```

### Tham số

- `type`
  - : Kiểu entry cần truy xuất, chẳng hạn `"mark"`. Các entry type hợp lệ được liệt kê trong {{domxref("PerformanceEntry.entryType")}}. Các `entryTypes` được hỗ trợ có thể lấy bằng thuộc tính tĩnh {{domxref("PerformanceObserver.supportedEntryTypes_static", "PerformanceObserver.supportedEntryTypes")}}.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng {{domxref("PerformanceEntry")}} có `type` được chỉ định. Các phần tử sẽ ở thứ tự thời gian dựa trên {{domxref("PerformanceEntry.startTime","startTime")}} của từng entry. Nếu không có đối tượng nào có `type` được chỉ định, hoặc không cung cấp đối số, một mảng rỗng sẽ được trả về.

## Ví dụ

### Ghi nhật ký các resource entry

Ví dụ sau ghi nhật ký mọi entry có kiểu `"resource"`.

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  console.log(`${entry.name}'s startTime: ${entry.startTime}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Performance.getEntries()")}}
- {{domxref("Performance.getEntriesByName()")}}
- {{domxref("PerformanceObserver.supportedEntryTypes_static", "PerformanceObserver.supportedEntryTypes")}}
