---
title: "PerformancePaintTiming: toJSON() method"
short-title: toJSON()
slug: Web/API/PerformancePaintTiming/toJSON
page-type: web-api-instance-method
browser-compat: api.PerformancePaintTiming.toJSON
---

{{APIRef("Performance API")}}

Phương thức **`toJSON()`** của giao diện {{domxref("PerformancePaintTiming")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("PerformancePaintTiming")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là biểu diễn tuần tự hóa của đối tượng {{domxref("PerformancePaintTiming")}}.

## Ví dụ

### Sử dụng phương thức toJSON

Trong ví dụ này, gọi `entry.toJSON()` trả về biểu diễn JSON của đối tượng `PerformancePaintTiming`.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry.toJSON());
  });
});

observer.observe({ type: "paint", buffered: true });
```

Kết quả sẽ ghi log một đối tượng JSON như sau:

```json
{
  "name": "first-contentful-paint",
  "entryType": "paint",
  "startTime": 234.5,
  "duration": 0
}
```

Để lấy chuỗi JSON, bạn có thể sử dụng trực tiếp [`JSON.stringify(entry)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify); nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
