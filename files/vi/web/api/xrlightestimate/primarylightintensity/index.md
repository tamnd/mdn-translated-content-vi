---
title: "XRLightEstimate: thuộc tính primaryLightIntensity"
short-title: primaryLightIntensity
slug: Web/API/XRLightEstimate/primaryLightIntensity
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRLightEstimate.primaryLightIntensity
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`primaryLightIntensity`** của giao diện {{DOMxRef("XRLightEstimate")}} trả về một {{domxref("DOMPointReadOnly")}} đại diện cho cường độ của nguồn sáng chính từ `probeSpace` của {{domxref("XRLightProbe")}}.

## Giá trị

Một đối tượng {{domxref("DOMPointReadOnly")}} trong đó giá trị RGB được ánh xạ đến các giá trị `x`, `y` và `z`. Giá trị `w` luôn là `1.0`. Nếu không có giá trị ước tính nào từ môi trường của người dùng, điểm sẽ là `{x: 0.0, y: 0.0, z: 0.0, w: 1.0}`, đại diện cho không có ánh sáng.

## Ví dụ

Trong vòng lặp {{domxref("XRFrame")}}, bạn có thể sử dụng các thuộc tính `primaryLightDirection` và `primaryLightIntensity` để render bóng dựa trên nguồn sáng nổi bật nhất, ví dụ.

```js
const lightProbe = await xrSession.requestLightProbe();

// frame loop
function onXRFrame(time, xrFrame) {
  let lightEstimate = xrFrame.getLightEstimate(lightProbe);

  // Render lights

  // Available properties
  lightEstimate.primaryLightDirection;
  lightEstimate.primaryLightIntensity;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRLightEstimate.primaryLightDirection")}}
- {{domxref("XRLightProbe.probeSpace")}}
