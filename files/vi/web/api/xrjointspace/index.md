---
title: XRJointSpace
slug: Web/API/XRJointSpace
page-type: web-api-interface
browser-compat: api.XRJointSpace
---

{{APIRef("WebXR Device API")}}

Giao diện **`XRJointSpace`** là một {{domxref("XRSpace")}} đại diện cho vị trí và hướng của một khớp {{domxref("XRHand")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("XRJointSpace.jointName")}} {{ReadOnlyInline}}
  - : Tên của khớp được theo dõi. Xem {{domxref("XRHand")}} để biết các tên khớp bàn tay có thể có.

## Ví dụ

### Sử dụng các đối tượng `XRJointSpace`

Bạn có thể dùng đối tượng `XRJointSpace` cùng với {{domxref("XRReferenceSpace")}} để lấy {{domxref("XRJointPose")}} bằng cách gọi {{domxref("XRFrame.getJointPose()")}}.

```js
navigator.xr
  .requestSession({ optionalFeatures: ["hand-tracking"] })
  .then(/** … */);

function renderFrame(session, frame) {
  // …

  for (const inputSource of session.inputSources) {
    if (inputSource.hand) {
      const indexFingerTipJoint = inputSource.hand.get("index-finger-tip"); // XRJointSpace
      indexFingerTipJoint.jointName; // "index-finger-tip"
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
- {{domxref("XRJointPose")}}
- {{domxref("XRFrame.getJointPose()")}}
