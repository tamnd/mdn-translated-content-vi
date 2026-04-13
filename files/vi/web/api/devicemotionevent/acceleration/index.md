---
title: "DeviceMotionEvent: acceleration property"
short-title: acceleration
slug: Web/API/DeviceMotionEvent/acceleration
page-type: web-api-instance-property
browser-compat: api.DeviceMotionEvent.acceleration
---

{{APIRef("Device Orientation Events")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`acceleration`** của giao diện {{domxref("DeviceMotionEvent")}} trả về gia tốc được ghi bởi thiết bị, tính bằng [mét trên giây bình phương (m/s²)](https://en.wikipedia.org/wiki/Meter_per_second_squared). Giá trị này không bao gồm hiệu ứng của lực hấp dẫn, trái với {{DOMxRef("DeviceMotionEvent.accelerationIncludingGravity")}}.

> [!NOTE]
> Nếu phần cứng không biết cách loại bỏ trọng lực khỏi dữ liệu gia tốc, giá trị này có thể không có trong {{DOMxRef("DeviceMotionEvent")}}. Trong trường hợp này, bạn cần sử dụng {{DOMxRef("DeviceMotionEvent.accelerationIncludingGravity")}} thay thế.

## Giá trị

Thuộc tính `acceleration` là đối tượng cung cấp thông tin về gia tốc trên ba trục trong [khung tọa độ thiết bị](/en-US/docs/Web/API/Device_orientation_events/Orientation_and_motion_data_explained#device_coordinate_frame). Mỗi trục được biểu thị với thuộc tính riêng:

- `x`
  - : Biểu thị gia tốc dọc theo trục x
- `y`
  - : Biểu thị gia tốc dọc theo trục y
- `z`
  - : Biểu thị gia tốc dọc theo trục z

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Device orientation events/Detecting device orientation", "Detecting device orientation", "", "nocode")}}
- {{domxref("Device orientation events/Orientation and motion data explained", "Orientation and motion data explained", "", "nocode")}}
- {{DOMxRef("Window/devicemotion_event", "devicemotion")}} event
