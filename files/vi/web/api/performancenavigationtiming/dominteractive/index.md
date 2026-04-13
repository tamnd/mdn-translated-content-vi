---
title: "PerformanceNavigationTiming: domInteractive property"
short-title: domInteractive
slug: Web/API/PerformanceNavigationTiming/domInteractive
page-type: web-api-instance-property
browser-compat: api.PerformanceNavigationTiming.domInteractive
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`domInteractive`** trả về một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi tác nhân người dùng đặt [`readyState`](/en-US/docs/Web/API/Document/readyState) của tài liệu thành `"interactive"`.

> [!NOTE]
> Thuộc tính này **không phải** {{Glossary("Time to interactive")}} (TTI). Thuộc tính này nói về thời điểm hoàn tất việc xây dựng DOM và JavaScript có thể tương tác với nó. Xem thêm trạng thái `interactive` của {{domxref("Document.readyState")}}, trạng thái này tương ứng với thuộc tính này.

Đo thời gian xử lý DOM có thể không đáng kể trừ khi trang của bạn có nguồn HTML rất lớn để dựng thành Document Object Model.

Nếu không có JavaScript chặn bộ phân tích thì sự kiện [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event) (xem [`domContentLoadedEventStart`](/en-US/docs/Web/API/PerformanceNavigationTiming/domContentLoadedEventStart) để lấy dấu thời gian) sẽ kích hoạt ngay sau `domInteractive`.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi tác nhân người dùng đặt [`readyState`](/en-US/docs/Web/API/Document/readyState) của tài liệu thành `"interactive"`.

## Ví dụ

### Ghi lại thời điểm tương tác với DOM

Thuộc tính `domInteractive` có thể được dùng để ghi lại thời điểm DOM xây dựng xong và có thể tương tác.

Ví dụ dùng {{domxref("PerformanceObserver")}}...

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(
      `${entry.name}: domInteractive time: ${entry.domInteractive}ms`,
    );
  });
});

observer.observe({ type: "navigation", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}:

```js
const entries = performance.getEntriesByType("navigation");
entries.forEach((entry) => {
  console.log(`${entry.name}: domInteractive time: ${entry.domInteractive}ms`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.readyState")}}
