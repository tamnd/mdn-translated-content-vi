---
title: "XRInputSource: hand property"
short-title: hand
slug: Web/API/XRInputSource/hand
page-type: web-api-instance-property
browser-compat: api.XRInputSource.hand
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`hand`** của giao diện {{domxref("XRInputSource")}} là một đối tượng {{domxref("XRHand")}} cung cấp quyền truy cập vào thiết bị theo dõi tay.

## Giá trị

Một đối tượng {{domxref("XRHand")}} hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu {{domxref("XRSession")}} chưa được [yêu cầu](/en-US/docs/Web/API/XRSystem/requestSession) với feature descriptor `hand-tracking`.

## Ví dụ

```js
navigator.xr
  .requestSession({ optionalFeatures: ["hand-tracking"] })
  .then(/* … */);

function renderFrame(session, frame) {
  // …

  for (const inputSource of session.inputSources) {
    if (inputSource.hand) {
      // render a hand model, perform gesture detection, etc.
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
