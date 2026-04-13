---
title: "Performance: navigation property"
short-title: navigation
slug: Web/API/Performance/navigation
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Performance.navigation
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

Thuộc tính chỉ đọc kiểu cũ **`Performance.navigation`** trả về một đối tượng {{domxref("PerformanceNavigation")}} biểu thị kiểu điều hướng xảy ra trong ngữ cảnh duyệt đã cho, chẳng hạn như số lần chuyển hướng cần thiết để tìm nạp tài nguyên.

Thuộc tính này không có sẵn trong worker.

> [!WARNING]
> Thuộc tính này đã lỗi thời trong [đặc tả Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng dùng giao diện {{domxref("PerformanceNavigationTiming")}} thay thế.

## Giá trị

Một đối tượng {{domxref("PerformanceNavigation")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("Performance")}} mà nó thuộc về.
