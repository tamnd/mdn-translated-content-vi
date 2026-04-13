---
title: "DeviceMotionEvent: DeviceMotionEvent() constructor"
short-title: DeviceMotionEvent()
slug: Web/API/DeviceMotionEvent/DeviceMotionEvent
page-type: web-api-constructor
browser-compat: api.DeviceMotionEvent.DeviceMotionEvent
---

{{APIRef("Device Orientation Events")}}{{securecontext_header}}

Hàm khởi tạo **`DeviceMotionEvent()`** tạo một đối tượng {{DOMxRef("DeviceMotionEvent")}} mới.

## Cú pháp

```js-nolint
new DeviceMotionEvent(type)
new DeviceMotionEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện. Phân biệt chữ hoa chữ thường và trình duyệt luôn đặt nó thành `devicemotion`.
- `options` {{Optional_Inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `acceleration` {{Optional_Inline}}
      - : Đối tượng {{domxref("DeviceMotionEventAcceleration")}} cung cấp gia tốc của thiết bị trên ba trục X, Y và Z. Gia tốc được biểu thị bằng [m/s²](https://en.wikipedia.org/wiki/Meter_per_second_squared). Nếu không được chỉ định, mọi thuộc tính trong đối tượng sẽ là `null`.
    - `accelerationIncludingGravity` {{Optional_Inline}}
      - : Đối tượng {{domxref("DeviceMotionEventAcceleration")}} cung cấp gia tốc của thiết bị trên ba trục X, Y và Z bao gồm hiệu ứng của trọng lực. Gia tốc được biểu thị bằng [m/s²](https://en.wikipedia.org/wiki/Meter_per_second_squared). Nếu không được chỉ định, mọi thuộc tính trong đối tượng sẽ là `null`.
    - `rotationRate` {{Optional_Inline}}
      - : Đối tượng {{domxref("DeviceMotionEventRotationRate")}} cung cấp tốc độ thay đổi hướng của thiết bị trên ba trục hướng alpha, beta và gamma. Tốc độ quay được biểu thị bằng độ trên giây. Nếu không được chỉ định, mọi thuộc tính trong đối tượng sẽ là `null`.
    - `interval` {{Optional_Inline}}
      - : Một số biểu thị khoảng thời gian, tính bằng mili giây, mà dữ liệu được lấy từ thiết bị. Mặc định là `0`.

### Giá trị trả về

Một đối tượng {{domxref("DeviceMotionEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
