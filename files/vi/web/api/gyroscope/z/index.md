---
title: "Gyroscope: z property"
short-title: z
slug: Web/API/Gyroscope/z
page-type: web-api-instance-property
browser-compat: api.Gyroscope.z
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Thuộc tính chỉ đọc **`z`** của giao diện {{domxref("Gyroscope")}} trả về một số xác định vận tốc góc của thiết bị dọc theo trục z của nó.

## Giá trị

Một {{jsxref('Number')}}.

## Ví dụ

Gyroscope thường được đọc trong bộ gọi lại sự kiện {{domxref('Sensor.reading_event', 'reading')}}.
Trong ví dụ dưới đây, điều này xảy ra sáu mươi lần mỗi giây.

```js
let gyroscope = new Gyroscope({ frequency: 60 });

gyroscope.addEventListener("reading", (e) => {
  console.log(`Angular velocity along the X-axis ${gyroscope.x}`);
  console.log(`Angular velocity along the Y-axis ${gyroscope.y}`);
  console.log(`Angular velocity along the Z-axis ${gyroscope.z}`);
});
gyroscope.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
