---
title: "VREyeParameters: renderWidth property"
short-title: renderWidth
slug: Web/API/VREyeParameters/renderWidth
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VREyeParameters.renderWidth
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`renderWidth`** của giao diện {{domxref("VREyeParameters")}} mô tả chiều rộng render mục tiêu được khuyến nghị cho mỗi viewport mắt, tính bằng pixel.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Giá trị này đã ở đơn vị pixel thiết bị, vì vậy không cần nhân với [Window.devicePixelRatio](/en-US/docs/Web/API/Window/devicePixelRatio) trước khi đặt vào [HTMLCanvasElement.width.](/en-US/docs/Web/API/HTMLCanvasElement/width)

## Giá trị

Số đại diện cho chiều rộng tính bằng pixel.

## Ví dụ

Xem [`VREyeParameters`](/en-US/docs/Web/API/VREyeParameters#examples) để xem mã ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn theo lộ trình trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt. Đọc hướng dẫn [Meta's Porting from WebVR to WebXR](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
