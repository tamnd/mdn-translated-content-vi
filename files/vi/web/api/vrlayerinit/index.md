---
title: VRLayerInit
slug: Web/API/VRLayerInit
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.getLayers
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Từ điển **`VRLayerInit`** của [WebVR API](/en-US/docs/Web/API/WebVR_API) đại diện cho một lớp nội dung ({{domxref("HTMLCanvasElement")}} hoặc {{domxref("OffscreenCanvas")}}) mà bạn muốn trình bày trong màn hình VR.

> [!NOTE]
> Từ điển này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Bạn có thể lấy các đối tượng `VRLayerInit` bằng cách sử dụng {{domxref("VRDisplay.getLayers()")}}, và trình bày chúng bằng phương thức {{domxref("VRDisplay.requestPresent()")}}.

## Thuộc tính phiên bản

- {{domxref("VRLayerInit.leftBounds")}} {{deprecated_inline}}
  - : Xác định giới hạn kết cấu bên trái của canvas mà nội dung sẽ được trình bày bởi {{domxref("VRDisplay")}}.
- {{domxref("VRLayerInit.rightBounds")}} {{deprecated_inline}}
  - : Xác định giới hạn kết cấu bên phải của canvas mà nội dung sẽ được trình bày bởi {{domxref("VRDisplay")}}.
- {{domxref("VRLayerInit.source")}} {{deprecated_inline}}
  - : Xác định canvas mà nội dung sẽ được trình bày bởi {{domxref("VRDisplay")}} khi {{domxref("VRDisplay.submitFrame()")}} được gọi.

## Ví dụ

```js
// currently returns an empty array
let layers = vrDisplay.getLayers();

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
        vrDisplay.requestPresent([{ source: canvas }]).then(() => {
          console.log("Presenting to WebVR display");

          // Here it returns an array of VRLayerInit objects
          layers = vrDisplay.getLayers();

          // …
        });
      });
    }
  });
}
```

Đối tượng `VRLayerInit` trông giống như thế này:

```js
const init = {
  leftBounds: [
    /* … */
  ],
  rightBounds: [
    /* … */
  ],
  source: canvasReference,
};
```

> [!NOTE]
> `canvasReference` đề cập đến phần tử {{htmlelement("canvas")}} chính nó, không phải ngữ cảnh WebGL liên quan đến canvas. Hai thành viên còn lại là các mảng.

## Thông số kỹ thuật

Từ điển này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
