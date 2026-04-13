---
title: "VRDisplay: phương thức requestPresent()"
short-title: requestPresent()
slug: Web/API/VRDisplay/requestPresent
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.requestPresent
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`requestPresent()`** của giao diện {{domxref("VRDisplay")}} bắt đầu cho `VRDisplay` trình chiếu cảnh.

> [!NOTE]
> Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Cú pháp

```js-nolint
requestPresent(layers)
```

### Tham số

- `layers`
  - : Một mảng các đối tượng {{domxref("VRLayerInit")}} đại diện cho cảnh bạn muốn trình chiếu. Hiện tại, số lượng tối thiểu là 0 và tối đa là 1.

### Giá trị trả về

Một promise được giải quyết khi quá trình trình chiếu bắt đầu. Có một số quy tắc liên quan đến việc promise được thực hiện hay bị từ chối:

- Nếu {{domxref("VRDisplayCapabilities.canPresent")}} là false, hoặc nếu mảng VRLayer chứa nhiều hơn {{domxref("VRDisplayCapabilities.maxLayers")}} lớp, promise sẽ bị từ chối.
- Nếu {{domxref("VRDisplay")}} đã đang trình chiếu khi `requestPresent()` được gọi, `VRDisplay` sẽ cập nhật mảng `VRLayer` đang được trình chiếu.
- Nếu một lời gọi `requestPresent()` bị từ chối trong khi `VRDisplay` đang trình chiếu, nó sẽ kết thúc quá trình trình chiếu.
- Nếu `requestPresent()` được gọi ngoài một cử chỉ tương tác, promise sẽ bị từ chối trừ khi `VRDisplay` đã đang trình chiếu. Cử chỉ tương tác này cũng đủ để cho phép các lời gọi [`requestPointerLock()`](/en-US/docs/Web/API/Element/requestPointerLock) cho đến khi quá trình trình chiếu kết thúc.

## Ví dụ

```js
if (navigator.getVRDisplays) {
  console.log("WebVR 1.1 supported");
  // Then get the displays attached to the computer
  navigator.getVRDisplays().then((displays) => {
    // If a display is available, use it to present the scene
    if (displays.length > 0) {
      vrDisplay = displays[0];
      console.log("Display found");
      // Starting the presentation when the button is clicked: It can only be called in response to a user gesture
      btn.addEventListener("click", () => {
        if (btn.textContent === "Start VR display") {
          vrDisplay.requestPresent([{ source: canvas }]).then(() => {
            console.log("Presenting to WebVR display");

            // Set the canvas size to the size of the vrDisplay viewport

            const leftEye = vrDisplay.getEyeParameters("left");
            const rightEye = vrDisplay.getEyeParameters("right");

            canvas.width =
              Math.max(leftEye.renderWidth, rightEye.renderWidth) * 2;
            canvas.height = Math.max(
              leftEye.renderHeight,
              rightEye.renderHeight,
            );

            // stop the normal presentation, and start the vr presentation
            window.cancelAnimationFrame(normalSceneFrame);
            drawVRScene();

            btn.textContent = "Exit VR display";
          });
        } else {
          vrDisplay.exitPresent();
          console.log("Stopped presenting to WebVR display");

          btn.textContent = "Start VR display";

          // Stop the VR presentation, and start the normal presentation
          vrDisplay.cancelAnimationFrame(vrSceneFrame);
          drawScene();
        }
      });
    }
  });
}
```

> [!NOTE]
> Bạn có thể xem toàn bộ mã này tại [raw-webgl-example](https://github.com/mdn/webvr-tests/blob/main/webvr/raw-webgl-example/webgl-demo.js).

## Thông số kỹ thuật

Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị sử dụng các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hay một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
