---
title: DeviceMotionEvent
slug: Web/API/DeviceMotionEvent
page-type: web-api-interface
browser-compat: api.DeviceMotionEvent
---

{{APIRef("Device Orientation Events")}}{{securecontext_header}}

Giao diện **`DeviceMotionEvent`** của {{domxref("Device Orientation Events", "", "", "nocode")}} cung cấp cho các nhà phát triển web thông tin về tốc độ thay đổi vị trí và hướng của thiết bị.

> [!WARNING]
> Hiện tại, Firefox và Chrome không xử lý tọa độ theo cùng một cách. Hãy chú ý điều này khi sử dụng chúng.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("DeviceMotionEvent.DeviceMotionEvent", "DeviceMotionEvent()")}}
  - : Tạo một đối tượng `DeviceMotionEvent` mới.

## Phương thức tĩnh

- {{DOMxRef("DeviceMotionEvent.requestPermission_static", "DeviceMotionEvent.requestPermission()")}} {{experimental_inline}}
  - : Yêu cầu quyền của người dùng để truy cập dữ liệu chuyển động thiết bị từ cảm biến gia tốc kế và con quay hồi chuyển. Trả về một {{jsxref("Promise")}} giải quyết với chuỗi `"granted"` hoặc `"denied"`.

## Thuộc tính phiên bản

- {{DOMxRef("DeviceMotionEvent.acceleration")}} {{ReadOnlyInline}}
  - : Đối tượng cung cấp gia tốc của thiết bị trên ba trục X, Y và Z. Gia tốc được biểu thị bằng [m/s²](https://en.wikipedia.org/wiki/Meter_per_second_squared).
- {{DOMxRef("DeviceMotionEvent.accelerationIncludingGravity")}} {{ReadOnlyInline}}
  - : Đối tượng cung cấp gia tốc của thiết bị trên ba trục X, Y và Z bao gồm hiệu ứng của trọng lực. Gia tốc được biểu thị bằng [m/s²](https://en.wikipedia.org/wiki/Meter_per_second_squared).
- {{DOMxRef("DeviceMotionEvent.rotationRate")}} {{ReadOnlyInline}}
  - : Đối tượng cung cấp tốc độ thay đổi hướng của thiết bị trên ba trục hướng alpha, beta và gamma. Tốc độ quay được biểu thị bằng độ trên giây.
- {{DOMxRef("DeviceMotionEvent.interval")}} {{ReadOnlyInline}}
  - : Một số biểu thị khoảng thời gian, tính bằng mili giây, mà dữ liệu được lấy từ thiết bị.

## Ví dụ

```js
window.addEventListener("devicemotion", (event) => {
  console.log(`${event.acceleration.x} m/s2`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Device orientation events/Detecting device orientation", "Detecting device orientation", "", "nocode")}}
- {{domxref("Device orientation events/Orientation and motion data explained", "Orientation and motion data explained", "", "nocode")}}
- {{DOMxRef("DeviceOrientationEvent")}}
- {{DOMxRef("Window.deviceorientation_event", "deviceorientation")}} event
- {{DOMxRef("Window.deviceorientationabsolute_event", "deviceorientationabsolute")}} event
- {{DOMxRef("Window/devicemotion_event", "devicemotion")}} event
- {{DOMxRef("Accelerometer")}}
- {{DOMxRef("LinearAccelerationSensor")}}
