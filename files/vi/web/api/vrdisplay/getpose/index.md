---
title: "VRDisplay: phương thức getPose()"
short-title: getPose()
slug: Web/API/VRDisplay/getPose
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.getPose
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`getPose()`** của giao diện {{domxref("VRDisplay")}} trả về một đối tượng {{domxref("VRPose")}} xác định tư thế dự đoán tương lai của `VRDisplay` vào thời điểm khung hình hiện tại thực sự được hiển thị.

> [!NOTE]
> Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).
>
> Nó thậm chí đã bị deprecated ở đó. Thay vào đó, bạn nên sử dụng {{domxref("VRDisplay.getFrameData()")}}, cũng cung cấp một đối tượng {{domxref("VRPose")}}.

## Cú pháp

```js-nolint
getPose()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("VRPose")}}.

## Ví dụ

Khi chúng ta có tham chiếu đến đối tượng {{domxref("VRDisplay")}}, chúng ta có thể lấy {{domxref("VRPose")}} đại diện cho tư thế hiện tại của màn hình.

```js
if (navigator.getVRDisplays) {
  console.log("WebVR 1.1 supported");
  // Then get the displays attached to the computer
  navigator.getVRDisplays().then((displays) => {
    // If a display is available, use it to present the scene
    if (displays.length > 0) {
      vrDisplay = displays[0];
      console.log("Display found");

      // Return the current VRPose object for the display
      const pose = vrDisplay.getPose();

      // …
    }
  });
}
```

Tuy nhiên, khuyến nghị bạn sử dụng thuộc tính {{domxref("VRFrameData.pose", "pose")}} không bị deprecated của đối tượng {{domxref("VRFrameData")}} (lấy thông qua {{domxref("VRDisplay.getFrameData()")}}) để lấy tư thế hiện tại cho mỗi khung hình trước khi gửi đến màn hình để hiển thị. Điều này xảy ra trên mỗi vòng lặp kết xuất của ứng dụng, do đó bạn có thể chắc chắn rằng dữ liệu tư thế là hiện tại.

## Thông số kỹ thuật

Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị sử dụng các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hay một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
