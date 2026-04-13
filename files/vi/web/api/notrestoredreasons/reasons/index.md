---
title: "NotRestoredReasons: reasons property"
short-title: reasons
slug: Web/API/NotRestoredReasons/reasons
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NotRestoredReasons.reasons
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`reasons`** của giao diện {{domxref("NotRestoredReasons")}} trả về một mảng các đối tượng {{domxref("NotRestoredReasonDetails")}}, mỗi đối tượng đại diện cho một lý do tại sao trang được điều hướng đến bị chặn không sử dụng bộ đệm back/forward ({{Glossary("bfcache")}}).

## Giá trị

Một mảng các đối tượng {{domxref("NotRestoredReasonDetails")}}. Xem [Lý do chặn](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons#blocking_reasons) để biết danh sách các lý do chặn có thể.

Nếu tài liệu ở trong {{htmlelement("iframe")}} cross-origin, `reasons` sẽ trả về `null`, nhưng tài liệu cha có thể hiển thị `reason` là `"masked"` nếu bất kỳ `<iframe>` nào chặn sử dụng bfcache cho khung cấp cao nhất.

## Ví dụ

Xem [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
- {{domxref("PerformanceNavigationTiming.notRestoredReasons")}}
