---
title: LinearAccelerationSensor
slug: Web/API/LinearAccelerationSensor
page-type: web-api-interface
browser-compat: api.LinearAccelerationSensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Giao diện **`LinearAccelerationSensor`** của [Sensor APIs](/en-US/docs/Web/API/Sensor_APIs) cung cấp trong mỗi lần đọc gia tốc được áp dụng lên thiết bị theo cả ba trục, nhưng không bao gồm đóng góp của trọng lực.

Để sử dụng cảm biến này, người dùng phải cấp quyền truy cập cảm biến thiết bị `'accelerometer'` thông qua [Permissions API](/en-US/docs/Web/API/Permissions_API). Ngoài ra, tính năng này có thể bị chặn bởi một [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("LinearAccelerationSensor.LinearAccelerationSensor", "LinearAccelerationSensor()")}}
  - : Tạo một đối tượng `LinearAccelerationSensor` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ các tổ tiên của nó, {{domxref('Accelerometer')}}, {{domxref("Sensor")}} và {{domxref("EventTarget")}}._

## Phương thức phiên bản

_`LinearAccelerationSensor` không có phương thức riêng. Tuy nhiên, nó kế thừa các phương thức từ các giao diện cha, {{domxref("Sensor")}} và {{domxref("EventTarget")}}._

## Sự kiện

_`LinearAccelerationSensor` không có sự kiện riêng. Tuy nhiên, nó kế thừa các sự kiện từ giao diện cha, {{domxref('Sensor')}}._

## Ví dụ

Gia tốc tuyến tính thường được đọc trong callback sự kiện {{domxref('Sensor.reading_event', 'reading')}}. Trong ví dụ bên dưới, điều này xảy ra sáu mươi lần một giây.

```js
let laSensor = new LinearAccelerationSensor({ frequency: 60 });

laSensor.addEventListener("reading", (e) => {
  console.log(`Linear acceleration along the X-axis ${laSensor.x}`);
  console.log(`Linear acceleration along the Y-axis ${laSensor.y}`);
  console.log(`Linear acceleration along the Z-axis ${laSensor.z}`);
});
laSensor.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
