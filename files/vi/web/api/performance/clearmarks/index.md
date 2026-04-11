---
title: "Performance: clearMarks() method"
short-title: clearMarks()
slug: Web/API/Performance/clearMarks
page-type: web-api-instance-method
browser-compat: api.Performance.clearMarks
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`clearMarks()`** xóa tất cả hoặc các đối tượng {{domxref("PerformanceMark")}} cụ thể khỏi performance timeline của trình duyệt.

## Cú pháp

```js-nolint
clearMarks()
clearMarks(name)
```

### Tham số

- `name` {{optional_inline}}
  - : Một chuỗi biểu thị {{domxref("PerformanceEntry.name", "name")}} của đối tượng {{domxref("PerformanceMark")}}. Nếu bỏ qua đối số này, tất cả các entry có {{domxref("PerformanceEntry.entryType","entryType")}} là `"mark"` sẽ bị xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa các marker

Để dọn sạch tất cả performance mark, hoặc chỉ các entry cụ thể, hãy dùng phương thức `clearMarks()` như sau:

```js
// Tạo một loạt mark
performance.mark("login-started");
performance.mark("login-started");
performance.mark("login-finished");
performance.mark("form-sent");
performance.mark("video-loaded");
performance.mark("video-loaded");

performance.getEntriesByType("mark").length; // 6

// Chỉ xóa các entry mark "login-started"
performance.clearMarks("login-started");
performance.getEntriesByType("mark").length; // 4

// Xóa tất cả entry mark
performance.clearMarks();
performance.getEntriesByType("mark").length; // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceMark")}}
