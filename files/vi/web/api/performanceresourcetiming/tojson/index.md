---
title: "PerformanceResourceTiming: toJSON() method"
short-title: toJSON()
slug: Web/API/PerformanceResourceTiming/toJSON
page-type: web-api-instance-method
browser-compat: api.PerformanceResourceTiming.toJSON
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`toJSON()`** của giao diện {{domxref("PerformanceResourceTiming")}} là một {{Glossary("Serialization","serializer")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("PerformanceResourceTiming")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là kết quả tuần tự hóa của đối tượng {{domxref("PerformanceResourceTiming")}}.

## Ví dụ

### Dùng phương thức toJSON

Trong ví dụ này, gọi `entry.toJSON()` sẽ trả về biểu diễn JSON của đối tượng `PerformanceResourceTiming`.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry.toJSON());
  });
});

observer.observe({ type: "resource", buffered: true });
```

Điều này sẽ ghi ra một đối tượng JSON như sau:

```json
{
  "name": "https://upload.wikimedia.org/wikipedia/en/thumb/4/4a/Commons-logo.svg/31px-Commons-logo.svg.png",
  "entryType": "resource",
  "startTime": 110.80000001192093,
  "duration": 11.599999994039536,
  "initiatorType": "img",
  "nextHopProtocol": "h2",
  "renderBlockingStatus": "non-blocking",
  "workerStart": 0,
  "redirectStart": 0,
  "redirectEnd": 0,
  "fetchStart": 110.80000001192093,
  "domainLookupStart": 110.80000001192093,
  "domainLookupEnd": 110.80000001192093,
  "connectStart": 110.80000001192093,
  "connectEnd": 110.80000001192093,
  "secureConnectionStart": 110.80000001192093,
  "requestStart": 117.30000001192093,
  "responseStart": 120.40000000596046,
  "responseStatus": 200,
  "responseEnd": 122.40000000596046,
  "transferSize": 0,
  "encodedBodySize": 880,
  "decodedBodySize": 880,
  "serverTiming": [
    {
      "name": "cache",
      "duration": 0,
      "description": "hit-front"
    },
    {
      "name": "host",
      "duration": 0,
      "description": "cp3061"
    }
  ]
}
```

Để lấy một chuỗi JSON, bạn có thể dùng trực tiếp [`JSON.stringify(entry)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify); nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
