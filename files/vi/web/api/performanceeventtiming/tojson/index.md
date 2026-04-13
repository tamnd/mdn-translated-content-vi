---
title: "PerformanceEventTiming: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/PerformanceEventTiming/toJSON
page-type: web-api-instance-method
browser-compat: api.PerformanceEventTiming.toJSON
---

{{APIRef("Performance API")}}

Phương thức **`toJSON()`** của giao diện {{domxref("PerformanceEventTiming")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("PerformanceEventTiming")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là kết quả tuần tự hóa của đối tượng {{domxref("PerformanceEventTiming")}}.

JSON không chứa thuộc tính {{domxref("PerformanceEventTiming.target", "target")}} vì nó có kiểu {{domxref("Node")}}, không cung cấp thao tác `toJSON()`.

## Ví dụ

### Sử dụng phương thức toJSON

Trong ví dụ này, gọi `entry.toJSON()` trả về biểu diễn JSON của đối tượng `PerformanceEventTiming`.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry.toJSON());
  });
});

observer.observe({ type: "event", buffered: true });
```

Điều này sẽ ghi lại một đối tượng JSON như sau:

```json
{
  "name": "dragover",
  "entryType": "event",
  "startTime": 67090751.599999905,
  "duration": 128,
  "processingStart": 67090751.70000005,
  "processingEnd": 67090751.900000095,
  "cancelable": true
}
```

Để nhận được một chuỗi JSON, bạn có thể sử dụng [`JSON.stringify(entry)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) trực tiếp; nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
