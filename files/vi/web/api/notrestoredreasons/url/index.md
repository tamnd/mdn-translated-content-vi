---
title: "NotRestoredReasons: url property"
short-title: url
slug: Web/API/NotRestoredReasons/url
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NotRestoredReasons.url
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("NotRestoredReasons")}} trả về một chuỗi đại diện cho URL của trang được điều hướng hoặc {{htmlelement("iframe")}}.

## Giá trị

Một chuỗi.

Nếu tài liệu ở trong `<iframe>` cross-origin, `url` sẽ trả về `null`.

## Ví dụ

Xem [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
- {{domxref("PerformanceNavigationTiming.notRestoredReasons")}}
