---
title: "NotRestoredReasons: children property"
short-title: children
slug: Web/API/NotRestoredReasons/children
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NotRestoredReasons.children
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`children`** của giao diện {{domxref("NotRestoredReasons")}} trả về một mảng các đối tượng {{domxref("NotRestoredReasons")}}, một cho mỗi {{htmlelement("iframe")}} con được nhúng trong tài liệu hiện tại, có thể chứa các lý do tại sao khung cấp cao nhất bị chặn liên quan đến các khung con.

Mỗi đối tượng có cùng cấu trúc với đối tượng cha, cho phép bất kỳ số cấp `<iframe>` được nhúng nào cũng có thể được đại diện bên trong đối tượng đệ quy.

## Giá trị

Một mảng các đối tượng {{domxref("NotRestoredReasons")}}.

Nếu khung không có con, mảng sẽ rỗng; nếu tài liệu ở trong `<iframe>` cross-origin, `children` sẽ trả về `null`.

## Ví dụ

Xem [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
- {{domxref("PerformanceNavigationTiming.notRestoredReasons")}}
