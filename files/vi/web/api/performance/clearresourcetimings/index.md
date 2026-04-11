---
title: "Performance: clearResourceTimings() method"
short-title: clearResourceTimings()
slug: Web/API/Performance/clearResourceTimings
page-type: web-api-instance-method
browser-compat: api.Performance.clearResourceTimings
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`clearResourceTimings()`** xóa tất cả {{domxref("PerformanceResourceTiming")}} khỏi performance timeline của trình duyệt.

## Cú pháp

```js-nolint
clearResourceTimings()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa các mục resource timing

Ví dụ sau xóa mọi entry kiểu `"resource"` khỏi performance timeline.

```js
performance.clearResourceTimings();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceResourceTiming")}}
