---
title: "PerformanceTiming: redirectStart property"
short-title: redirectStart
slug: Web/API/PerformanceTiming/redirectStart
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.redirectStart
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.redirectStart`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, chuyển hướng HTTP đầu tiên bắt đầu. Nếu không có
chuyển hướng, hoặc nếu một trong các chuyển hướng không cùng nguồn gốc, giá trị trả về là
`0`.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
