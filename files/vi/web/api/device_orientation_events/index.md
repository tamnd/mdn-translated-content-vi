---
title: Device orientation events
slug: Web/API/Device_orientation_events
page-type: web-api-overview
spec-urls: https://w3c.github.io/deviceorientation/
---

{{DefaultAPISidebar("Device Orientation Events")}}

**Device orientation events** là các sự kiện cho phép bạn phát hiện sự định hướng vật lý của thiết bị và chuyển động của nó.

## Khái niệm và cách sử dụng

Thiết bị di động thường có các cảm biến như con quay hồi chuyển (gyroscope), la bàn (compass) và gia tốc kế (accelerometer) có thể cung cấp thông tin về định hướng vật lý và chuyển động của thiết bị.

Các sự kiện định hướng thiết bị cho phép bạn viết các ứng dụng web có thể thay đổi hành vi dựa trên định hướng của thiết bị và phản ứng với chuyển động của người dùng.

## Sự kiện

- {{domxref("Window.deviceorientation_event", "deviceorientation")}}
  - : Kích hoạt khi dữ liệu định hướng mới có sẵn từ cảm biến đo định hướng của thiết bị.
- {{domxref("Window.deviceorientationabsolute_event", "deviceorientationabsolute")}}
  - : Kích hoạt khi dữ liệu định hướng tuyệt đối mới có sẵn từ cảm biến đo định hướng của thiết bị.
- {{domxref("Window.devicemotion_event", "devicemotion")}}
  - : Kích hoạt với tốc độ đều đặn, cho biết lượng lực vật lý gia tốc mà thiết bị đang nhận, và tốc độ quay nếu có.

## Xử lý sự kiện định hướng thiết bị

Để nhận dữ liệu định hướng, hãy lắng nghe sự kiện `deviceorientation`:

```js
window.addEventListener("deviceorientation", handleOrientation);

function handleOrientation(event) {
  const absolute = event.absolute;
  const alpha = event.alpha; // Xoay quanh trục z (0-360)
  const beta = event.beta; // Xoay quanh trục x (-180 đến 180)
  const gamma = event.gamma; // Xoay quanh trục y (-90 đến 90)

  // Xử lý dữ liệu định hướng
}
```

## Xử lý sự kiện chuyển động thiết bị

Sự kiện `devicemotion` cung cấp dữ liệu gia tốc:

```js
window.addEventListener("devicemotion", handleMotion);

function handleMotion(event) {
  const acceleration = event.acceleration;
  const accelerationWithGravity = event.accelerationIncludingGravity;
  const rotationRate = event.rotationRate;
  const interval = event.interval;

  // Xử lý dữ liệu chuyển động
}
```

## Yêu cầu quyền truy cập (iOS)

Trên thiết bị iOS 13+, bạn cần yêu cầu quyền truy cập trước khi sử dụng sự kiện định hướng thiết bị:

```js
function requestPermission() {
  if (
    typeof DeviceOrientationEvent !== "undefined" &&
    typeof DeviceOrientationEvent.requestPermission === "function"
  ) {
    DeviceOrientationEvent.requestPermission()
      .then((permissionState) => {
        if (permissionState === "granted") {
          window.addEventListener("deviceorientation", handleOrientation);
        }
      })
      .catch(console.error);
  } else {
    // Không cần quyền trên Android
    window.addEventListener("deviceorientation", handleOrientation);
  }
}

// Gọi yêu cầu quyền truy cập sau sự kiện người dùng
document
  .getElementById("request-permission")
  .addEventListener("click", requestPermission);
```

## Hướng dẫn

- [Phát hiện định hướng thiết bị](/en-US/docs/Web/API/Device_orientation_events/Detecting_device_orientation)
- [Dữ liệu định hướng và chuyển động được giải thích](/en-US/docs/Web/API/Device_orientation_events/Orientation_and_motion_data_explained)
- [Sử dụng định hướng thiết bị với biến đổi 3D](/en-US/docs/Web/API/Device_orientation_events/Using_device_orientation_with_3D_transforms)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
