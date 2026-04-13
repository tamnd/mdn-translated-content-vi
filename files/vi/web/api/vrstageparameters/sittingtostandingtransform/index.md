---
title: "VRStageParameters: thuộc tính sittingToStandingTransform"
short-title: sittingToStandingTransform
slug: Web/API/VRStageParameters/sittingToStandingTransform
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRStageParameters.sittingToStandingTransform
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`sittingToStandingTransform`** của giao diện {{domxref("VRStageParameters")}} chứa ma trận biến đổi các ma trận nhìn trong không gian ngồi của {{domxref("VRFrameData")}} sang không gian đứng.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Về cơ bản, đây có thể được truyền vào mã WebGL của bạn để biến đổi chế độ xem được render từ tư thế ngồi sang tư thế đứng.

## Giá trị

Một {{jsxref("Float32Array")}} gồm 16 phần tử chứa các thành phần của ma trận biến đổi 4×4.

## Ví dụ

Xem [`VRStageParameters`](/en-US/docs/Web/API/VRStageParameters#examples) để biết mã ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
