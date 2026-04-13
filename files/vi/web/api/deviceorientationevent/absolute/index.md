---
title: "DeviceOrientationEvent: absolute property"
short-title: absolute
slug: Web/API/DeviceOrientationEvent/absolute
page-type: web-api-instance-property
browser-compat: api.DeviceOrientationEvent.absolute
---

{{APIRef("Device Orientation Events")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`absolute`** của giao diện {{domxref("DeviceOrientationEvent")}} cho biết thiết bị có cung cấp dữ liệu hướng tuyệt đối hay không (tức là tham chiếu đến hệ tọa độ của Trái Đất) hay sử dụng một khung tùy ý được xác định bởi thiết bị. Xem [Orientation and motion data explained](/en-US/docs/Web/API/Device_orientation_events/Orientation_and_motion_data_explained) để biết thêm chi tiết.

## Giá trị

- `true` nếu dữ liệu hướng trong `instanceOfDeviceOrientationEvent` được cung cấp dưới dạng sự khác biệt giữa hệ tọa độ của Trái Đất và hệ tọa độ của thiết bị
- `false` nếu dữ liệu hướng được cung cấp tham chiếu đến một khung tọa độ tùy ý, được thiết bị xác định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Device orientation events/Detecting device orientation", "Detecting device orientation", "", "nocode")}}
- {{domxref("Device orientation events/Orientation and motion data explained", "Orientation and motion data explained", "", "nocode")}}
- {{domxref("Window.deviceorientation_event", "deviceorientation")}} event
- {{domxref("Window.deviceorientationabsolute_event", "deviceorientationabsolute")}} event
