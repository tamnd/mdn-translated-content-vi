---
title: "Navigator: thuộc tính activeVRDisplays"
short-title: activeVRDisplays
slug: Web/API/Navigator/activeVRDisplays
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.Navigator.activeVRDisplays
---

{{APIRef("WebVR API")}}{{SecureContext_Header}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`activeVRDisplays`** của
Giao diện {{domxref("Navigator")}} trả về một mảng chứa mọi
Đối tượng {{domxref("VRDisplay")}} hiện đang hiển thị
({{domxref("VRDisplay.isPresenting")}} là `true`).

> [!LƯU Ý]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Giá trị

Một mảng các đối tượng {{domxref("VRDisplay")}}.

## Ví dụ

```js
function showActive() {
  const displays = navigator.activeVRDisplays;
  for (const display of displays) {
    console.log(`Display ${display.displayId} is active.`);
  }
}
```

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành một tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, bạn nên dựa vào các khung như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/) hoặc [Three.js](https://threejs.org/) hoặc [polyfill](https://github.com/immersive-web/webxr-polyfill) để phát triển các ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Meta's Porting from WebVR to WebXR](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
