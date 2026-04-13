---
title: VRPose
slug: Web/API/VRPose
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.VRPose
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`VRPose`** của [WebVR API](/en-US/docs/Web/API/WebVR_API) đại diện cho trạng thái của cảm biến VR tại một dấu thời gian nhất định (bao gồm thông tin về hướng, vị trí, vận tốc và gia tốc).

> [!NOTE]
> Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Giao diện này có thể truy cập qua các phương thức {{domxref("VRDisplay.getPose()")}} và {{domxref("VRDisplay.getFrameData()")}}. {{domxref("VRDisplay.getPose()")}} đã lỗi thời.

## Thuộc tính phiên bản

- {{domxref("VRPose.position")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về vị trí của {{domxref("VRDisplay")}} tại {{domxref("VRFrameData.timestamp")}} hiện tại dưới dạng vectơ 3D.
- {{domxref("VRPose.linearVelocity")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về vận tốc tuyến tính của {{domxref("VRDisplay")}} tại {{domxref("VRFrameData.timestamp")}} hiện tại, tính bằng mét trên giây.
- {{domxref("VRPose.linearAcceleration")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về gia tốc tuyến tính của {{domxref("VRDisplay")}} tại {{domxref("VRFrameData.timestamp")}} hiện tại, tính bằng mét trên giây bình phương.
- {{domxref("VRPose.orientation")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về hướng của cảm biến tại {{domxref("VRFrameData.timestamp")}} hiện tại, dưới dạng giá trị quaternion.
- {{domxref("VRPose.angularVelocity")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về vận tốc góc của {{domxref("VRDisplay")}} tại {{domxref("VRFrameData.timestamp")}} hiện tại, tính bằng radian trên giây.
- {{domxref("VRPose.angularAcceleration")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về gia tốc góc của {{domxref("VRDisplay")}} tại {{domxref("VRFrameData.timestamp")}} hiện tại, tính bằng mét trên giây bình phương.

## Ví dụ

Xem [`VRDisplay.getFrameData()`](/en-US/docs/Web/API/VRDisplay/getFrameData#examples) để xem mã ví dụ.

## Thông số kỹ thuật

Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn theo lộ trình trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt. Đọc hướng dẫn [Meta's Porting from WebVR to WebXR](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
