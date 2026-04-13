---
title: "VRDisplay: phương thức getImmediatePose()"
short-title: getImmediatePose()
slug: Web/API/VRDisplay/getImmediatePose
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.getImmediatePose
---

{{Deprecated_Header}}{{APIRef("WebVR API")}}{{Non-standard_Header}}

Phương thức **`getImmediatePose()`** của giao diện {{domxref("VRDisplay")}} trả về một đối tượng {{domxref("VRPose")}} xác định tư thế hiện tại của `VRDisplay`, không có dự đoán nào được áp dụng.

> [!NOTE]
> Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Cú pháp

```js-nolint
getImmediatePose()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("VRPose")}}.

## Thông số kỹ thuật

Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị sử dụng các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hay một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
