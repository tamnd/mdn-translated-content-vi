---
title: "PerformanceMeasure: thuộc tính detail"
short-title: detail
slug: Web/API/PerformanceMeasure/detail
page-type: web-api-instance-property
browser-compat: api.PerformanceMeasure.detail
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`detail`** trả về siêu dữ liệu tùy ý được bao gồm trong điểm đánh dấu khi khởi tạo (khi sử dụng {{domxref("Performance.measure","performance.measure()")}}).

## Giá trị

Trả về giá trị đã được đặt (từ `markOptions` của {{domxref("Performance.measure","performance.measure()")}}).

## Ví dụ

Ví dụ sau minh họa thuộc tính `detail`.

```js
performance.measure("dog", { detail: "labrador", start: 0, end: 12345 });

const dogEntries = performance.getEntriesByName("dog");

dogEntries[0].detail; // labrador
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
