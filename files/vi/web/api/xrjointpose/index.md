---
title: XRJointPose
slug: Web/API/XRJointPose
page-type: web-api-interface
browser-compat: api.XRJointPose
---

{{APIRef("WebXR Device API")}}

Giao diện **`XRJointPose`** là một {{domxref("XRPose")}} có thêm thông tin về kích thước của khớp xương mà nó đại diện.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("XRJointPose.radius")}} {{ReadOnlyInline}}
  - : Bán kính (khoảng cách từ da) của khớp.

## Ví dụ

### Sử dụng các đối tượng `XRJointPose`

Gọi {{domxref("XRFrame.getJointPose()")}} với một {{domxref("XRJointSpace")}} và một {{domxref("XRReferenceSpace")}} để lấy đối tượng `XRJointPose`.

```js
navigator.xr
  .requestSession({ optionalFeatures: ["hand-tracking"] })
  .then(/* … */);

function renderFrame(session, frame) {
  // …

  for (const inputSource of session.inputSources) {
    if (inputSource.hand) {
      const indexFingerTipJoint = inputSource.hand.get("index-finger-tip");
      frame.getJointPose(indexFingerTipJoint, referenceSpace); // XRJointPose
    }
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRHand")}}
- {{domxref("XRReferenceSpace")}}
- {{domxref("XRJointSpace")}}
- {{domxref("XRFrame.getJointPose()")}}
