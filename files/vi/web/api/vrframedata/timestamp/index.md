---
title: "VRFrameData: timestamp property"
short-title: timestamp
slug: Web/API/VRFrameData/timestamp
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRFrameData.timestamp
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`timestamp`** của giao diện {{domxref("VRFrameData")}} trả về giá trị dấu thời gian tăng liên tục, đại diện cho thời điểm cập nhật khung hình xảy ra.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Dấu thời gian hữu ích để xác định xem dữ liệu trạng thái vị trí có được cập nhật từ phần cứng hay không. Vì các giá trị tăng đơn điệu, chúng có thể được so sánh để xác định thứ tự cập nhật, các giá trị mới hơn sẽ luôn lớn hơn hoặc bằng các giá trị cũ hơn.

Dấu thời gian bắt đầu từ 0 khi {{domxref("VRDisplay.getFrameData()")}} được gọi lần đầu tiên cho một {{domxref("VRDisplay")}} nhất định.

## Giá trị

Một đối tượng {{domxref("DOMHighResTimeStamp")}}.

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

  // grab the current timestamp on each run of the rendering loop
  // and do something with it
  frameData.timestamp;

  // …

  // WebVR: Indicates that we are ready to present the rendered frame to the VR display
  vrDisplay.submitFrame();
}
```

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt triển khai các [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, bạn nên dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
