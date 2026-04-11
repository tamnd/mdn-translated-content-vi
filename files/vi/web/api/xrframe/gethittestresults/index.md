---
title: "XRFrame: phương thức getHitTestResults()"
short-title: getHitTestResults()
slug: Web/API/XRFrame/getHitTestResults
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRFrame.getHitTestResults
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`getHitTestResults()`** của giao diện {{domxref("XRFrame")}} trả về một mảng các đối tượng {{domxref("XRHitTestResult")}} chứa kết quả kiểm tra va chạm cho một {{domxref("XRHitTestSource")}} cho trước.

## Cú pháp

```js-nolint
getHitTestResults(hitTestSource)
```

### Tham số

- `hitTestSource`
  - : Một đối tượng {{domxref("XRHitTestSource")}} chứa các đăng ký kiểm tra va chạm.

### Giá trị trả về

Một mảng các đối tượng {{domxref("XRHitTestResult")}}.

## Ví dụ

### Lấy kết quả kiểm tra va chạm

Để yêu cầu nguồn kiểm tra va chạm, hãy bắt đầu một {{domxref("XRSession")}} với tính năng phiên `hit-test` được bật. Tiếp theo, yêu cầu nguồn kiểm tra va chạm bằng {{domxref("XRSession.requestHitTestSource()")}} và lưu lại để sử dụng trong vòng lặp khung. Cuối cùng, gọi `getHitTestResults()` để lấy kết quả.

```js
const xrSession = navigator.xr.requestSession("immersive-ar", {
  requiredFeatures: ["local", "hit-test"],
});
let hitTestSource = null;
xrSession
  .requestHitTestSource({
    space: viewerSpace, // obtained from xrSession.requestReferenceSpace("viewer");
    offsetRay: new XRRay({ y: 0.5 }),
  })
  .then((viewerHitTestSource) => {
    hitTestSource = viewerHitTestSource;
  });
// frame loop
function onXRFrame(time, xrFrame) {
  let hitTestResults = xrFrame.getHitTestResults(hitTestSource);
  // do things with the hit test results
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRHitTestResult")}}
- {{domxref("XRHitTestSource")}}
- {{domxref("XRRay")}}
