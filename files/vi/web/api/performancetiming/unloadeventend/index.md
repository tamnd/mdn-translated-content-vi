---
title: "PerformanceTiming: unloadEventEnd property"
short-title: unloadEventEnd
slug: Web/API/PerformanceTiming/unloadEventEnd
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.unloadEventEnd
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.unloadEventEnd`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, trình xử lý sự kiện {{domxref("Window/unload_event", "unload")}} kết thúc. Nếu
không có tài liệu trước đó, hoặc nếu tài liệu trước đó, hoặc một trong các
chuyển hướng cần thiết, không cùng nguồn gốc, giá trị trả về là `0`.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
