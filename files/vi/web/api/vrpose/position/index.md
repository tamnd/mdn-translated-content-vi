---
title: "VRPose: position property"
short-title: position
slug: Web/API/VRPose/position
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRPose.position
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`position`** của giao diện {{domxref("VRPose")}} trả về vị trí của {{domxref("VRDisplay")}} tại dấu thời gian hiện tại dưới dạng vectơ 3D.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Hệ tọa độ như sau:

- Dương X là bên phải người dùng.
- Dương Y là hướng lên.
- Dương Z là phía sau người dùng.

Vị trí được đo bằng mét từ một điểm gốc, điểm này là vị trí cảm biến được đọc lần đầu tiên, hoặc vị trí của cảm biến tại thời điểm {{domxref("VRDisplay.resetPose()")}} được gọi lần cuối.

> [!NOTE]
> Theo mặc định, tất cả các vị trí được cho dưới dạng vị trí không gian ngồi. Biến đổi điểm này với {{domxref("VRStageParameters.sittingToStandingTransform")}} khi bạn đang làm việc với màn hình phòng chẳng hạn, sẽ chuyển đổi điểm này thành vị trí không gian đứng.

## Giá trị

Một {{jsxref("Float32Array")}}, hoặc null nếu cảm biến VR không thể cung cấp dữ liệu vị trí.

> [!NOTE]
> Tác nhân người dùng có thể cung cấp các giá trị vị trí được mô phỏng thông qua các kỹ thuật như mô hình hóa cổ; khi làm như vậy, họ vẫn nên báo cáo {{domxref("VRDisplayCapabilities.hasPosition")}} là false.

## Ví dụ

Xem [`VRDisplay.getFrameData()`](/en-US/docs/Web/API/VRDisplay/getFrameData#examples) để xem mã ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn theo lộ trình trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt. Đọc hướng dẫn [Meta's Porting from WebVR to WebXR](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
