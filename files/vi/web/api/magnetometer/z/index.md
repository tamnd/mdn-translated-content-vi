---
title: "Magnetometer: z property"
short-title: z
slug: Web/API/Magnetometer/z
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Magnetometer.z
---

{{securecontext_header}}{{APIRef("Sensor API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`z`** của giao diện {{domxref("Magnetometer")}} trả về một số xác định từ trường xung quanh trục z của thiết bị.

## Giá trị

Một {{jsxref('Number')}}.

## Ví dụ

Magnetometer thường được đọc trong bộ gọi lại sự kiện {{domxref('Sensor.reading_event', 'reading')}}.
Trong ví dụ dưới đây, điều này xảy ra sáu mươi lần mỗi giây.

```js
let magSensor = new Magnetometer({ frequency: 60 });

magSensor.addEventListener("reading", (e) => {
  console.log(`Magnetic field along the X-axis ${magSensor.x}`);
  console.log(`Magnetic field along the Y-axis ${magSensor.y}`);
  console.log(`Magnetic field along the Z-axis ${magSensor.z}`);
});
magSensor.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
