---
title: "PerformanceNavigation: toJSON() method"
short-title: toJSON()
slug: Web/API/PerformanceNavigation/toJSON
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.PerformanceNavigation.toJSON
---

{{APIRef("Performance API")}} {{deprecated_header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [Thông số kỹ thuật Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}} thay thế.

Phương thức **`toJSON()`** của giao diện {{domxref("PerformanceNavigation")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("PerformanceNavigation")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là biểu diễn tuần tự hóa của đối tượng {{domxref("PerformanceNavigation")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
