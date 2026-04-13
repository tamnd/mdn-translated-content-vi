---
title: "VRDisplay: cancelAnimationFrame() method"
short-title: cancelAnimationFrame()
slug: Web/API/VRDisplay/cancelAnimationFrame
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.cancelAnimationFrame
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`cancelAnimationFrame()`** của giao diện {{domxref("VRDisplay")}} là triển khai đặc biệt của {{domxref("Window.cancelAnimationFrame")}}, hủy đăng ký các callback đã đăng ký với {{domxref("VRDisplay.requestAnimationFrame()")}}.

> [!NOTE]
> Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Cú pháp

```js-nolint
cancelAnimationFrame(handle)
```

### Tham số

- `handle`
  - : Giá trị handle được trả về từ lệnh gọi {{domxref("VRDisplay.requestAnimationFrame()")}} mà bạn muốn hủy đăng ký.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
drawScene();

// WebVR: Check to see if WebVR is supported
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
} else {
  info.textContent = "WebVR API not supported by this browser.";
}

function drawVRScene() {
  // WebVR: Request the next frame of the animation
  vrSceneFrame = vrDisplay.requestAnimationFrame(drawVRScene);

  // …
}
```

> [!NOTE]
> Bạn có thể xem mã đầy đủ tại [raw-webgl-example](https://github.com/mdn/webvr-tests/blob/main/webvr/raw-webgl-example/webgl-demo.js).

## Thông số kỹ thuật

Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, nên dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/) hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển các ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
