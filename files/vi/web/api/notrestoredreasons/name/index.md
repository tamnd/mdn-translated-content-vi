---
title: "NotRestoredReasons: name property"
short-title: name
slug: Web/API/NotRestoredReasons/name
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NotRestoredReasons.name
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("NotRestoredReasons")}} trả về một chuỗi đại diện cho giá trị thuộc tính `name` của {{htmlelement("iframe")}} chứa tài liệu (ví dụ `<iframe name="bar" src="...">`).

## Giá trị

Một chuỗi.

Nếu tài liệu không ở trong `<iframe>` hoặc `<iframe>` không có `name`, `name` sẽ trả về `null`.

## Ví dụ

Xem [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
- {{domxref("PerformanceNavigationTiming.notRestoredReasons")}}
