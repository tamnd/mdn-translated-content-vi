---
title: OrientationSensor
slug: Web/API/OrientationSensor
page-type: web-api-interface
browser-compat: api.OrientationSensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Giao diện **`OrientationSensor`** của [Sensor APIs](/en-US/docs/Web/API/Sensor_APIs) là lớp cơ sở cho các cảm biến định hướng. Giao diện này không thể được sử dụng trực tiếp. Thay vào đó, nó cung cấp các thuộc tính và phương thức được truy cập bởi các giao diện kế thừa từ nó.

Tính năng này có thể bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn.

{{InheritanceDiagram}}

## Các giao diện dựa trên OrientationSensor

Dưới đây là danh sách các giao diện dựa trên giao diện OrientationSensor.

- {{domxref('AbsoluteOrientationSensor')}}
- {{domxref('RelativeOrientationSensor')}}

## Thuộc tính phiên bản

- {{domxref("OrientationSensor.quaternion")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref('Array')}} bốn phần tử mà các phần tử của nó chứa các thành phần của quaternion đơn vị đại diện cho hướng của thiết bị.

## Phương thức phiên bản

- {{domxref("OrientationSensor.populateMatrix()")}}
  - : Điền vào đối tượng đã cho ma trận quay dựa trên lần đọc cảm biến mới nhất.

## Ví dụ

### Ví dụ cơ bản

Ví dụ sau, dựa trên [demo Orientation Phone của Intel](https://intel.github.io/generic-sensor-demos/orientation-phone/), khởi tạo một `AbsoluteOrientationSensor` với tần số 60 lần mỗi giây. Trên mỗi lần đọc, nó sử dụng {{domxref('OrientationSensor.quaternion')}} để xoay một mô hình trực quan của điện thoại.

```js
const options = { frequency: 60, referenceFrame: "device" };
const sensor = new AbsoluteOrientationSensor(options);

sensor.addEventListener("reading", () => {
  // model là một đối tượng Three.js được khởi tạo ở nơi khác.
  model.quaternion.fromArray(sensor.quaternion).inverse();
});
sensor.addEventListener("error", (error) => {
  if (event.error.name === "NotReadableError") {
    console.log("Sensor is not available.");
  }
});
sensor.start();
```

### Ví dụ về quyền

Sử dụng cảm biến định hướng yêu cầu yêu cầu quyền cho nhiều cảm biến thiết bị. Vì giao diện {{domxref('Permissions')}} sử dụng promise, một cách tốt để yêu cầu quyền là sử dụng {{jsxref('Promise.all')}}.

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
