---
title: "VRDisplayCapabilities: canPresent property"
short-title: canPresent
slug: Web/API/VRDisplayCapabilities/canPresent
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplayCapabilities.canPresent
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`canPresent`** của giao diện {{domxref("VRDisplayCapabilities")}} trả về giá trị boolean cho biết liệu màn hình VR có khả năng trình bày nội dung hay không (ví dụ: qua HMD).

> [!NOTE]
> Thuộc tính này là một phần của WebVR API cũ [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/). Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Điều này hữu ích để xác định các thiết bị "magic window" có khả năng theo dõi 6DoF nhưng {{domxref("VRDisplay.requestPresent()")}} không có ý nghĩa. Nếu `canPresent` là `false`, các lời gọi tới {{domxref("VRDisplay.requestPresent()")}} sẽ thất bại, và {{domxref("VRDisplay.getEyeParameters()")}} sẽ trả về `null`.

## Giá trị

Một giá trị boolean.

## Ví dụ

Xem [`VRDisplayCapabilities`](/en-US/docs/Web/API/VRDisplayCapabilities#examples) để xem code ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của WebVR API cũ [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trong lộ trình để trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc [hướng dẫn Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
