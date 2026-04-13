---
title: "PerformanceObserverEntryList: getEntries() method"
short-title: getEntries()
slug: Web/API/PerformanceObserverEntryList/getEntries
page-type: web-api-instance-method
browser-compat: api.PerformanceObserverEntryList.getEntries
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`getEntries()`** của giao diện {{domxref("PerformanceObserverEntryList")}} trả về danh sách các đối tượng {{domxref("PerformanceEntry","mục nhập hiệu suất", '', 'true')}} được quan sát rõ ràng. Các thành viên của danh sách được xác định bởi tập hợp {{domxref("PerformanceEntry.entryType","loại mục nhập", '', 'true')}} được chỉ định trong lệnh gọi phương thức {{domxref("PerformanceObserver.observe","observe()")}}. Danh sách có sẵn trong hàm callback của observer (là tham số đầu tiên trong callback).

## Cú pháp

```js-nolint
getEntries()
```

### Tham số

Không có.

### Giá trị trả về

Danh sách các đối tượng {{domxref("PerformanceEntry")}} được quan sát rõ ràng. Các mục sẽ theo thứ tự thời gian dựa trên {{domxref("PerformanceEntry.startTime","startTime")}} của các mục nhập. Nếu không tìm thấy đối tượng nào, danh sách rỗng được trả về.

## Ví dụ

### Làm việc với getEntries, getEntriesByName và getEntriesByType

Ví dụ sau cho thấy sự khác biệt giữa các phương thức `getEntries()`, {{domxref("PerformanceObserverEntryList.getEntriesByName", "getEntriesByName()")}}, và {{domxref("PerformanceObserverEntryList.getEntriesByType", "getEntriesByType()")}}.

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
