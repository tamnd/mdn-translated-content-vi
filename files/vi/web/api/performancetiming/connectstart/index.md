---
title: "PerformanceTiming: connectStart property"
short-title: connectStart
slug: Web/API/PerformanceTiming/connectStart
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.connectStart
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.connectStart`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, yêu cầu mở kết nối được gửi đến
mạng. Nếu lớp truyền tải báo cáo lỗi và việc thiết lập kết nối được
bắt đầu lại, thời gian bắt đầu thiết lập kết nối cuối cùng được cung cấp. Nếu kết nối liên tục
được sử dụng, giá trị sẽ giống với
{{domxref("PerformanceTiming.fetchStart")}}.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
