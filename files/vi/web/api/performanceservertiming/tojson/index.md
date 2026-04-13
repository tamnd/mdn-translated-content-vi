---
title: "PerformanceServerTiming: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/PerformanceServerTiming/toJSON
page-type: web-api-instance-method
browser-compat: api.PerformanceServerTiming.toJSON
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`toJSON()`** của giao diện {{domxref("PerformanceServerTiming")}} là một {{Glossary("Serialization","serializer")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("PerformanceServerTiming")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là sự tuần tự hóa của đối tượng {{domxref("PerformanceServerTiming")}}.

## Ví dụ

### Ghi lại các mục nhập thời gian máy chủ

Các số liệu thời gian máy chủ yêu cầu máy chủ gửi tiêu đề {{HTTPHeader("Server-Timing")}}. Ví dụ:

```http
Server-Timing: cache;desc="Cache Read";dur=23.2
```

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    entry.serverTiming.forEach((serverEntry) => {
      console.log(serverEntry.toJSON());
    });
  });
});

["navigation", "resource"].forEach((type) =>
  observer.observe({ type, buffered: true }),
);
```

Điều này sẽ ghi lại một đối tượng JSON như sau:

```json
{
  "name": "cache",
  "duration": 23.2,
  "description": "Cache Read"
}
```

Để lấy chuỗi JSON, bạn có thể sử dụng [`JSON.stringify(serverEntry)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) trực tiếp; nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
