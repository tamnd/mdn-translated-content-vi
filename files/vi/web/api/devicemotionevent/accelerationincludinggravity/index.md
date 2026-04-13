---
title: "DeviceMotionEvent: accelerationIncludingGravity property"
short-title: accelerationIncludingGravity
slug: Web/API/DeviceMotionEvent/accelerationIncludingGravity
page-type: web-api-instance-property
browser-compat: api.DeviceMotionEvent.accelerationIncludingGravity
---

{{APIRef("Device Orientation Events")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`accelerationIncludingGravity`** của giao diện {{domxref("DeviceMotionEvent")}} trả về lượng gia tốc được ghi bởi thiết bị, tính bằng [mét trên giây bình phương (m/s²)](https://en.wikipedia.org/wiki/Meter_per_second_squared). Không giống như {{DOMxRef("DeviceMotionEvent.acceleration")}} vốn bù trừ ảnh hưởng của trọng lực, giá trị của nó là tổng gia tốc của thiết bị do người dùng tạo ra và gia tốc bằng và ngược chiều với gia tốc do trọng lực gây ra. Nói cách khác, nó đo [lực g](https://en.wikipedia.org/wiki/G-Force). Trong thực tế, giá trị này biểu thị dữ liệu thô được đo bởi [gia tốc kế](https://en.wikipedia.org/wiki/Accelerometer).

Giá trị này thường không hữu ích như {{DOMxRef("DeviceMotionEvent.acceleration")}}, nhưng có thể là giá trị duy nhất khả dụng trên các thiết bị không thể loại bỏ trọng lực khỏi dữ liệu gia tốc, chẳng hạn như trên các thiết bị không có con quay hồi chuyển.

> [!NOTE]
> Tên `accelerationIncludingGravity` có thể gây nhầm lẫn. Thuộc tính này biểu thị gia tốc bao gồm _hiệu ứng của_ trọng lực. Ví dụ: nếu thiết bị nằm phẳng trên bề mặt ngang với màn hình hướng lên, trọng lực sẽ là -9.8 dọc theo trục Z, trong khi `acceleration.z` sẽ là 0 và `accelerationIncludingGravity.z` sẽ là 9.8. Tương tự, nếu thiết bị đang rơi tự do với màn hình nằm ngang và hướng lên, trọng lực sẽ là -9.8 dọc theo trục Z, trong khi `acceleration.z` sẽ là -9.8 và `accelerationIncludingGravity.z` sẽ là 0.

## Giá trị

Thuộc tính `accelerationIncludingGravity` là đối tượng cung cấp thông tin về gia tốc trên ba trục. Mỗi trục được biểu thị với thuộc tính riêng:

- `x`
  - : Biểu thị gia tốc theo trục x, trục từ tây sang đông
- `y`
  - : Biểu thị gia tốc theo trục y, trục từ nam lên bắc
- `z`
  - : Biểu thị gia tốc theo trục z, trục từ dưới lên trên

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Device orientation events/Detecting device orientation", "Detecting device orientation", "", "nocode")}}
- {{domxref("Device orientation events/Orientation and motion data explained", "Orientation and motion data explained", "", "nocode")}}
- {{DOMxRef("Window/devicemotion_event", "devicemotion")}} event
