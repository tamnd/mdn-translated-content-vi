---
title: "DeviceOrientationEvent: DeviceOrientationEvent() constructor"
short-title: DeviceOrientationEvent()
slug: Web/API/DeviceOrientationEvent/DeviceOrientationEvent
page-type: web-api-constructor
browser-compat: api.DeviceOrientationEvent.DeviceOrientationEvent
---

{{APIRef("Device Orientation Events")}}{{securecontext_header}}

Hàm khởi tạo **`DeviceOrientationEvent()`** tạo một đối tượng {{domxref("DeviceOrientationEvent")}} mới.

## Cú pháp

```js-nolint
new DeviceOrientationEvent(type)
new DeviceOrientationEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện. Phân biệt chữ hoa chữ thường và trình duyệt đặt nó thành `deviceorientation` hoặc `deviceorientationabsolute`. Trong trường hợp sau, `options.absolute` luôn là `true`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `alpha` {{optional_inline}}
      - : Một số biểu thị chuyển động của thiết bị quanh trục z, tính bằng độ với các giá trị trong khoảng từ 0 đến 360. Mặc định là `null`.
    - `beta` {{optional_inline}}
      - : Một số biểu thị chuyển động của thiết bị quanh trục x, tính bằng độ với các giá trị trong khoảng từ -180 đến 180. Đây biểu thị chuyển động từ trước ra sau của thiết bị. Mặc định là `null`.
    - `gamma` {{optional_inline}}
      - : Một số biểu thị chuyển động của thiết bị quanh trục y, tính bằng độ với các giá trị trong khoảng từ -90 đến 90. Đây biểu thị chuyển động từ trái sang phải của thiết bị. Mặc định là `null`.
    - `absolute`
      - : Giá trị boolean cho biết thiết bị có cung cấp dữ liệu hướng tuyệt đối hay không. Mặc định là `false`.

### Giá trị trả về

Một đối tượng {{domxref("DeviceOrientationEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
