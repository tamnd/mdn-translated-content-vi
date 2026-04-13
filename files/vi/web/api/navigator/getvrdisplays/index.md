---
title: "Navigator: phương thức getVRDisplays()"
short-title: getVRDisplays()
slug: Web/API/Navigator/getVRDisplays
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.Navigator.getVRDisplays
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`getVRDisplays()`** của giao diện {{domxref("Navigator")}} trả về một lời hứa phân giải thành một mảng các đối tượng {{domxref("VRDisplay")}} đại diện cho mọi màn hình VR có sẵn được kết nối với máy tính.

## Cú pháp

```js-nolint
getVRDisplays()
```

### Thông số

Không có.

### Giá trị trả về

Một lời hứa phân giải thành một mảng đối tượng {{domxref("VRDisplay")}}.

## Ví dụ

Xem [`VRDisplay`](/en-US/docs/Web/API/VRDisplay#examples) để biết mã ví dụ.

## Thông số kỹ thuật

Phương pháp này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành một tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, bạn nên dựa vào các khung như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/) hoặc [Three.js](https://threejs.org/) hoặc [polyfill](https://github.com/immersive-web/webxr-polyfill) để phát triển các ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Meta's Porting from WebVR to WebXR](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API homepage](/en-US/docs/Web/API/WebVR_API)
