---
title: "PerformanceTiming: navigationStart property"
short-title: navigationStart
slug: Web/API/PerformanceTiming/navigationStart
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.navigationStart
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete).
> Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}} thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.navigationStart`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, ngay sau khi lời nhắc hủy tải kết thúc trên
tài liệu trước đó trong cùng ngữ cảnh duyệt web. Nếu không có tài liệu trước đó,
giá trị này sẽ giống với {{domxref("PerformanceTiming.fetchStart")}}.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
