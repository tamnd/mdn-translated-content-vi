---
title: AmbientLightSensor
slug: Web/API/AmbientLightSensor
page-type: web-api-interface
status:
  - experimental
browser-compat: api.AmbientLightSensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}{{SeeCompatTable}}

Giao diện **`AmbientLightSensor`** của [Sensor APIs](/en-US/docs/Web/API/Sensor_APIs) trả về mức sáng hiện tại, hay độ rọi, của ánh sáng xung quanh thiết bị đang lưu trữ.

Để dùng cảm biến này, người dùng phải cấp quyền cho cảm biến thiết bị `'ambient-light-sensor'` thông qua [Permissions API](/en-US/docs/Web/API/Permissions_API).

Tính năng này có thể bị chặn bởi một [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn.

{{InheritanceDiagram}}

## Bộ khởi tạo

- {{domxref("AmbientLightSensor.AmbientLightSensor()", "AmbientLightSensor()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `AmbientLightSensor` mới.

## Thuộc tính thể hiện

- {{domxref('AmbientLightSensor.illuminance')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về mức sáng hiện tại tính bằng [lux](https://en.wikipedia.org/wiki/Lux) của ánh sáng xung quanh thiết bị đang lưu trữ.

## Phương thức thể hiện

_`AmbientLightSensor` không có phương thức riêng. Tuy nhiên, nó kế thừa các phương thức từ các giao diện cha là {{domxref("Sensor")}} và {{domxref("EventTarget")}}._

## Sự kiện

_`AmbientLightSensor` không có sự kiện riêng. Tuy nhiên, nó kế thừa các sự kiện từ giao diện cha là {{domxref('Sensor')}}._

## Ví dụ

```js
if ("AmbientLightSensor" in window) {
  const sensor = new AmbientLightSensor();
  sensor.addEventListener("reading", (event) => {
    console.log("Current light level:", sensor.illuminance);
  });
  sensor.addEventListener("error", (event) => {
    console.log(event.error.name, event.error.message);
  });
  sensor.start();
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
