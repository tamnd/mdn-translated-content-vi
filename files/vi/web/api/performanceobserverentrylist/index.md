---
title: PerformanceObserverEntryList
slug: Web/API/PerformanceObserverEntryList
page-type: web-api-interface
browser-compat: api.PerformanceObserverEntryList
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Giao diện **`PerformanceObserverEntryList`** là danh sách các {{domxref("PerformanceEntry","sự kiện hiệu suất", '', 'true')}} được quan sát rõ ràng thông qua phương thức {{domxref("PerformanceObserver.observe","observe()")}}.

## Phương thức phiên bản

- {{domxref("PerformanceObserverEntryList.getEntries","PerformanceObserverEntryList.getEntries()")}}
  - : Trả về danh sách tất cả các đối tượng {{domxref("PerformanceEntry")}} được quan sát rõ ràng.
- {{domxref("PerformanceObserverEntryList.getEntriesByType","PerformanceObserverEntryList.getEntriesByType()")}}
  - : Trả về danh sách tất cả các đối tượng {{domxref("PerformanceEntry")}} được quan sát rõ ràng thuộc loại mục nhập đã cho.
- {{domxref("PerformanceObserverEntryList.getEntriesByName","PerformanceObserverEntryList.getEntriesByName()")}}
  - : Trả về danh sách tất cả các đối tượng {{domxref("PerformanceEntry")}} được quan sát rõ ràng dựa trên tên và loại mục nhập đã cho.

## Ví dụ

### Sử dụng PerformanceObserverEntryList

Trong ví dụ sau, `list` là đối tượng `PerformanceObserverEntryList`. Phương thức {{domxref("PerformanceObserverEntryList.getEntries","getEntries()")}} được gọi để lấy tất cả các đối tượng {{domxref("PerformanceEntry")}} được quan sát rõ ràng là "measure" và "mark" trong trường hợp này.

```js
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
