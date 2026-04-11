---
title: "PerformanceTiming: responseStart property"
short-title: responseStart
slug: Web/API/PerformanceTiming/responseStart
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.responseStart
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.responseStart`**
trả về một `unsigned long long` biểu diễn thời điểm
(tính bằng mili giây kể từ kỷ nguyên UNIX) khi trình duyệt nhận được byte đầu tiên của
phản hồi từ máy chủ, bộ nhớ đệm, hoặc tài nguyên cục bộ.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
