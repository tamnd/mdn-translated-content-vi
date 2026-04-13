---
title: Magnetometer
slug: Web/API/Magnetometer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Magnetometer
---

{{securecontext_header}}{{APIRef("Sensor API")}}{{SeeCompatTable}}

**`Magnetometer`** là một giao diện của [Sensor APIs](/en-US/docs/Web/API/Sensor_APIs) cung cấp thông tin về từ trường được phát hiện bởi cảm biến từ kế chính của thiết bị.

Để dùng cảm biến này, người dùng phải cấp quyền cho cảm biến thiết bị `'magnetometer'` thông qua [Permissions API](/en-US/docs/Web/API/Permissions_API). Ngoài ra, tính năng này có thể bị chặn bởi một [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn.

{{InheritanceDiagram}}

## Hàm tạo

- {{domxref("Magnetometer.Magnetometer", "Magnetometer()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `Magnetometer` mới.

## Thuộc tính thể hiện

- {{domxref('Magnetometer.x')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một số thực chứa từ trường xung quanh trục x của thiết bị.
- {{domxref('Magnetometer.y')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một số thực chứa từ trường xung quanh trục y của thiết bị.
- {{domxref('Magnetometer.z')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một số thực chứa từ trường xung quanh trục z của thiết bị.

## Phương thức thể hiện

_`Magnetometer` không có phương thức riêng. Tuy nhiên, nó kế thừa các phương thức từ các giao diện cha của nó, {{domxref("Sensor")}} và {{domxref("EventTarget")}}._

## Sự kiện

_`Magnetometer` không có sự kiện riêng. Tuy nhiên, nó kế thừa các sự kiện từ giao diện cha của nó, {{domxref('Sensor')}}._

## Ví dụ

Magnetometer thường được đọc trong bộ gọi lại sự kiện {{domxref('Sensor.reading_event', 'reading')}}. Trong ví dụ dưới đây, điều này xảy ra sáu mươi lần mỗi giây.

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
