---
title: "Performance: toJSON() method"
short-title: toJSON()
slug: Web/API/Performance/toJSON
page-type: web-api-instance-method
browser-compat: api.Performance.toJSON
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`toJSON()`** của giao diện {{domxref("Performance")}} là một {{Glossary("Serialization","serializer")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("Performance")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là kết quả tuần tự hóa của đối tượng {{domxref("Performance")}}.

JSON được trả về không chứa thuộc tính {{domxref("Performance.eventCounts", "eventCounts")}} vì nó có kiểu {{domxref("EventCounts")}}, và kiểu này không cung cấp thao tác `toJSON()`.

> [!NOTE]
> Đối tượng JSON chứa kết quả tuần tự hóa của các thuộc tính đã lỗi thời {{domxref("performance.timing")}} và {{domxref("performance.navigation")}}. Để lấy biểu diễn JSON của giao diện mới hơn {{domxref("PerformanceNavigationTiming")}}, hãy gọi {{domxref("PerformanceNavigationTiming.toJSON()")}} thay thế.

## Ví dụ

### Dùng phương thức toJSON

Trong ví dụ này, gọi `performance.toJSON()` sẽ trả về biểu diễn JSON của đối tượng `Performance`.

```js
performance.toJSON();
```

Điều này sẽ ghi ra một đối tượng JSON như sau:

```json
{
  "timeOrigin": 1668077531367.4,
  "timing": {
    "connectStart": 1668077531372,
    "navigationStart": 1668077531367,
    "secureConnectionStart": 0,
    "fetchStart": 1668077531372,
    "domContentLoadedEventStart": 1668077531580,
    "responseStart": 1668077531372,
    "domInteractive": 1668077531524,
    "domainLookupEnd": 1668077531372,
    "responseEnd": 1668077531500,
    "redirectStart": 0,
    "requestStart": 1668077531372,
    "unloadEventEnd": 0,
    "unloadEventStart": 0,
    "domLoading": 1668077531512,
    "domComplete": 1668077531585,
    "domainLookupStart": 1668077531372,
    "loadEventStart": 1668077531585,
    "domContentLoadedEventEnd": 1668077531580,
    "loadEventEnd": 1668077531585,
    "redirectEnd": 0,
    "connectEnd": 1668077531372
  },
  "navigation": {
    "type": 0,
    "redirectCount": 0
  }
}
```

Để lấy một chuỗi JSON, bạn có thể dùng trực tiếp [`JSON.stringify(performance)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify); nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
