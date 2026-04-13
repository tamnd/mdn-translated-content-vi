---
title: VRStageParameters
slug: Web/API/VRStageParameters
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.VRStageParameters
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`VRStageParameters`** của [WebVR API](/en-US/docs/Web/API/WebVR_API) đại diện cho các giá trị mô tả khu vực sân khấu cho các thiết bị hỗ trợ trải nghiệm quy mô phòng.

> [!NOTE]
> Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Giao diện này có thể truy cập thông qua thuộc tính {{domxref("VRDisplay.stageParameters")}}.

## Thuộc tính phiên bản

- {{domxref("VRStageParameters.sittingToStandingTransform")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Chứa ma trận biến đổi các ma trận nhìn trong không gian ngồi của {{domxref("VRFrameData")}} sang không gian đứng.
- {{domxref("VRStageParameters.sizeX")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : _Trả về chiều rộng_ của giới hạn khu vực chơi tính bằng mét.
- {{domxref("VRStageParameters.sizeY")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : _Trả về chiều sâu_ của giới hạn khu vực chơi tính bằng mét.

## Ví dụ

```js
const info = document.querySelector("p");
let vrDisplay;

navigator.getVRDisplays().then((displays) => {
  vrDisplay = displays[0];
  const stageParams = vrDisplay.stageParameters;
  // stageParams is a VRStageParameters object

  if (stageParams === null) {
    info.textContent =
      "Your VR Hardware does not support room-scale experiences.";
  } else {
    info.innerText = `
Sitting to standing transform: ${stageParams.sittingToStandingTransform}
Play area width (m): ${stageParams.sizeX}
Play area depth (m): ${stageParams.sizeY}`;
    info.insertBefore(
      document.createElement("strong"),
      info.firstChild,
    ).textContent = "Display stage parameters";
  }
});
```

## Thông số kỹ thuật

Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị sử dụng các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc [polyfill](https://github.com/immersive-web/webxr-polyfill) để phát triển các ứng dụng WebXR hoạt động trên tất cả các trình duyệt.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
