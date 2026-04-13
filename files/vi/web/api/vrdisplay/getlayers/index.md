---
title: "VRDisplay: phương thức getLayers()"
short-title: getLayers()
slug: Web/API/VRDisplay/getLayers
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.getLayers
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`getLayers()`** của giao diện {{domxref("VRDisplay")}} trả về các lớp hiện đang được `VRDisplay` trình chiếu.

> [!NOTE]
> Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Cú pháp

```js-nolint
getLayers()
```

### Tham số

Không có.

### Giá trị trả về

Nếu {{domxref("VRDisplay")}} đang trình chiếu, phương thức này trả về một mảng các đối tượng {{domxref("VRLayerInit")}} hiện đang được trình chiếu (hiện tại sẽ là một, vì {{domxref("VRDisplayCapabilities.maxLayers")}} luôn là 1). Nếu {{domxref("VRDisplay")}} không đang trình chiếu, phương thức này trả về một mảng rỗng.

## Ví dụ

Xem [`VRLayerInit`](/en-US/docs/Web/API/VRLayerInit#examples) để tham khảo mã ví dụ.

## Thông số kỹ thuật

Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị sử dụng các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hay một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
