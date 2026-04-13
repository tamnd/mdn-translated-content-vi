---
title: "PressureRecord: time property"
short-title: time
slug: Web/API/PressureRecord/time
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PressureRecord.time
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`time`** trả về {{domxref("DOMHighResTimeStamp","dấu thời gian", "", "no-code")}} được ghi lại cho một {{domxref("PressureRecord")}}. Nó tương ứng với thời điểm dữ liệu được lấy từ hệ thống so với [thời gian gốc của đối tượng toàn cục](/en-US/docs/Web/API/Performance/timeOrigin) trong đó {{domxref("PressureObserver")}} tạo thông báo.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} đại diện cho dấu thời gian khi {{domxref("PressureRecord")}} được tạo.

## Ví dụ

### Sử dụng thuộc tính `time`

Trong ví dụ sau, chúng ta ghi lại giá trị của thuộc tính `time` trong callback của pressure observer.

```js
function callback(records) {
  const lastRecord = records[records.length - 1];
  console.log(`Current pressure ${lastRecord.state}`);
  console.log(`Current pressure observed at ${lastRecord.time}`);
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
