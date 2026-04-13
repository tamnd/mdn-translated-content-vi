---
title: "VRDisplay: phương thức resetPose()"
short-title: resetPose()
slug: Web/API/VRDisplay/resetPose
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.resetPose
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`resetPose()`** của giao diện {{domxref("VRDisplay")}} đặt lại tư thế cho `VRDisplay`, coi {{domxref("VRPose.position")}} và {{domxref("VRPose.orientation")}} hiện tại của nó là các giá trị "gốc/không".

> [!NOTE]
> Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Sau khi `resetPose()` được gọi, các tư thế tương lai được trả về từ {{domxref("VRDisplay.getPose()")}}/{{domxref("VRDisplay.getImmediatePose()")}} sẽ mô tả các vị trí tương đối với vị trí của `VRDisplay` khi `resetPose()` được gọi lần cuối và sẽ coi hướng yaw của màn hình khi `resetPose()` được gọi lần cuối là hướng nhìn thẳng về phía trước.

Roll và pitch được báo cáo của VRDisplay không thay đổi khi `resetPose()` được gọi vì chúng có liên quan đến trọng lực. Việc gọi `resetPose()` có thể thay đổi ma trận {{domxref("VRStageParameters.sittingToStandingTransform")}}.

## Cú pháp

```js-nolint
resetPose()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Assuming vrDisplay already contains a VRDisplay object,
// and we have a <button> referenced inside btn
btn.addEventListener("click", () => {
  vrDisplay.resetPose();
  console.log("Current pose set as origin/center");
});
```

## Thông số kỹ thuật

Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị sử dụng các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hay một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
