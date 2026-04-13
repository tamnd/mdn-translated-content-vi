---
title: "VRDisplay: thuộc tính isConnected"
short-title: isConnected
slug: Web/API/VRDisplay/isConnected
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.isConnected
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`isConnected`** của giao diện {{domxref("VRDisplay")}} trả về một giá trị boolean cho biết `VRDisplay` có được kết nối với máy tính hay không.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Giá trị

Một giá trị boolean; `true` nghĩa là màn hình đang được kết nối; `false` nghĩa là không.

## Ví dụ

```js
navigator.getVRDisplays().then((displays) => {
  // If a display is available, use it to present the scene
  if (displays.length > 0) {
    vrDisplay = displays[0];

    // Starting the presentation when the button is clicked: It can only be called in response to a user gesture
    btn.addEventListener("click", () => {
      // Only request presentation if the display is still connected.
      if (vrDisplay.isConnected) {
        vrDisplay.requestPresent([{ source: canvas }]).then(() => {
          // start rendering the app, etc.
        });
      } else {
        console.log("Connection to display lost");
      }
    });
  }
});
```

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị sử dụng các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hay một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
