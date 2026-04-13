---
title: "PerformanceTiming: loadEventStart property"
short-title: loadEventStart
slug: Web/API/PerformanceTiming/loadEventStart
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.loadEventStart
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng thuộc tính chỉ đọc {{domxref("PerformanceNavigationTiming.loadEventStart")}} của giao diện {{domxref("PerformanceNavigationTiming")}} thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.loadEventStart`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, khi sự kiện {{domxref("Window/load_event", "load")}} được gửi cho
tài liệu hiện tại. Nếu sự kiện này chưa được gửi, giá trị trả về là `0`.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
