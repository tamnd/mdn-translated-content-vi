---
title: "PerformanceMark: thuộc tính detail"
short-title: detail
slug: Web/API/PerformanceMark/detail
page-type: web-api-instance-property
browser-compat: api.PerformanceMark.detail
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`detail`** trả về siêu dữ liệu tùy ý được bao gồm trong mark khi xây dựng (sử dụng {{domxref("Performance.mark","performance.mark()")}} hoặc hàm khởi tạo {{domxref("PerformanceMark.PerformanceMark","PerformanceMark()")}}).

## Giá trị

Trả về giá trị nó được đặt thành (từ `markOptions` của {{domxref("Performance.mark","performance.mark()")}} hoặc hàm khởi tạo {{domxref("PerformanceMark.PerformanceMark","PerformanceMark()")}}).

## Ví dụ

Ví dụ sau minh họa thuộc tính `detail`.

```js
performance.mark("dog", { detail: "labrador" });

const dogEntries = performance.getEntriesByName("dog");

dogEntries[0].detail; // labrador
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
