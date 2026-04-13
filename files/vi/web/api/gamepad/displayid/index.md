---
title: "Gamepad: thuộc tính displayId"
short-title: displayId
slug: Web/API/Gamepad/displayId
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.Gamepad.displayId
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`displayId`** của giao diện {{domxref("Gamepad")}} _trả về {{domxref("VRDisplay.displayId")}} của {{domxref("VRDisplay")}} được liên kết - tức là `VRDisplay` mà gamepad đang điều khiển cảnh được hiển thị._

Một Gamepad được xem là có liên kết với một {{domxref("VRDisplay")}} nếu nó báo cáo một tư thế nằm trong cùng không gian với tư thế của màn hình, xem {{domxref("VRDisplay.getPose()")}}.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/#gamepad-getvrdisplays-attribute) cũ. Nó đã bị thay thế bởi [WebXR Gamepads Module](https://immersive-web.github.io/webxr-gamepads-module/).
>
> Không có phương án thay thế trực tiếp cho thuộc tính này. Đối tượng {{domxref("Gamepad")}} liên kết với một {{domxref("XRInputSource")}} có thể được lấy bằng thuộc tính {{domxref("XRInputSource.gamepad")}}.

## Giá trị

Một số biểu thị {{domxref("VRDisplay.displayId")}} được liên kết. Nếu số là 0, thì gamepad không liên kết với màn hình VR.

## Ví dụ

```js
window.addEventListener("gamepadconnected", (e) => {
  if (!e.gamepad.displayId) {
    console.log("Gamepad connected");
  } else {
    console.log(
      `Gamepad connected, associated with VR display ${e.gamepad.displayId}`,
    );
  }
});
```

## Đặc tả kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/#gamepad-getvrdisplays-attribute) cũ đã bị thay thế bởi [WebXR Gamepads Module](https://immersive-web.github.io/webxr-gamepads-module/). Nó không còn nằm trên lộ trình trở thành một tiêu chuẩn.

Cho đến khi tất cả trình duyệt đã triển khai các [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, bạn nên dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/) hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển các ứng dụng WebXR có thể hoạt động trên mọi trình duyệt. Hãy đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
