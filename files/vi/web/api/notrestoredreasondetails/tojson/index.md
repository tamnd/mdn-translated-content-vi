---
title: "NotRestoredReasonDetails: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/NotRestoredReasonDetails/toJSON
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.NotRestoredReasonDetails.toJSON
spec-urls: https://html.spec.whatwg.org/multipage/nav-history-apis.html#notrestoredreasondetails
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Phương thức **`toJSON()`** của giao diện {{domxref("NotRestoredReasonDetails")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("NotRestoredReasonDetails")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là bản tuần tự hóa của đối tượng {{domxref("NotRestoredReasonDetails")}}.

## Ví dụ

Hàm sau đây sẽ trả về biểu diễn JSON của đối tượng `NotRestoredReasonDetails` đầu tiên của đối tượng `NotRestoredReasons` từ đối tượng `PerformanceNavigationTiming` đầu tiên hiện có trong timeline hiệu suất:

```js
function returnNRR() {
  const navEntries = performance.getEntriesByType("navigation");
  let navEntry = navEntries[0];
  return navEntry.notRestoredReasons.reasons[0].toJSON();
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
- [Giám sát lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
- {{domxref("PerformanceNavigationTiming.notRestoredReasons")}}
