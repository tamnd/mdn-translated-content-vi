---
title: VREyeParameters
slug: Web/API/VREyeParameters
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.VREyeParameters
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`VREyeParameters`** của [WebVR API](/en-US/docs/Web/API/WebVR_API) đại diện cho tất cả thông tin cần thiết để hiển thị đúng một cảnh cho một mắt nhất định, bao gồm thông tin về trường nhìn.

> [!NOTE]
> Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Giao diện này có thể truy cập qua phương thức {{domxref("VRDisplay.getEyeParameters()")}}.

> [!WARNING]
> Các giá trị trong giao diện này không nên được sử dụng để tính toán ma trận view hoặc projection. Để đảm bảo khả năng tương thích phần cứng rộng nhất có thể, hãy sử dụng các ma trận được cung cấp bởi {{domxref("VRFrameData")}}.

## Thuộc tính phiên bản

- {{domxref("VREyeParameters.offset")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Đại diện cho độ lệch từ điểm trung tâm giữa hai mắt của người dùng đến trung tâm của mắt, tính bằng mét.
- {{domxref("VREyeParameters.fieldOfView")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Mô tả trường nhìn hiện tại của mắt, có thể thay đổi khi người dùng điều chỉnh khoảng cách đồng tử (IPD).
- {{domxref("VREyeParameters.maximumFieldOfView")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Mô tả trường nhìn tối đa được hỗ trợ cho mắt hiện tại.
- {{domxref("VREyeParameters.minimumFieldOfView")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Mô tả trường nhìn tối thiểu được hỗ trợ cho mắt hiện tại.
- {{domxref("VREyeParameters.renderWidth")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Mô tả chiều rộng render mục tiêu được khuyến nghị cho mỗi viewport mắt, tính bằng pixel.
- {{domxref("VREyeParameters.renderHeight")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Mô tả chiều cao render mục tiêu được khuyến nghị cho mỗi viewport mắt, tính bằng pixel.

## Ví dụ

```js
navigator.getVRDisplays().then((displays) => {
  // If a display is available, use it to present the scene
  vrDisplay = displays[0];
  console.log("Display found");
  // Starting the presentation when the button is clicked:
  //   It can only be called in response to a user gesture
  btn.addEventListener("click", () => {
    vrDisplay.requestPresent([{ source: canvas }]).then(() => {
      console.log("Presenting to WebVR display");

      // Set the canvas size to the size of the vrDisplay viewport

      const leftEye = vrDisplay.getEyeParameters("left");
      const rightEye = vrDisplay.getEyeParameters("right");

      canvas.width = Math.max(leftEye.renderWidth, rightEye.renderWidth) * 2;
      canvas.height = Math.max(leftEye.renderHeight, rightEye.renderHeight);

      drawVRScene();
    });
  });
});
```

## Thông số kỹ thuật

Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn theo lộ trình trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt. Đọc hướng dẫn [Meta's Porting from WebVR to WebXR](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
