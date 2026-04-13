---
title: "PerformanceLongTaskTiming: thuộc tính attribution"
short-title: attribution
slug: Web/API/PerformanceLongTaskTiming/attribution
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceLongTaskTiming.attribution
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`attribution`** của giao diện {{domxref("PerformanceLongTaskTiming")}} trả về một mảng các đối tượng {{domxref('TaskAttributionTiming')}}.

## Giá trị

Một {{jsxref("Array")}} các đối tượng {{domxref('TaskAttributionTiming')}}.

## Ví dụ

### Ghi nhật ký các attribution cho tác vụ dài

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    entry.attribution.forEach((attributionEntry) => {
      console.log(attributionEntry);
    });
  });
});

observer.observe({ type: "longtask", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('TaskAttributionTiming')}}
