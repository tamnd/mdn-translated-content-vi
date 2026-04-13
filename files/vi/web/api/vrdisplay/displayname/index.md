---
title: "VRDisplay: thuộc tính displayName"
short-title: displayName
slug: Web/API/VRDisplay/displayName
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.displayName
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`displayName`** của giao diện {{domxref("VRDisplay")}} trả về tên dễ đọc để nhận dạng `VRDisplay`.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Thông thường đây sẽ là tên tương tự như "Oculus VR HMD (HMD)" hoặc "Oculus VR HMD (Sensor)".

## Giá trị

Một chuỗi chứa tên dễ đọc của thiết bị VR cụ thể.

## Ví dụ

Xem [`VRDisplayCapabilities`](/en-US/docs/Web/API/VRDisplayCapabilities#examples) để tham khảo mã ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị sử dụng các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hay một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
