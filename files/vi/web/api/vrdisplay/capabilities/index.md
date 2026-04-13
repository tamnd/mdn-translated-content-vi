---
title: "VRDisplay: capabilities property"
short-title: capabilities
slug: Web/API/VRDisplay/capabilities
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.capabilities
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`capabilities`** của giao diện {{domxref("VRDisplay")}} trả về đối tượng {{domxref("VRDisplayCapabilities")}} cho biết các khả năng khác nhau của `VRDisplay`.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Giá trị

Một đối tượng {{domxref("VRDisplayCapabilities")}}.

## Ví dụ

Xem [`VRDisplayCapabilities`](/en-US/docs/Web/API/VRDisplayCapabilities#examples) để biết mã ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, nên dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/) hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển các ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
