---
title: TaskAttributionTiming
slug: Web/API/TaskAttributionTiming
page-type: web-api-interface
status:
  - experimental
browser-compat: api.TaskAttributionTiming
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Giao diện **`TaskAttributionTiming`** trả về thông tin về công việc liên quan đến một tác vụ dài (long task) và ngữ cảnh khung (frame context) liên quan. Ngữ cảnh khung, còn được gọi là container, là iframe, embed hoặc object đang bị quy trách nhiệm, về tổng thể, cho một tác vụ dài.

Bạn thường làm việc với các đối tượng `TaskAttributionTiming` khi quan sát [các tác vụ dài](/en-US/docs/Web/API/PerformanceLongTaskTiming).

`TaskAttributionTiming` kế thừa từ {{domxref("PerformanceEntry")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

Giao diện này mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau đây cho các loại mục hiệu suất event timing bằng cách giới hạn chúng như sau:

- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Luôn trả về `0`, vì `duration` không áp dụng cho giao diện này.
- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Luôn trả về `taskattribution`.
- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Luôn trả về `"unknown"`.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Luôn trả về `0`.

Giao diện này cũng hỗ trợ các thuộc tính sau:

- {{domxref('TaskAttributionTiming.containerType')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về kiểu container của khung, một trong các giá trị `iframe`, `embed`, hoặc `object`.
- {{domxref('TaskAttributionTiming.containerSrc')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về thuộc tính `src` của container.
- {{domxref('TaskAttributionTiming.containerId')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về thuộc tính `id` của container.
- {{domxref('TaskAttributionTiming.containerName')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về thuộc tính `name` của container.

## Phương thức phiên bản

- {{domxref("TaskAttributionTiming.toJSON()")}} {{Experimental_Inline}}
  - : Trả về biểu diễn JSON của đối tượng `TaskAttributionTiming`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceLongTaskTiming")}}
