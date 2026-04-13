---
title: Dữ liệu định hướng và chuyển động được giải thích
slug: Web/API/Device_orientation_events/Orientation_and_motion_data_explained
page-type: guide
---

{{DefaultAPISidebar("Device Orientation Events")}}

Hướng dẫn này giải thích cách diễn giải dữ liệu định hướng và chuyển động từ API sự kiện định hướng thiết bị, đặc biệt là ý nghĩa của các trục và góc.

## Hệ thống tọa độ thiết bị

Khi sử dụng dữ liệu định hướng thiết bị, cần hiểu hệ thống tọa độ thiết bị:

- **Trục X**: Chạy từ trái sang phải dọc theo màn hình.
- **Trục Y**: Chạy từ dưới lên trên dọc theo màn hình.
- **Trục Z**: Vuông góc với màn hình, hướng ra phía trước.

## Góc Euler

Định hướng thiết bị được mô tả bằng ba góc Euler:

### Alpha (Yaw, xoay)

Góc **alpha** biểu thị độ xoay quanh trục z của thiết bị. Đây là định hướng la bàn của thiết bị. Giá trị là từ 0° đến 360°.

- 0° = Thiết bị hướng về Bắc
- 90° = Thiết bị hướng về Đông
- 180° = Thiết bị hướng về Nam
- 270° = Thiết bị hướng về Tây

### Beta (Pitch, ngả)

Góc **beta** biểu thị độ xoay quanh trục x của thiết bị. Phạm vi là từ -180° đến 180°.

- 0° = Thiết bị đặt phẳng, màn hình hướng lên trên
- 90° = Thiết bị đứng thẳng, đỉnh nghiêng về phía trước
- -90° = Thiết bị đứng thẳng, đỉnh nghiêng về phía sau

### Gamma (Roll, lăn)

Góc **gamma** biểu thị độ xoay quanh trục y của thiết bị. Phạm vi là từ -90° đến 90°.

- 0° = Thiết bị đặt thẳng
- 90° = Thiết bị nghiêng sang phải 90°
- -90° = Thiết bị nghiêng sang trái 90°

## Dữ liệu gia tốc

Sự kiện {{domxref("Window/devicemotion_event", "devicemotion")}} cung cấp hai loại dữ liệu gia tốc:

### acceleration

{{domxref("DeviceMotionEvent.acceleration")}} là gia tốc của thiết bị trên ba trục (x, y, z), **không tính** lực hấp dẫn. Giá trị tính bằng m/s².

### accelerationIncludingGravity

{{domxref("DeviceMotionEvent.accelerationIncludingGravity")}} là gia tốc của thiết bị trên ba trục (x, y, z), **có tính** lực hấp dẫn. Khi thiết bị đặt phẳng, bạn sẽ thấy gia tốc ~9.8 m/s² trên trục z.

### rotationRate

{{domxref("DeviceMotionEvent.rotationRate")}} là tốc độ quay của thiết bị quanh ba trục. Giá trị được tính bằng độ/giây.

## Ví dụ sử dụng

```js
window.addEventListener("devicemotion", (event) => {
  // Gia tốc không có trọng lực
  if (event.acceleration) {
    const { x, y, z } = event.acceleration;
    console.log(
      `Accel: x=${x?.toFixed(2)}, y=${y?.toFixed(2)}, z=${z?.toFixed(2)}`,
    );
  }

  // Gia tốc có trọng lực
  if (event.accelerationIncludingGravity) {
    const { x, y, z } = event.accelerationIncludingGravity;
    console.log(
      `AccelWithGravity: x=${x?.toFixed(2)}, y=${y?.toFixed(2)}, z=${z?.toFixed(2)}`,
    );
  }

  // Tốc độ quay
  if (event.rotationRate) {
    const { alpha, beta, gamma } = event.rotationRate;
    console.log(
      `Rotation: alpha=${alpha?.toFixed(2)}, beta=${beta?.toFixed(2)}, gamma=${gamma?.toFixed(2)}`,
    );
  }
});
```

## Xem thêm

- [Device orientation events](/en-US/docs/Web/API/Device_orientation_events)
- [Phát hiện định hướng thiết bị](/en-US/docs/Web/API/Device_orientation_events/Detecting_device_orientation)
