---
title: "VRPose: angularVelocity property"
short-title: angularVelocity
slug: Web/API/VRPose/angularVelocity
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRPose.angularVelocity
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`angularVelocity`** của giao diện {{domxref("VRPose")}} trả về mảng đại diện cho vectơ vận tốc góc của {{domxref("VRDisplay")}} tại dấu thời gian hiện tại, tính bằng radian trên giây.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Nói cách khác, vận tốc hiện tại mà cảm biến đang xoay quanh các trục `x`, `y`, và `z`.

## Giá trị

Một {{jsxref("Float32Array")}}, hoặc `null` nếu cảm biến VR không thể cung cấp thông tin vận tốc góc.

## Ví dụ

```js
// rendering loop for a VR scene
function drawVRScene() {
  // WebVR: Request the next frame of the animation
  vrSceneFrame = vrDisplay.requestAnimationFrame(drawVRScene);

  // Populate frameData with the data of the next frame to display
  vrDisplay.getFrameData(frameData);

  // Retrieve the angular velocity values for use in rendering
  // curFramePose is a VRPose object
  const curFramePose = frameData.pose;
  const angVel = curFramePose.angularVelocity;
  const avx = angVel[0];
  const avy = angVel[1];
  const avz = angVel[2];

  // render the scene
  // …

  // WebVR: submit the rendered frame to the VR display
  vrDisplay.submitFrame();
}
```

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn theo lộ trình trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt. Đọc hướng dẫn [Meta's Porting from WebVR to WebXR](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
