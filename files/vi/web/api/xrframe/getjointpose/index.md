---
title: "XRFrame: phương thức getJointPose()"
short-title: getJointPose()
slug: Web/API/XRFrame/getJointPose
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRFrame.getJointPose
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`getJointPose()`** của giao diện {{domxref("XRFrame")}} trả về một đối tượng {{domxref("XRJointPose")}} cung cấp tư thế của một khớp tay (xem {{domxref("XRHand")}}) tương đối với không gian cơ sở cho trước.

## Cú pháp

```js-nolint
getJointPose(joint, baseSpace)
```

### Tham số

- `joint`
  - : Một {{domxref("XRJointSpace")}} chỉ định không gian khớp tay để lấy {{domxref("XRJointPose")}} mô tả vị trí và hướng của mục.
- `baseSpace`
  - : Một {{domxref("XRSpace")}} được dùng làm cơ sở hoặc gốc tọa độ cho vị trí và hướng tương đối.

### Giá trị trả về

Một đối tượng {{domxref("XRJointPose")}} chỉ định vị trí và hướng của khớp tay, tương đối với {{domxref("XRSpace")}} được chỉ định bởi `baseSpace`.

## Ví dụ

### Sử dụng `getJointPose()`

Gọi `getJointPose()` với một {{domxref("XRJointSpace")}} và một {{domxref("XRReferenceSpace")}} để nhận đối tượng {{domxref("XRJointPose")}}.

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
- {{domxref("XRJointSpace")}}
- {{domxref("XRSpace")}}
