---
title: "VREyeParameters: offset property"
short-title: offset
slug: Web/API/VREyeParameters/offset
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VREyeParameters.offset
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`offset`** của giao diện {{domxref("VREyeParameters")}} đại diện cho độ lệch từ điểm trung tâm giữa hai mắt của người dùng đến trung tâm của mắt, tính bằng mét.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Giá trị này nên đại diện cho một nửa khoảng cách đồng tử (IPD) của người dùng, nhưng cũng có thể đại diện cho khoảng cách từ điểm trung tâm của tai nghe đến điểm trung tâm của thấu kính cho mắt đó.

## Giá trị

Một {{jsxref("Float32Array")}} đại diện cho vectơ mô tả độ lệch từ điểm trung tâm giữa hai mắt của người dùng đến trung tâm của mắt tính bằng mét.

> [!NOTE]
> Các giá trị cho mắt trái sẽ âm; các giá trị cho mắt phải sẽ dương.

## Ví dụ

Xem [`VRFieldOfView`](/en-US/docs/Web/API/VRFieldOfView#examples) để xem mã ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn theo lộ trình trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt. Đọc hướng dẫn [Meta's Porting from WebVR to WebXR](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
