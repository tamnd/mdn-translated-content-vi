---
title: PerformanceMark
slug: Web/API/PerformanceMark
page-type: web-api-interface
browser-compat: api.PerformanceMark
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

**`PerformanceMark`** là một giao diện cho các đối tượng {{domxref("PerformanceEntry")}} với {{domxref("PerformanceEntry.entryType","entryType")}} là `"mark"`.

Các mục nhập loại này thường được tạo bằng cách gọi {{domxref("Performance.mark","performance.mark()")}} để thêm một {{domxref("DOMHighResTimeStamp")}} _có tên_ (dấu _mark_) vào timeline hiệu suất của trình duyệt. Để tạo một performance mark không được thêm vào timeline hiệu suất của trình duyệt, hãy sử dụng hàm khởi tạo.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PerformanceMark.PerformanceMark", "PerformanceMark()")}}
  - : Tạo một đối tượng `PerformanceMark` mới không được thêm vào timeline hiệu suất của trình duyệt.

## Thuộc tính phiên bản

- {{domxref("PerformanceMark.detail")}}
  - : Chứa siêu dữ liệu tùy ý về measure.

Giao diện này mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau bằng cách xác định/ràng buộc các thuộc tính như sau:

- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}}
  - : Trả về `"mark"`.
- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}}
  - : Trả về tên được đặt cho mark khi nó được tạo thông qua cuộc gọi đến {{domxref("Performance.mark()","performance.mark()")}}.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} khi {{domxref("Performance.mark()","performance.mark()")}} được gọi.
- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}}
  - : Trả về `0`. (Một mark không có _duration_.)

## Phương thức phiên bản

Giao diện này không có phương thức.

## Ví dụ

Xem ví dụ trong [Sử dụng User Timing API](/en-US/docs/Web/API/Performance_API/User_timing).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [User Timing (Tổng quan)](/en-US/docs/Web/API/Performance_API/User_timing)
- [Sử dụng User Timing API](/en-US/docs/Web/API/Performance_API/User_timing)
