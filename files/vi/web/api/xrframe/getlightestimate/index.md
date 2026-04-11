---
title: "XRFrame: phương thức getLightEstimate()"
short-title: getLightEstimate()
slug: Web/API/XRFrame/getLightEstimate
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRFrame.getLightEstimate
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`getLightEstimate()`** của giao diện {{domxref("XRFrame")}} trả về một đối tượng {{domxref("XRLightEstimate")}} chứa các giá trị ánh sáng ước tính cho một {{domxref("XRLightProbe")}} cho trước.

## Cú pháp

```js-nolint
getLightEstimate(lightProbe)
```

### Tham số

- `lightProbe`
  - : Một đối tượng {{domxref("XRLightProbe")}} chứa trạng thái ánh sáng hiện tại của khung.

### Giá trị trả về

Một đối tượng {{domxref("XRLightEstimate")}} hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu thiết bị không thể ước tính ánh sáng cho khung này.

## Ví dụ

### Lấy ước tính ánh sáng cho từng khung

Với {{domxref("XRLightProbe")}} của một phiên, phương thức `getLightEstimate()` lấy đối tượng {{domxref("XRLightEstimate")}} chứa các giá trị ánh sáng cho từng khung.

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

- {{domxref("XRLightEstimate")}}
- {{domxref("XRLightProbe")}}
