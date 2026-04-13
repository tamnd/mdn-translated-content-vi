---
title: "NotRestoredReasons: src property"
short-title: src
slug: Web/API/NotRestoredReasons/src
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NotRestoredReasons.src
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`src`** của giao diện {{domxref("NotRestoredReasons")}} trả về một chuỗi đại diện cho đường dẫn đến nguồn của {{htmlelement("iframe")}} chứa tài liệu (ví dụ `<iframe src="b.html">`).

## Giá trị

Một chuỗi.

Nếu tài liệu không ở trong `<iframe>`, `src` sẽ trả về `null`.

## Ví dụ

Xem [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
- {{domxref("PerformanceNavigationTiming.notRestoredReasons")}}
