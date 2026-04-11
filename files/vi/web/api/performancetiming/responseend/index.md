---
title: "PerformanceTiming: responseEnd property"
short-title: responseEnd
slug: Web/API/PerformanceTiming/responseEnd
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.responseEnd
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.responseEnd`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, khi trình duyệt nhận được byte cuối cùng của
phản hồi, hoặc khi kết nối đóng nếu điều này xảy ra trước, từ máy chủ từ
bộ nhớ đệm hoặc tài nguyên cục bộ.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
