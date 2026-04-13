---
title: "XRJointPose: thuộc tính radius"
short-title: radius
slug: Web/API/XRJointPose/radius
page-type: web-api-instance-property
browser-compat: api.XRJointPose.radius
---

{{APIRef("WebXR Device API")}}

Thuộc tính chỉ đọc **`radius`** của giao diện {{domxref("XRJointPose")}} cho biết bán kính (khoảng cách từ da) của khớp.

## Giá trị

Một số cho biết bán kính tính bằng mét.

## Ví dụ

### Lấy `radius` cho khớp bàn tay

Gọi {{domxref("XRFrame.getJointPose()")}} với một {{domxref("XRJointSpace")}} và một {{domxref("XRReferenceSpace")}} để lấy đối tượng `XRJointPose` cung cấp thuộc tính radius.

```js
navigator.xr
  .requestSession({ optionalFeatures: ["hand-tracking"] })
  .then(/** … */);

function renderFrame(session, frame) {
  // …

  for (const inputSource of session.inputSources) {
    if (inputSource.hand) {
      const indexFingerTipJoint = inputSource.hand.get("index-finger-tip");
      const radius = frame.getJointPose(
        indexFingerTipJoint,
        referenceSpace,
      ).radius;
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
