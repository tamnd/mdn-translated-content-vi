---
title: "NotRestoredReasons: toJSON() method"
short-title: toJSON()
slug: Web/API/NotRestoredReasons/toJSON
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.NotRestoredReasons.toJSON
spec-urls: https://html.spec.whatwg.org/multipage/nav-history-apis.html#notrestoredreasons
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Phương thức **`toJSON()`** của giao diện {{domxref("NotRestoredReasons")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("NotRestoredReasons")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là tuần tự hóa của đối tượng {{domxref("NotRestoredReasons")}}.

## Ví dụ

Hàm sau sẽ trả về biểu diễn JSON của đối tượng `NotRestoredReasons` của `PerformanceNavigationTiming` đầu tiên hiện có trong dòng thời gian hiệu suất:

```js
function returnNRR() {
  const navEntries = performance.getEntriesByType("navigation");
  let navEntry = navEntries[0];
  return navEntry.notRestoredReasons.toJSON();
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
- [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
- {{domxref("PerformanceNavigationTiming.notRestoredReasons")}}
