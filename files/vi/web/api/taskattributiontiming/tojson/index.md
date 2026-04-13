---
title: "TaskAttributionTiming: toJSON() method"
short-title: toJSON()
slug: Web/API/TaskAttributionTiming/toJSON
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.TaskAttributionTiming.toJSON
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Phương thức **`toJSON()`** của giao diện {{domxref("TaskAttributionTiming")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("TaskAttributionTiming")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là biểu diễn tuần tự hóa của đối tượng {{domxref("TaskAttributionTiming")}}.

## Ví dụ

### Sử dụng phương thức toJSON

Trong ví dụ này, việc gọi `entry.toJSON()` trả về biểu diễn JSON của đối tượng `TaskAttributionTiming`.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry.toJSON());
  });
});

observer.observe({ type: "taskattribution", buffered: true });
```

Đoạn này sẽ ghi một đối tượng JSON như sau:

```json
{
  "name": "unknown",
  "entryType": "taskattribution",
  "startTime": 0,
  "duration": 0,
  "containerType": "window",
  "containerSrc": "",
  "containerId": "",
  "containerName": ""
}
```

Để lấy chuỗi JSON, bạn có thể dùng [`JSON.stringify(entry)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) trực tiếp; nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
