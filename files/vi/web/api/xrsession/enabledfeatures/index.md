---
title: "XRSession: thuộc tính enabledFeatures"
short-title: enabledFeatures
slug: Web/API/XRSession/enabledFeatures
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRSession.enabledFeatures
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`enabledFeatures`** của giao diện {{domxref("XRSession")}} trả về một mảng các tính năng đã được bật (cấp phép) cho một `XRSession`. Điều này chứa tất cả `requiredFeatures` và một tập con của `optionalFeatures` đã được yêu cầu với {{domxref("XRSystem.requestSession()")}}.

## Giá trị

Một {{jsxref("Array")}} các chuỗi.

## Ví dụ

### Phát hiện các tính năng phiên WebXR có sẵn

Phương thức {{domxref("XRSystem.requestSession()")}} cho phép bạn yêu cầu [tính năng phiên](/en-US/docs/Web/API/XRSystem/requestSession#session_features) XR. Các tính năng có thể được yêu cầu dưới dạng `requiredFeatures` (`XRSession` phải hỗ trợ tính năng) hoặc dưới dạng `optionalFeatures` (`XRSession` có thể hỗ trợ tính năng). Thuộc tính `enabledFeatures` xác định những tính năng nào thực sự khả dụng trong phiên.

```js
navigator.xr
  .requestSession("immersive-ar", {
    requiredFeatures: ["local", "hit-test"],
    optionalFeatures: ["anchors"],
  })
  .then((xrSession) => {
    // Log enabledFeatures
    console.log(xrSession.enabledFeatures);

    // Check if anchors can be used
    if (xrSession.enabledFeatures.includes("anchors")) {
      // Go ahead and set up anchors
    }
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSystem.requestSession()")}}
- [Tính năng phiên](/en-US/docs/Web/API/XRSystem/requestSession#session_features)
