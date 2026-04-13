---
title: PerformanceObserver
slug: Web/API/PerformanceObserver
page-type: web-api-interface
browser-compat: api.PerformanceObserver
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Giao diện **`PerformanceObserver`** được dùng để quan sát các sự kiện đo lường hiệu năng và nhận thông báo về các {{domxref("PerformanceEntry","performance entry", '', 'true')}} mới khi chúng được ghi nhận trong _performance timeline_ của trình duyệt.

## Constructor

- {{domxref("PerformanceObserver.PerformanceObserver","PerformanceObserver()")}}
  - : Tạo và trả về một đối tượng `PerformanceObserver` mới.

## Thuộc tính tĩnh

- {{domxref("PerformanceObserver.supportedEntryTypes_static", "PerformanceObserver.supportedEntryTypes")}} {{ReadOnlyInline}}
  - : Trả về một mảng các giá trị {{domxref("PerformanceEntry.entryType","entryType")}} mà user agent hỗ trợ.

## Phương thức instance

- {{domxref("PerformanceObserver.observe","PerformanceObserver.observe()")}}
  - : Chỉ định tập hợp các kiểu entry cần quan sát. Hàm callback của performance observer sẽ được gọi khi performance entry được ghi nhận cho một trong các `entryTypes` đã chỉ định.
- {{domxref("PerformanceObserver.disconnect","PerformanceObserver.disconnect()")}}
  - : Ngừng việc callback của performance observer nhận các performance entry.
- {{domxref("PerformanceObserver.takeRecords","PerformanceObserver.takeRecords()")}}
  - : Trả về danh sách hiện tại các performance entry được lưu trong performance observer, đồng thời làm trống danh sách này.

## Ví dụ

### Tạo một PerformanceObserver

Ví dụ sau tạo một `PerformanceObserver` để theo dõi các sự kiện "mark" ({{domxref("PerformanceMark")}}) và "measure" ({{domxref("PerformanceMeasure")}}).
Hàm callback `perfObserver` cung cấp một `list` ({{domxref("PerformanceObserverEntryList")}}) cho phép bạn lấy các performance entry đã được quan sát.

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

## Xem thêm

- {{domxref('MutationObserver')}}
- {{domxref('ResizeObserver')}}
- {{domxref('IntersectionObserver')}}
