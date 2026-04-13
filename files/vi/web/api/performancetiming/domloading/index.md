---
title: "PerformanceTiming: domLoading property"
short-title: domLoading
slug: Web/API/PerformanceTiming/domLoading
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.domLoading
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.domLoading`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, khi trình phân tích cú pháp bắt đầu công việc, tức là khi
{{domxref("Document.readyState")}} của nó thay đổi thành `'loading'` và
sự kiện {{domxref("Document/readystatechange_event", "readystatechange")}} tương ứng được phát ra.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
