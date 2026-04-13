---
title: PressureRecord
slug: Web/API/PressureRecord
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PressureRecord
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Giao diện **`PressureRecord`** là một phần của [Compute Pressure API](/en-US/docs/Web/API/Compute_Pressure_API) và mô tả xu hướng áp lực của một nguồn tại một thời điểm chuyển tiếp cụ thể.

## Thuộc tính phiên bản

- {{domxref("PressureRecord.source")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi cho biết nguồn gốc mà từ đó bản ghi được gửi đến.
- {{domxref("PressureRecord.state")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi cho biết trạng thái áp lực được ghi lại.
- {{domxref("PressureRecord.time")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} cho biết dấu thời gian của bản ghi.

## Phương thức phiên bản

- {{domxref("PressureRecord.toJSON()")}} {{experimental_inline}}
  - : Trả về biểu diễn JSON của đối tượng `PressureRecord`.

## Ví dụ

### Sử dụng đối tượng `PressureRecord`

Trong ví dụ sau, chúng ta ghi lại các thuộc tính của đối tượng `PressureRecord` trong callback của pressure observer.

```js
function callback(records) {
  const lastRecord = records[records.length - 1];
  console.log(`Current pressure is ${lastRecord.state}`);
  console.log(`Current pressure observed at ${lastRecord.time}`);
  console.log(`Current pressure source: ${lastRecord.source}`);
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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
