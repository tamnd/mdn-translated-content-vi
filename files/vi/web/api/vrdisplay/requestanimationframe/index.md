---
title: "VRDisplay: phương thức requestAnimationFrame()"
short-title: requestAnimationFrame()
slug: Web/API/VRDisplay/requestAnimationFrame
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.requestAnimationFrame
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`requestAnimationFrame()`** của giao diện {{domxref("VRDisplay")}} là một triển khai đặc biệt của {{domxref("Window.requestAnimationFrame")}} chứa một hàm callback sẽ được gọi mỗi khi một khung hình mới của bản trình chiếu `VRDisplay` được kết xuất:

> [!NOTE]
> Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

- Khi `VRDisplay` không đang trình chiếu cảnh, phương thức này tương đương về mặt chức năng với {{domxref("Window.requestAnimationFrame")}}.
- Khi `VRDisplay` đang trình chiếu, callback được gọi theo tần số làm mới gốc của nó.

## Cú pháp

```js-nolint
requestAnimationFrame(callback)
```

### Tham số

- `callback`
  - : Một hàm callback sẽ được gọi mỗi khi một khung hình mới của bản trình chiếu `VRDisplay` được kết xuất.

### Giá trị trả về

Một số nguyên long đại diện cho handle của lần gọi `requestAnimationFrame()`. Handle này có thể được truyền vào lời gọi {{domxref("VRDisplay.cancelAnimationFrame()")}} để hủy đăng ký callback.

## Ví dụ

```js
const frameData = new VRFrameData();
let vrDisplay;

navigator.getVRDisplays().then((displays) => {
  vrDisplay = displays[0];
  console.log("Display found");
  // Starting the presentation when the button is clicked: It can only be called in response to a user gesture
  btn.addEventListener("click", () => {
    vrDisplay.requestPresent([{ source: canvas }]).then(() => {
      drawVRScene();
    });
  });
});

// WebVR: Draw the scene for the WebVR display.
function drawVRScene() {
  // WebVR: Request the next frame of the animation
  vrSceneFrame = vrDisplay.requestAnimationFrame(drawVRScene);

  // Populate frameData with the data of the next frame to display
  vrDisplay.getFrameData(frameData);

  // You can get the position, orientation, etc. of the display from the current frame's pose
  const curFramePose = frameData.pose;
  const curPos = curFramePose.position;
  const curOrient = curFramePose.orientation;

  // Clear the canvas before we start drawing on it.

  gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

  // WebVR: Create the required projection and view matrix locations needed
  // for passing into the uniformMatrix4fv methods below

  const projectionMatrixLocation = gl.getUniformLocation(
    shaderProgram,
    "projMatrix",
  );
  const viewMatrixLocation = gl.getUniformLocation(shaderProgram, "viewMatrix");

  // WebVR: Render the left eye's view to the left half of the canvas
  gl.viewport(0, 0, canvas.width * 0.5, canvas.height);
  gl.uniformMatrix4fv(
    projectionMatrixLocation,
    false,
    frameData.leftProjectionMatrix,
  );
  gl.uniformMatrix4fv(viewMatrixLocation, false, frameData.leftViewMatrix);
  drawGeometry();

  // WebVR: Render the right eye's view to the right half of the canvas
  gl.viewport(canvas.width * 0.5, 0, canvas.width * 0.5, canvas.height);
  gl.uniformMatrix4fv(
    projectionMatrixLocation,
    false,
    frameData.rightProjectionMatrix,
  );
  gl.uniformMatrix4fv(viewMatrixLocation, false, frameData.rightViewMatrix);
  drawGeometry();

  function drawGeometry() {
    // draw the view for each eye
  }

  // …

  // WebVR: Indicate that we are ready to present the rendered frame to the VR display
  vrDisplay.submitFrame();
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
