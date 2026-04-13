---
title: "PressureRecord: toJSON() method"
short-title: toJSON()
slug: Web/API/PressureRecord/toJSON
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PressureRecord.toJSON
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Phương thức **`toJSON()`** là {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("PressureRecord")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là bản tuần tự hóa của đối tượng {{domxref("PressureRecord")}}.

## Ví dụ

### Sử dụng phương thức `toJSON`

Trong ví dụ này, việc gọi `lastRecord.toJSON()` trả về biểu diễn JSON của đối tượng {{domxref("PressureRecord")}}.

```js
function callback(records) {
  const lastRecord = records[records.length - 1];
  console.log(lastRecord.toJSON);
}

try {
  const observer = new PressureObserver(callback);
  await observer.observe("cpu", {
    sampleInterval: 1000, // 1000ms
  });
} catch (error) {
  // report error setting up the observer
}
```

Đây sẽ ghi lại một đối tượng JSON như sau:

```json
{
  "source": "cpu",
  "state": "fair",
  "time": 1712052746385.347
}
```

Để lấy chuỗi JSON, bạn có thể sử dụng [`JSON.stringify(lastRecord)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) trực tiếp; nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
