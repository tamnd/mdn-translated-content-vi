---
title: "VRDisplayCapabilities: maxLayers property"
short-title: maxLayers
slug: Web/API/VRDisplayCapabilities/maxLayers
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplayCapabilities.maxLayers
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`maxLayers`** của giao diện {{domxref("VRDisplayCapabilities")}} trả về số cho biết số lượng tối đa {{domxref("VRLayerInit")}} mà màn hình VR có thể trình bày cùng một lúc (ví dụ: độ dài tối đa của mảng mà {{domxref("VRDisplay.requestPresent()")}} có thể chấp nhận.)

> [!NOTE]
> Thuộc tính này là một phần của WebVR API cũ [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/). Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Giá trị

Một số, phải là 1 nếu {{domxref("VRDisplayCapabilities.canPresent")}} là `true`, hoặc 0 trong trường hợp khác.

## Ví dụ

Xem [`VRDisplayCapabilities`](/en-US/docs/Web/API/VRDisplayCapabilities#examples) để xem code ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của WebVR API cũ [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trong lộ trình để trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc [hướng dẫn Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
