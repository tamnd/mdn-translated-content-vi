---
title: Phát hiện định hướng thiết bị
slug: Web/API/Device_orientation_events/Detecting_device_orientation
page-type: guide
---

{{DefaultAPISidebar("Device Orientation Events")}}

Ngày càng nhiều thiết bị có thể phát hiện định hướng của chính chúng. Hướng dẫn này giải thích cách sử dụng thông tin đó và cho phép trình duyệt điều chỉnh để phản hồi định hướng đó.

## Xử lý sự kiện định hướng

Để nhận thông tin định hướng, đăng ký sự kiện {{domxref("Window/deviceorientation_event", "deviceorientation")}}:

```js
window.addEventListener("deviceorientation", handleOrientation);
```

Sau khi đăng ký trình xử lý sự kiện, nó sẽ được gọi định kỳ với dữ liệu định hướng mới nhất.

### Thuộc tính sự kiện DeviceOrientationEvent

- {{domxref("DeviceOrientationEvent.alpha")}}
  - : Góc xoay của thiết bị quanh trục z (0 đến 360 độ).
- {{domxref("DeviceOrientationEvent.beta")}}
  - : Góc xoay của thiết bị quanh trục x (-180 đến 180 độ).
- {{domxref("DeviceOrientationEvent.gamma")}}
  - : Góc xoay của thiết bị quanh trục y (-90 đến 90 độ).
- {{domxref("DeviceOrientationEvent.absolute")}}
  - : Giá trị boolean cho biết liệu dữ liệu định hướng thiết bị là tuyệt đối hay không.

### Ví dụ sử dụng

```js
window.addEventListener("deviceorientation", (event) => {
  // alpha: độ xoay quanh trục z
  const compass = Math.round(event.alpha);
  // beta: độ nghiêng trước/sau
  const tilt = Math.round(event.beta);
  // gamma: độ nghiêng trái/phải
  const lean = Math.round(event.gamma);

  document.getElementById("compass").textContent = `Compass: ${compass}°`;
  document.getElementById("tilt").textContent = `Tilt: ${tilt}°`;
  document.getElementById("lean").textContent = `Lean: ${lean}°`;
});
```

## Hệ thống tọa độ

Định hướng thiết bị được mô tả bằng ba giá trị xoay:

- **alpha (z)**: Xoay quanh trục z. Đây là hướng la bàn của thiết bị. 0° là Bắc, 90° là Đông, 180° là Nam, 270° là Tây.
- **beta (x)**: Xoay quanh trục x. Thiết bị đặt phẳng là 0°. Ngả về phía trước là giá trị dương, ngả về phía sau là giá trị âm (phạm vi: -180° đến 180°).
- **gamma (y)**: Xoay quanh trục y. Thiết bị đặt phẳng là 0°. Nghiêng sang phải là giá trị dương (phạm vi: -90° đến 90°).

## Phát hiện chuyển động

Sự kiện {{domxref("Window/devicemotion_event", "devicemotion")}} cung cấp dữ liệu về gia tốc của thiết bị.

```js
window.addEventListener("devicemotion", (event) => {
  const acc = event.acceleration;
  const accWithGravity = event.accelerationIncludingGravity;
  const rotation = event.rotationRate;

  if (acc) {
    console.log(`Acceleration: x=${acc.x}, y=${acc.y}, z=${acc.z}`);
  }
  if (accWithGravity) {
    console.log(
      `With gravity: x=${accWithGravity.x}, y=${accWithGravity.y}, z=${accWithGravity.z}`,
    );
  }
  if (rotation) {
    console.log(
      `Rotation: alpha=${rotation.alpha}, beta=${rotation.beta}, gamma=${rotation.gamma}`,
    );
  }
});
```

## Xem thêm

- {{domxref("DeviceOrientationEvent")}}
- {{domxref("DeviceMotionEvent")}}
- [Device orientation events](/en-US/docs/Web/API/Device_orientation_events)
