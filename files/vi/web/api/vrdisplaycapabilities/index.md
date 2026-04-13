---
title: VRDisplayCapabilities
slug: Web/API/VRDisplayCapabilities
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplayCapabilities
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`VRDisplayCapabilities`** của [WebVR API](/en-US/docs/Web/API/WebVR_API) mô tả các khả năng của {{domxref("VRDisplay")}}, các tính năng của nó có thể được sử dụng để thực hiện kiểm tra khả năng thiết bị VR, ví dụ như liệu nó có thể trả về thông tin vị trí hay không.

> [!NOTE]
> Giao diện này là một phần của WebVR API cũ [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/). Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Giao diện này có thể truy cập qua thuộc tính {{domxref("VRDisplay.capabilities")}}.

## Thuộc tính phiên bản

- {{domxref("VRDisplayCapabilities.canPresent")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về giá trị boolean cho biết liệu màn hình VR có khả năng trình bày nội dung hay không (ví dụ: qua HMD).
- {{domxref("VRDisplayCapabilities.hasExternalDisplay")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về giá trị boolean cho biết liệu màn hình VR có tách biệt với màn hình chính của thiết bị hay không.
- {{domxref("VRDisplayCapabilities.hasOrientation")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về giá trị boolean cho biết liệu màn hình VR có thể theo dõi và trả về thông tin hướng hay không.
- {{domxref("VRDisplayCapabilities.hasPosition")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về giá trị boolean cho biết liệu màn hình VR có thể theo dõi và trả về thông tin vị trí hay không.
- {{domxref("VRDisplayCapabilities.maxLayers")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về số cho biết số lượng tối đa {{domxref("VRLayerInit")}} mà màn hình VR có thể trình bày cùng một lúc (ví dụ: độ dài tối đa của mảng mà {{domxref("VRDisplay.requestPresent()")}} có thể chấp nhận.)

## Ví dụ

```js
function reportDisplays() {
  navigator.getVRDisplays().then((displays) => {
    displays.forEach((display, i) => {
      const cap = display.capabilities;
      // cap is a VRDisplayCapabilities object
      const listItem = document.createElement("li");
      listItem.innerText = `
VR Display ID: ${display.displayId}
VR Display Name: ${display.displayName}
Display can present content: ${cap.canPresent}
Display is separate from the computer's main display: ${cap.hasExternalDisplay}
Display can return position info: ${cap.hasPosition}
Display can return orientation info: ${cap.hasOrientation}
Display max layers: ${cap.maxLayers}`;
      listItem.insertBefore(
        document.createElement("strong"),
        listItem.firstChild,
      ).textContent = `Display ${i + 1}`;
      list.appendChild(listItem);
    });
  });
}
```

## Thông số kỹ thuật

Giao diện này là một phần của WebVR API cũ [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trong lộ trình để trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc [hướng dẫn Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
