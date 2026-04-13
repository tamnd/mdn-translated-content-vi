---
title: "AmbientLightSensor: thuộc tính illuminance"
short-title: illuminance
slug: Web/API/AmbientLightSensor/illuminance
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.AmbientLightSensor.illuminance
---

{{securecontext_header}}{{APIRef("Sensor API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`illuminance`** của giao diện {{domxref("AmbientLightSensor")}} trả về mức sáng hiện tại tính bằng [lux](https://en.wikipedia.org/wiki/Lux) của ánh sáng xung quanh thiết bị đang lưu trữ.

## Giá trị

Một {{jsxref('Number')}} cho biết mức sáng hiện tại tính bằng lux.

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
