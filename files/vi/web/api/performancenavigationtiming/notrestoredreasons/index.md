---
title: "PerformanceNavigationTiming: notRestoredReasons property"
short-title: notRestoredReasons
slug: Web/API/PerformanceNavigationTiming/notRestoredReasons
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceNavigationTiming.notRestoredReasons
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`notRestoredReasons`** của giao diện {{domxref("PerformanceNavigationTiming")}} trả về một đối tượng {{domxref("NotRestoredReasons")}} cung cấp dữ liệu báo cáo về lý do tài liệu hiện tại bị chặn không cho dùng back/forward cache ({{Glossary("bfcache")}}) khi điều hướng.

## Giá trị

Khi đối tượng `PerformanceNavigationTiming` liên quan biểu thị một điều hướng trong lịch sử, `notRestoredReasons` trả về một đối tượng {{domxref("NotRestoredReasons")}}.

Khi đối tượng `PerformanceNavigationTiming` không biểu thị một điều hướng trong lịch sử, `notRestoredReasons` sẽ trả về `null`. Điều này hữu ích để xác định liệu bfcache có liên quan tới một điều hướng cụ thể hay không (khác với trường hợp `notRestoredReasons` không được hỗ trợ, khi đó nó sẽ trả về `undefined`).

> [!NOTE]
> `notRestoredReasons` có thể trả về `null` dù kiểu điều hướng được báo cáo là điều hướng back/forward. Những trường hợp này bao gồm việc nhân bản một điều hướng back/forward sang tab mới và khôi phục một tab điều hướng back/forward sau khi trình duyệt khởi động lại. Trong các trường hợp đó, một số trình duyệt sao chép kiểu điều hướng từ tab gốc, nhưng vì đây không thực sự là điều hướng back/forward nên `notRestoredReasons` trả về `null`.

## Ví dụ

[`PerformanceNavigationTiming`](/en-US/docs/Web/API/PerformanceNavigationTiming) có thể được lấy từ performance timeline bằng [`Performance.getEntriesByType()`](/en-US/docs/Web/API/Performance/getEntriesByType) hoặc [`PerformanceObserver`](/en-US/docs/Web/API/PerformanceObserver).

Ví dụ, bạn có thể gọi hàm sau để trả về mọi đối tượng `PerformanceNavigationTiming` hiện có trong performance timeline và ghi lại `notRestoredReasons` của chúng:

```js
function returnNRR() {
  const navEntries = performance.getEntriesByType("navigation");
  for (let i = 0; i < navEntries.length; i++) {
    console.log(`Navigation entry ${i}`);
    let navEntry = navEntries[i];
    console.log(navEntry.notRestoredReasons);
  }
}
```

Thuộc tính `PerformanceNavigationTiming.notRestoredReasons` trả về một đối tượng có cấu trúc sau, cung cấp lý do tài liệu hiện tại bị chặn không cho dùng bfcache. Trong ví dụ này frame cấp cao nhất không có bất kỳ `<iframe>` con nào:

```json
{
  "children": [],
  "id": null,
  "name": null,
  "reasons": [{ "reason": "unload-listener" }],
  "src": "",
  "url": "example.com"
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Monitoring bfcache blocking reasons](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
- {{domxref("PerformanceResourceTiming")}}
