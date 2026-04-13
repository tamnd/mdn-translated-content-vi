---
title: "XRFrame: phương thức getHitTestResultsForTransientInput()"
short-title: getHitTestResultsForTransientInput()
slug: Web/API/XRFrame/getHitTestResultsForTransientInput
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRFrame.getHitTestResultsForTransientInput
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`getHitTestResultsForTransientInput()`** của giao diện {{domxref("XRFrame")}} trả về một mảng các đối tượng {{domxref("XRTransientInputHitTestResult")}} chứa kết quả kiểm tra va chạm đầu vào tạm thời cho một {{domxref("XRTransientInputHitTestSource")}} cho trước.

## Cú pháp

```js-nolint
getHitTestResultsForTransientInput(hitTestSource)
```

### Tham số

- `hitTestSource`
  - : Một đối tượng {{domxref("XRTransientInputHitTestSource")}} chứa các đăng ký kiểm tra va chạm đầu vào tạm thời.

### Giá trị trả về

Một mảng các đối tượng {{domxref("XRTransientInputHitTestResult")}}.

## Ví dụ

### Lấy kết quả kiểm tra va chạm đầu vào tạm thời

Để yêu cầu nguồn kiểm tra va chạm đầu vào tạm thời, hãy bắt đầu một {{domxref("XRSession")}} với tính năng phiên `hit-test` được bật. Tiếp theo, yêu cầu nguồn kiểm tra va chạm bằng {{domxref("XRSession.requestHitTestSourceForTransientInput()")}} và lưu lại để sử dụng trong vòng lặp khung. Cuối cùng, gọi `getHitTestResultsForTransientInput()` để lấy kết quả.

```js
const xrSession = navigator.xr.requestSession("immersive-ar", {
  requiredFeatures: ["local", "hit-test"],
});

let transientHitTestSource = null;
xrSession
  .requestHitTestSourceForTransientInput({
    profile: "generic-touchscreen",
    offsetRay: new XRRay(),
  })
  .then((touchScreenHitTestSource) => {
    transientHitTestSource = touchScreenHitTestSource;
  });

// frame loop
function onXRFrame(time, xrFrame) {
  let hitTestResults = xrFrame.getHitTestResultsForTransientInput(
    transientHitTestSource,
  );
  // do things with the transient hit test results
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRTransientInputHitTestResult")}}
- {{domxref("XRTransientInputHitTestSource")}}
- {{domxref("XRRay")}}
