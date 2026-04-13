---
title: XRLightEstimate
slug: Web/API/XRLightEstimate
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRLightEstimate
---

{{APIRef("WebXR Device API")}} {{secureContext_header}}{{SeeCompatTable}}

Giao diện **`XRLightEstimate`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) cung cấp các giá trị ánh sáng ước tính cho một {{domxref("XRLightProbe")}} tại thời điểm được đại diện bởi một {{domxref("XRFrame")}}.

Để lấy đối tượng `XRLightEstimate`, hãy gọi phương thức {{domxref("XRFrame.getLightEstimate()")}}.

## Thuộc tính phiên bản

- {{domxref("XRLightEstimate.primaryLightDirection")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("DOMPointReadOnly")}} đại diện cho hướng đến nguồn sáng chính từ `probeSpace` của {{domxref("XRLightProbe")}}.
- {{domxref("XRLightEstimate.primaryLightIntensity")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("DOMPointReadOnly")}} (với các giá trị `x`, `y`, `z` được ánh xạ đến RGB) đại diện cho cường độ của nguồn sáng chính từ `probeSpace` của {{domxref("XRLightProbe")}}.
- {{domxref("XRLightEstimate.sphericalHarmonicsCoefficients")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{jsxref("Float32Array")}} chứa 9 hệ số hài cầu.

## Phương thức phiên bản

Không có.

## Ví dụ

### Lấy đối tượng `XRLightProbe`

Đầu tiên, sử dụng phương thức {{domxref("XRSession.requestLightProbe()")}} để lấy bộ thăm dò ánh sáng từ một phiên.
Sau đó, trong vòng lặp {{domxref("XRFrame")}}, phương thức {{domxref("XRFrame.getLightEstimate", "getLightEstimate()")}} sẽ trả về một đối tượng `XRLightEstimate` chứa các giá trị ánh sáng cho mỗi khung hình.

```js
const lightProbe = await xrSession.requestLightProbe();

// frame loop
function onXRFrame(time, xrFrame) {
  let lightEstimate = xrFrame.getLightEstimate(lightProbe);

  // Use light estimate data to light the scene

  // Available properties
  lightEstimate.sphericalHarmonicsCoefficients;
  lightEstimate.primaryLightDirection;
  lightEstimate.primaryLightIntensity;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRFrame.getLightEstimate()")}}
