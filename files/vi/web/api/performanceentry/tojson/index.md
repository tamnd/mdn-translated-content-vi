---
title: "PerformanceEntry: toJSON() method"
short-title: toJSON()
slug: Web/API/PerformanceEntry/toJSON
page-type: web-api-instance-method
browser-compat: api.PerformanceEntry.toJSON
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`toJSON()`** là một {{Glossary("Serialization","serializer")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("PerformanceEntry")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là kết quả tuần tự hóa của đối tượng {{domxref("PerformanceEntry")}}.

## Ví dụ

### Sử dụng phương thức toJSON

Trong ví dụ này, gọi `entry.toJSON()` trả về biểu diễn JSON của đối tượng {{domxref("PerformanceMark")}}.

```js
performance.mark("debug-marker", {
  detail: "debugging-marker-123",
});

const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry.toJSON());
  });
});

observer.observe({ entryTypes: ["mark"] });
```

Kết quả sẽ ghi ra một đối tượng JSON như sau:

```json
{
  "name": "debug-marker",
  "entryType": "mark",
  "startTime": 158361,
  "duration": 0
}
```

Lưu ý rằng nó không chứa thuộc tính {{domxref("PerformanceMark.detail", "detail")}} của `PerformanceMark`.

Để lấy chuỗi JSON, bạn có thể dùng trực tiếp [`JSON.stringify(entry)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify); nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
