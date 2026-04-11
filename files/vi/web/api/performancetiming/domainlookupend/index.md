---
title: "PerformanceTiming: domainLookupEnd property"
short-title: domainLookupEnd
slug: Web/API/PerformanceTiming/domainLookupEnd
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.domainLookupEnd
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.domainLookupEnd`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, quá trình tra cứu tên miền kết thúc. Nếu
kết nối liên tục được sử dụng, hoặc thông tin được lưu trong bộ nhớ đệm hoặc tài nguyên cục bộ,
giá trị sẽ giống với {{domxref("PerformanceTiming.fetchStart")}}.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
