---
title: NotRestoredReasonDetails
slug: Web/API/NotRestoredReasonDetails
page-type: web-api-interface
status:
  - experimental
browser-compat: api.NotRestoredReasonDetails
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Giao diện **`NotRestoredReasonDetails`** của {{domxref("Performance API", "Performance API", "", "nocode")}} đại diện cho một lý do duy nhất tại sao một trang được điều hướng đến bị chặn khỏi việc sử dụng bộ nhớ đệm tiến/lùi ({{Glossary("bfcache")}}).

Một mảng các đối tượng `NotRestoredReasonDetails` có thể được truy cập thông qua thuộc tính {{domxref("NotRestoredReasons.reasons")}}.

## Thuộc tính phiên bản

- {{domxref("NotRestoredReasonDetails.reason", "reason")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi mô tả lý do tại sao trang bị chặn khỏi việc sử dụng bộ nhớ đệm tiến/lùi.

## Phương thức phiên bản

- {{domxref("NotRestoredReasonDetails.toJSON", "toJSON()")}} {{Experimental_Inline}}
  - : Một {{Glossary("Serialization","bộ tuần tự hóa")}}; trả về biểu diễn JSON của đối tượng `NotRestoredReasonDetails`.

## Ví dụ

Xem [Giám sát lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) để biết các ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Giám sát lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
- {{domxref("PerformanceNavigationTiming.notRestoredReasons")}}
