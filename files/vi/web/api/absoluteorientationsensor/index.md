---
title: AbsoluteOrientationSensor
slug: Web/API/AbsoluteOrientationSensor
page-type: web-api-interface
browser-compat: api.AbsoluteOrientationSensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Giao diện **`AbsoluteOrientationSensor`** của [Sensor APIs](/en-US/docs/Web/API/Sensor_APIs) mô tả hướng vật lý của thiết bị so với hệ tọa độ tham chiếu của Trái Đất.

Để dùng cảm biến này, người dùng phải cấp quyền cho các cảm biến thiết bị `'accelerometer'`, `'gyroscope'` và `'magnetometer'` thông qua [Permissions API](/en-US/docs/Web/API/Permissions_API).

Tính năng này có thể bị chặn bởi một [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn.

{{InheritanceDiagram}}

## Bộ khởi tạo

- {{domxref("AbsoluteOrientationSensor.AbsoluteOrientationSensor", "AbsoluteOrientationSensor()")}}
  - : Tạo một đối tượng `AbsoluteOrientationSensor` mới.

## Thuộc tính thể hiện

_Không có thuộc tính cụ thể nào; kế thừa các thuộc tính từ các lớp cha {{domxref('OrientationSensor')}} và {{domxref('Sensor')}}._

## Phương thức thể hiện

_Không có phương thức cụ thể nào; kế thừa các phương thức từ các lớp cha {{domxref('OrientationSensor')}} và {{domxref('Sensor')}}._

## Sự kiện

_Không có sự kiện cụ thể nào; kế thừa các phương thức từ lớp cha {{domxref('Sensor')}}._

## Ví dụ

### Ví dụ cơ bản

Ví dụ sau, được xây dựng khá gần với [Orientation Phone demo của Intel](https://intel.github.io/generic-sensor-demos/orientation-phone/), khởi tạo một `AbsoluteOrientationSensor` với tần suất 60 lần mỗi giây. Ở mỗi lần đọc, ví dụ dùng {{domxref('OrientationSensor.quaternion')}} để xoay một mô hình điện thoại trực quan.

```js
const options = { frequency: 60, referenceFrame: "device" };
const sensor = new AbsoluteOrientationSensor(options);

sensor.addEventListener("reading", () => {
  // model is a Three.js object instantiated elsewhere.
  model.quaternion.fromArray(sensor.quaternion).inverse();
});
sensor.addEventListener("error", (event) => {
  if (event.error.name === "NotReadableError") {
    console.log("Sensor is not available.");
  }
});
sensor.start();
```

### Ví dụ về quyền truy cập

Sử dụng cảm biến định hướng đòi hỏi yêu cầu quyền cho nhiều cảm biến thiết bị. Vì giao diện {{domxref('Permissions')}} sử dụng promise, một cách tốt để yêu cầu quyền là dùng {{jsxref('Promise.all')}}.

```js
const sensor = new AbsoluteOrientationSensor();
Promise.all([
  navigator.permissions.query({ name: "accelerometer" }),
  navigator.permissions.query({ name: "magnetometer" }),
  navigator.permissions.query({ name: "gyroscope" }),
]).then((results) => {
  if (results.every((result) => result.state === "granted")) {
    sensor.start();
    // …
  } else {
    console.log("No permissions to use AbsoluteOrientationSensor.");
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
