---
title: "Accelerometer: thuộc tính z"
short-title: z
slug: Web/API/Accelerometer/z
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Accelerometer.z
---

{{securecontext_header}}{{APIRef("Sensor API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`z`** của giao diện {{domxref("Accelerometer")}} trả về một số mô tả gia tốc của thiết bị theo trục z của nó.

## Giá trị

Một {{jsxref('Number')}}.

## Ví dụ

Gia tốc thường được đọc trong bộ gọi lại sự kiện {{domxref('Sensor.reading_event', 'reading')}}. Trong ví dụ dưới đây, việc này xảy ra sáu mươi lần mỗi giây.

```js
const accelerometer = new Accelerometer({ frequency: 60 });

accelerometer.addEventListener("reading", (e) => {
  console.log(`Gia tốc theo trục X ${accelerometer.x}`);
  console.log(`Gia tốc theo trục Y ${accelerometer.y}`);
  console.log(`Gia tốc theo trục Z ${accelerometer.z}`);
});
accelerometer.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
