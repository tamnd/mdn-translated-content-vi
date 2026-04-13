---
title: "PerformanceLongTaskTiming: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/PerformanceLongTaskTiming/toJSON
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PerformanceLongTaskTiming.toJSON
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Phương thức **`toJSON()`** của giao diện {{domxref("PerformanceLongTaskTiming")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về một biểu diễn JSON của đối tượng {{domxref("PerformanceLongTaskTiming")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là bộ tuần tự hóa của đối tượng {{domxref("PerformanceLongTaskTiming")}}.

## Ví dụ

### Sử dụng phương thức toJSON

Trong ví dụ này, gọi `entry.toJSON()` trả về biểu diễn JSON của đối tượng `PerformanceLongTaskTiming`.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry.toJSON());
  });
});

observer.observe({ type: "longtask", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
