---
title: "VRDisplayCapabilities: hasExternalDisplay property"
short-title: hasExternalDisplay
slug: Web/API/VRDisplayCapabilities/hasExternalDisplay
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplayCapabilities.hasExternalDisplay
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

> [!NOTE]
> Thuộc tính này là một phần của WebVR API cũ [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/). Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Thuộc tính chỉ đọc **`hasExternalDisplay`** của giao diện {{domxref("VRDisplayCapabilities")}} trả về `true` nếu màn hình VR tách biệt với màn hình chính của thiết bị.

> [!NOTE]
> Nếu việc trình bày nội dung VR sẽ che khuất nội dung khác trên thiết bị, điều này sẽ trả về `false`, trong trường hợp đó ứng dụng không nên cố gắng phản chiếu nội dung VR hoặc cập nhật giao diện người dùng không phải VR vì nội dung đó sẽ không hiển thị.

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
