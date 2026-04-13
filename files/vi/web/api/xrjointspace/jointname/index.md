---
title: "XRJointSpace: thuộc tính jointName"
short-title: jointName
slug: Web/API/XRJointSpace/jointName
page-type: web-api-instance-property
browser-compat: api.XRJointSpace.jointName
---

{{APIRef("WebXR Device API")}}

Thuộc tính chỉ đọc **`jointName`** của giao diện {{domxref("XRJointSpace")}} chứa tên của khớp mà nó theo dõi.

## Giá trị

Một chuỗi cho biết tên của khớp. Xem danh sách các khớp bàn tay trên trang {{domxref("XRHand")}}.

## Ví dụ

### Lấy `jointName`

Với một `XRJointSpace`, thuộc tính `jointName` sẽ chứa tên khớp bàn tay.

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
