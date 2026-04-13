---
title: VRFrameData
slug: Web/API/VRFrameData
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.VRFrameData
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`VRFrameData`** của [WebVR API](/en-US/docs/Web/API/WebVR_API) đại diện cho tất cả thông tin cần thiết để kết xuất một khung hình của cảnh VR; được tạo bởi {{domxref("VRDisplay.getFrameData()")}}.

> [!NOTE]
> Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Hàm khởi tạo

- {{domxref("VRFrameData.VRFrameData", "VRFrameData()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Tạo một đối tượng `VRFrameData`.

## Thuộc tính phiên bản

- {{domxref("VRFrameData.leftProjectionMatrix")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Một {{jsxref("Float32Array")}} đại diện cho ma trận 4x4 mô tả phép chiếu dùng để kết xuất mắt trái.
- {{domxref("VRFrameData.leftViewMatrix")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Một {{jsxref("Float32Array")}} đại diện cho ma trận 4x4 mô tả biến đổi góc nhìn dùng để kết xuất mắt trái.
- {{domxref("VRFrameData.pose")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : {{domxref("VRPose")}} của {{domxref("VRDisplay")}} tại thời điểm {{domxref("VRFrameData.timestamp")}} hiện tại.
- {{domxref("VRFrameData.rightProjectionMatrix")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Một {{jsxref("Float32Array")}} đại diện cho ma trận 4x4 mô tả phép chiếu dùng để kết xuất mắt phải.
- {{domxref("VRFrameData.rightViewMatrix")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Một {{jsxref("Float32Array")}} đại diện cho ma trận 4x4 mô tả biến đổi góc nhìn dùng để kết xuất mắt phải.
- {{domxref("VRFrameData.timestamp")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Giá trị dấu thời gian tăng liên tục, đại diện cho thời điểm cập nhật khung hình xảy ra.

## Ví dụ

Xem [`VRDisplay.getFrameData()`](/en-US/docs/Web/API/VRDisplay/getFrameData#examples) để biết mã ví dụ.

## Thông số kỹ thuật

Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt triển khai các [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, bạn nên dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
