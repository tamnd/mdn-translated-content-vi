---
title: "XRLightEstimate: thuộc tính primaryLightDirection"
short-title: primaryLightDirection
slug: Web/API/XRLightEstimate/primaryLightDirection
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRLightEstimate.primaryLightDirection
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`primaryLightDirection`** của giao diện {{DOMxRef("XRLightEstimate")}} trả về một {{domxref("DOMPointReadOnly")}} đại diện cho hướng đến nguồn sáng chính từ `probeSpace` của {{domxref("XRLightProbe")}}.

## Giá trị

Một đối tượng {{domxref("DOMPointReadOnly")}}. Nếu không có giá trị ước tính nào từ môi trường của người dùng, điểm sẽ là `{ x: 0.0, y: 1.0, z: 0.0, w: 0.0 }`, đại diện cho ánh sáng chiếu thẳng xuống từ trên cao.

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

- {{domxref("XRLightEstimate.primaryLightIntensity")}}
- {{domxref("XRLightProbe.probeSpace")}}
