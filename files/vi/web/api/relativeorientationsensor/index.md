---
title: RelativeOrientationSensor
slug: Web/API/RelativeOrientationSensor
page-type: web-api-interface
browser-compat: api.RelativeOrientationSensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Giao diện **`RelativeOrientationSensor`** của [Sensor APIs](/en-US/docs/Web/API/Sensor_APIs) mô tả hướng vật lý của thiết bị mà không cần tính đến hệ tọa độ tham chiếu của Trái Đất.

Để sử dụng cảm biến này, người dùng phải cấp quyền cho các cảm biến thiết bị `'accelerometer'` và `'gyroscope'` thông qua [Permissions API](/en-US/docs/Web/API/Permissions_API). Ngoài ra, tính năng này có thể bị chặn bởi [Chính sách Quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("RelativeOrientationSensor.RelativeOrientationSensor", "RelativeOrientationSensor()")}}
  - : Tạo một đối tượng `RelativeOrientationSensor` mới.

## Thuộc tính phiên bản

_Không có thuộc tính cụ thể; kế thừa các thuộc tính từ tổ tiên {{domxref('OrientationSensor')}} và {{domxref('Sensor')}}._

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ tổ tiên {{domxref('OrientationSensor')}} và {{domxref('Sensor')}}._

## Sự kiện

_Không có sự kiện cụ thể; kế thừa các sự kiện từ tổ tiên, {{domxref('Sensor')}}._

## Ví dụ

### Ví dụ cơ bản

Ví dụ sau, dựa trên [demo Orientation Phone của Intel](https://intel.github.io/generic-sensor-demos/orientation-phone/), khởi tạo một `RelativeOrientationSensor` với tần số 60 lần mỗi giây.

> [!NOTE]
> Demo Intel mà ví dụ này dựa trên sử dụng `AbsoluteOrientationSensor`. Trong mỗi lần đọc, nó dùng {{domxref('OrientationSensor.quaternion')}} để xoay một mô hình điện thoại trực quan.

```js
const options = { frequency: 60, referenceFrame: "device" };
const sensor = new RelativeOrientationSensor(options);

sensor.addEventListener("reading", () => {
  // model is a Three.js object instantiated elsewhere.
  model.quaternion.fromArray(sensor.quaternion).inverse();
});
sensor.addEventListener("error", (error) => {
  if (event.error.name === "NotReadableError") {
    console.log("Sensor is not available.");
  }
});
sensor.start();
```

### Ví dụ về Quyền

Sử dụng cảm biến hướng yêu cầu yêu cầu quyền cho nhiều cảm biến thiết bị. Vì giao diện {{domxref('Permissions')}} sử dụng promise, cách tốt để yêu cầu quyền là dùng {{jsxref('Promise.all')}}.

```js
const sensor = new RelativeOrientationSensor();
Promise.all([
  navigator.permissions.query({ name: "accelerometer" }),
  navigator.permissions.query({ name: "gyroscope" }),
]).then((results) => {
  if (results.every((result) => result.state === "granted")) {
    sensor.start();
    // …
  } else {
    console.log("No permissions to use RelativeOrientationSensor.");
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
