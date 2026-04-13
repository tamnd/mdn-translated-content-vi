---
title: "VRFrameData: VRFrameData() constructor"
short-title: VRFrameData()
slug: Web/API/VRFrameData/VRFrameData
page-type: web-api-constructor
status:
  - deprecated
  - non-standard
browser-compat: api.VRFrameData.VRFrameData
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Hàm khởi tạo **`VRFrameData()`** tạo một đối tượng {{domxref("VRFrameData")}}.

> [!NOTE]
> Hàm khởi tạo này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Cú pháp

```js-nolint
new VRFrameData()
```

### Tham số

Không có.

## Ví dụ

Xem [`VRDisplay.getFrameData()`](/en-US/docs/Web/API/VRDisplay/getFrameData#examples) để biết mã ví dụ.

## Thông số kỹ thuật

Hàm khởi tạo này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt triển khai các [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, bạn nên dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
