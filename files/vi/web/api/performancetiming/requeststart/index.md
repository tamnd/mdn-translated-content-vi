---
title: "PerformanceTiming: requestStart property"
short-title: requestStart
slug: Web/API/PerformanceTiming/requestStart
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.requestStart
---

{{ APIRef("PerformanceTiming") }} {{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.requestStart`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, khi trình duyệt gửi yêu cầu để lấy
tài liệu thực tế, từ máy chủ hoặc từ bộ nhớ đệm. Nếu lớp truyền tải thất bại sau
khi bắt đầu yêu cầu và kết nối được mở lại, thuộc tính này sẽ được đặt thành thời gian
tương ứng với yêu cầu mới.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
