---
title: "VRFrameData: leftProjectionMatrix property"
short-title: leftProjectionMatrix
slug: Web/API/VRFrameData/leftProjectionMatrix
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRFrameData.leftProjectionMatrix
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`leftProjectionMatrix`** của giao diện {{domxref("VRFrameData")}} trả về một {{jsxref("Float32Array")}} đại diện cho ma trận 4x4 mô tả phép chiếu dùng để kết xuất mắt trái.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Giá trị này có thể được truyền trực tiếp vào hàm {{domxref("WebGLRenderingContext.uniformMatrix", "uniformMatrix4fv")}} của WebGL.

> [!WARNING]
> Rất khuyến cáo các ứng dụng sử dụng ma trận này mà không sửa đổi. Không sử dụng ma trận chiếu này khi kết xuất có thể làm cho khung hình bị méo hoặc lệch, gây ra mức độ khó chịu khác nhau cho người dùng.

## Giá trị

Một đối tượng {{jsxref("Float32Array")}}.

## Ví dụ

Xem [`VRDisplay.getFrameData()`](/en-US/docs/Web/API/VRDisplay/getFrameData#examples) để biết mã ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt triển khai các [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, bạn nên dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
