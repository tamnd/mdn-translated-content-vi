---
title: "PerformanceTiming: fetchStart property"
short-title: fetchStart
slug: Web/API/PerformanceTiming/fetchStart
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.fetchStart
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.fetchStart`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, trình duyệt sẵn sàng tải tài liệu bằng
yêu cầu HTTP. Thời điểm này _trước_ khi kiểm tra bất kỳ bộ nhớ đệm ứng dụng nào.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
