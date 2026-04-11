---
title: "PerformanceTiming: toJSON() method"
short-title: toJSON()
slug: Web/API/PerformanceTiming/toJSON
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.PerformanceTiming.toJSON
---

{{APIRef("Performance API")}}{{deprecated_header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Phương thức cũ **`toJSON()`** của giao diện {{domxref("PerformanceTiming")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("PerformanceTiming")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là bản tuần tự hóa của đối tượng {{domxref("PerformanceTiming")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
