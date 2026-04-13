---
title: "PerformanceObserverEntryList: getEntriesByType() method"
short-title: getEntriesByType()
slug: Web/API/PerformanceObserverEntryList/getEntriesByType
page-type: web-api-instance-method
browser-compat: api.PerformanceObserverEntryList.getEntriesByType
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`getEntriesByType()`** của giao diện {{domxref("PerformanceObserverEntryList")}} trả về danh sách các đối tượng {{domxref("PerformanceEntry","mục nhập hiệu suất", '', 'true')}} được _quan sát_ rõ ràng cho {{domxref("PerformanceEntry.entryType","loại mục nhập hiệu suất", '', 'true')}} đã cho. Các thành viên của danh sách được xác định bởi tập hợp {{domxref("PerformanceEntry.entryType","loại mục nhập", '', 'true')}} được chỉ định trong lệnh gọi phương thức {{domxref("PerformanceObserver.observe","observe()")}}. Danh sách có sẵn trong hàm callback của observer (là tham số đầu tiên trong callback).

## Cú pháp

```js-nolint
getEntriesByType(type)
```

### Tham số

- `type`
  - : Loại mục nhập cần lấy như `"mark"`. Các loại mục nhập hợp lệ được liệt kê trong {{domxref("PerformanceEntry.entryType")}}.

### Giá trị trả về

Danh sách các đối tượng {{domxref("PerformanceEntry")}} được _quan sát_ rõ ràng có `type` đã chỉ định. Các mục sẽ theo thứ tự thời gian dựa trên {{domxref("PerformanceEntry.startTime","startTime")}} của các mục nhập. Nếu không có đối tượng nào có `type` đã chỉ định, hoặc không có đối số nào được cung cấp, danh sách rỗng được trả về.

## Ví dụ

### Làm việc với getEntries, getEntriesByName và getEntriesByType

Ví dụ sau cho thấy sự khác biệt giữa các phương thức {{domxref("PerformanceObserverEntryList.getEntries", "getEntries()")}}, {{domxref("PerformanceObserverEntryList.getEntriesByName", "getEntriesByName()")}}, và `getEntriesByType()`.

```js
const observer = new PerformanceObserver((list, obs) => {
  // Log all entries
  let perfEntries = list.getEntries();
  perfEntries.forEach((entry) => {
    console.log(`${entry.name}'s duration: ${entry.duration}`);
  });

  // Log entries named "debugging" with type "measure"
  perfEntries = list.getEntriesByName("debugging", "measure");
  perfEntries.forEach((entry) => {
    console.log(`${entry.name}'s duration: ${entry.duration}`);
  });

  // Log entries with type "mark"
  perfEntries = list.getEntriesByType("mark");
  perfEntries.forEach((entry) => {
    console.log(`${entry.name}'s startTime: ${entry.startTime}`);
  });
});

// Subscribe to various performance event types
observer.observe({
  entryTypes: ["mark", "measure", "navigation", "resource"],
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
