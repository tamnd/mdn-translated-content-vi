---
title: "PerformanceTiming: domContentLoadedEventStart property"
short-title: domContentLoadedEventStart
slug: Web/API/PerformanceTiming/domContentLoadedEventStart
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.domContentLoadedEventStart
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.domContentLoadedEventStart`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, ngay trước khi trình phân tích cú pháp gửi
sự kiện {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}}, tức là ngay sau khi tất cả các script cần được
thực thi ngay sau khi phân tích cú pháp đã được thực thi.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
