---
title: GravitySensor
slug: Web/API/GravitySensor
page-type: web-api-interface
browser-compat: api.GravitySensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Giao diện **`GravitySensor`** của [Sensor APIs](/en-US/docs/Web/API/Sensor_APIs) cung cấp trong mỗi lần đọc trọng lực được áp dụng lên thiết bị theo cả ba trục.

Để sử dụng cảm biến này, người dùng phải cấp quyền cho cảm biến thiết bị `'accelerometer'` thông qua [Permissions API](/en-US/docs/Web/API/Permissions_API). Ngoài ra, tính năng này có thể bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("GravitySensor.GravitySensor", "GravitySensor()")}}
  - : Tạo đối tượng `GravitySensor` mới.

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ các tổ tiên, {{domxref('Accelerometer')}}, {{domxref('Sensor')}}, và {{domxref('EventTarget')}}._

## Phương thức phiên bản

_`GravitySensor` không có phương thức riêng. Tuy nhiên, nó kế thừa phương thức từ các giao diện cha, {{domxref("Sensor")}} và {{domxref("EventTarget")}}._

## Sự kiện

_`GravitySensor` không có sự kiện riêng. Tuy nhiên, nó kế thừa sự kiện từ giao diện cha, {{domxref('Sensor')}}._

## Ví dụ

Trọng lực thường được đọc trong callback sự kiện {{domxref('Sensor.reading_event', 'reading')}}. Trong ví dụ dưới đây, điều này xảy ra sáu mươi lần mỗi giây.

```js
let gravitySensor = new GravitySensor({ frequency: 60 });

gravitySensor.addEventListener("reading", (e) => {
  console.log(`Gravity along the X-axis ${gravitySensor.x}`);
  console.log(`Gravity along the Y-axis ${gravitySensor.y}`);
  console.log(`Gravity along the Z-axis ${gravitySensor.z}`);
});

gravitySensor.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
