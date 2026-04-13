---
title: "VRDisplay: thuộc tính stageParameters"
short-title: stageParameters
slug: Web/API/VRDisplay/stageParameters
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.stageParameters
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`stageParameters`** của giao diện {{domxref("VRDisplay")}} trả về một đối tượng {{domxref("VRStageParameters")}} chứa các tham số quy mô phòng, nếu `VRDisplay` có khả năng hỗ trợ trải nghiệm quy mô phòng.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Giá trị

Đối tượng {{domxref("VRStageParameters")}} chứa các tham số quy mô phòng của `VRDisplay`, hoặc `null` nếu `VRDisplay` không có khả năng hỗ trợ trải nghiệm quy mô phòng.

## Ví dụ

Xem [`VRStageParameters`](/en-US/docs/Web/API/VRStageParameters#examples) để tham khảo mã ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị sử dụng các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hay một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
