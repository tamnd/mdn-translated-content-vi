---
title: PerformanceMeasure
slug: Web/API/PerformanceMeasure
page-type: web-api-interface
browser-compat: api.PerformanceMeasure
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

**`PerformanceMeasure`** là một giao diện _trừu tượng_ cho các đối tượng {{domxref("PerformanceEntry")}} có {{domxref("PerformanceEntry.entryType","entryType")}} là `"measure"`. Các mục nhập loại này được tạo bằng cách gọi {{domxref("Performance.measure","performance.measure()")}} để thêm một {{domxref("DOMHighResTimeStamp")}} _được đặt tên_ (phép đo) giữa hai _điểm đánh dấu_ vào _dòng thời gian hiệu suất_ của trình duyệt.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("PerformanceMeasure.detail")}}
  - : Chứa siêu dữ liệu tùy ý về phép đo.

Giao diện này mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau bằng cách đủ điều kiện/ràng buộc chúng như sau:

- {{domxref("PerformanceEntry.entryType")}}
  - : Trả về `"measure"`.
- {{domxref("PerformanceEntry.name")}}
  - : Trả về tên được đặt cho phép đo khi nó được tạo thông qua lệnh gọi {{domxref("Performance.measure()","performance.measure()")}}.
- {{domxref("PerformanceEntry.startTime")}}
  - : Trả về {{domxref("DOMHighResTimeStamp","timestamp")}} được đặt cho phép đo khi {{domxref("Performance.measure()","performance.measure()")}} được gọi.
- {{domxref("PerformanceEntry.duration")}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} là thời lượng của phép đo (thường là dấu thời gian điểm đánh dấu kết thúc của phép đo trừ dấu thời gian điểm đánh dấu bắt đầu).

## Phương thức phiên bản

Giao diện này không có phương thức nào.

## Ví dụ

Xem ví dụ trong [Using the User Timing API](/en-US/docs/Web/API/Performance_API/User_timing).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [User Timing (Overview)](/en-US/docs/Web/API/Performance_API/User_timing)
- [Using the User Timing API](/en-US/docs/Web/API/Performance_API/User_timing)
