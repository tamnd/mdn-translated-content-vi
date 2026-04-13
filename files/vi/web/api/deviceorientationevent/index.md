---
title: DeviceOrientationEvent
slug: Web/API/DeviceOrientationEvent
page-type: web-api-interface
browser-compat: api.DeviceOrientationEvent
---

{{apiref("Device Orientation Events")}}{{securecontext_header}}

Giao diện **`DeviceOrientationEvent`** của {{domxref("Device Orientation Events", "", "", "nocode")}} cung cấp cho các nhà phát triển web thông tin về hướng vật lý của thiết bị đang chạy trang web.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("DeviceOrientationEvent.DeviceOrientationEvent","DeviceOrientationEvent.DeviceOrientationEvent()")}}
  - : Tạo một đối tượng `DeviceOrientationEvent` mới.

## Phương thức tĩnh

- {{domxref("DeviceOrientationEvent.requestPermission_static", "DeviceOrientationEvent.requestPermission()")}} {{experimental_inline}}
  - : Yêu cầu quyền của người dùng để truy cập dữ liệu hướng thiết bị. Trả về một {{jsxref("Promise")}} giải quyết với chuỗi `"granted"` hoặc `"denied"`.

## Thuộc tính phiên bản

- {{domxref("DeviceOrientationEvent.absolute")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết thiết bị có cung cấp dữ liệu hướng tuyệt đối hay không.
- {{domxref("DeviceOrientationEvent.alpha")}} {{ReadOnlyInline}}
  - : Một số biểu thị chuyển động của thiết bị quanh trục z, tính bằng độ với các giá trị trong khoảng từ 0 (bao gồm) đến 360 (không bao gồm).
- {{domxref("DeviceOrientationEvent.beta")}} {{ReadOnlyInline}}
  - : Một số biểu thị chuyển động của thiết bị quanh trục x, tính bằng độ với các giá trị trong khoảng từ -180 (bao gồm) đến 180 (không bao gồm). Đây biểu thị chuyển động từ trước ra sau của thiết bị.
- {{domxref("DeviceOrientationEvent.gamma")}} {{ReadOnlyInline}}
  - : Một số biểu thị chuyển động của thiết bị quanh trục y, tính bằng độ với các giá trị trong khoảng từ -90 (bao gồm) đến 90 (không bao gồm). Đây biểu thị chuyển động từ trái sang phải của thiết bị.
- `DeviceOrientationEvent.webkitCompassHeading` {{Non-Standard_Inline}} {{ReadOnlyInline}}
  - : Một số biểu thị sự chênh lệch giữa chuyển động của thiết bị quanh trục z của hệ thống thế giới và hướng bắc, tính bằng độ với các giá trị trong khoảng từ 0 đến 360.
- `DeviceOrientationEvent.webkitCompassAccuracy` {{Non-Standard_Inline}} {{ReadOnlyInline}}
  - : Độ chính xác của la bàn có nghĩa là độ lệch là dương hoặc âm. Thường là 10.

## Ví dụ

```js
window.addEventListener("deviceorientation", (event) => {
  console.log(`${event.alpha} : ${event.beta} : ${event.gamma}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Device orientation events/Detecting device orientation", "Detecting device orientation", "", "nocode")}}
- {{domxref("Device orientation events/Orientation and motion data explained", "Orientation and motion data explained", "", "nocode")}}
- {{domxref("DeviceMotionEvent")}}
- {{domxref("Window.devicemotion_event", "devicemotion")}} event
- {{domxref("Window.deviceorientation_event", "deviceorientation")}} event
- {{domxref("Window.deviceorientationabsolute_event", "deviceorientationabsolute")}} event
