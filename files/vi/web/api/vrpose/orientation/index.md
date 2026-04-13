---
title: "VRPose: orientation property"
short-title: orientation
slug: Web/API/VRPose/orientation
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRPose.orientation
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`orientation`** của giao diện {{domxref("VRPose")}} trả về hướng của cảm biến tại dấu thời gian hiện tại, dưới dạng giá trị quaternion.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Giá trị là {{jsxref("Float32Array")}}, bao gồm các giá trị sau:

- pitch — xoay quanh trục X.
- yaw — xoay quanh trục Y.
- roll — xoay quanh trục Z.
- w — chiều thứ tư (thường là 1).

Yaw (xoay quanh trục y) của hướng liên quan đến yaw ban đầu của cảm biến khi nó được đọc lần đầu tiên hoặc yaw của cảm biến tại thời điểm {{domxref("VRDisplay.resetPose()")}} được gọi lần cuối.

## Giá trị

Một {{jsxref("Float32Array")}}, hoặc `null` nếu cảm biến VR không thể cung cấp dữ liệu hướng.

## Ví dụ

Xem [`VRDisplay.getFrameData()`](/en-US/docs/Web/API/VRDisplay/getFrameData#examples) để xem mã ví dụ.

> [!NOTE]
> Hướng `{ x: 0, y: 0, z: 0, w: 1 }` được coi là "phía trước".

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn theo lộ trình trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt. Đọc hướng dẫn [Meta's Porting from WebVR to WebXR](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
