---
title: XRHitTestResult
slug: Web/API/XRHitTestResult
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRHitTestResult
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Giao diện **`XRHitTestResult`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) chứa một kết quả duy nhất của một kiểm tra va chạm. Bạn có thể lấy một mảng các đối tượng `XRHitTestResult` cho một khung bằng cách gọi {{domxref("XRFrame.getHitTestResults()")}}.

## Thuộc tính phiên bản

Không có.

## Phương thức phiên bản

- {{domxref("XRHitTestResult.createAnchor()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một {{domxref("XRAnchor")}} được tạo từ kết quả kiểm tra va chạm.
- {{domxref("XRHitTestResult.getPose()")}} {{Experimental_Inline}}
  - : Trả về {{domxref("XRPose")}} của kết quả kiểm tra va chạm tương đối với không gian cơ sở cho trước.

## Ví dụ

### Lấy các đối tượng `XRHitTestResult` trong vòng lặp khung

Ngoài việc hiển thị `XRHitTestResult` trong vòng lặp khung, ví dụ này minh họa một số điều bạn phải làm trước khi yêu cầu đối tượng này. Trong khi thiết lập phiên, hãy chỉ định `"hit-test"` là một trong các `requiredFeatures`. Tiếp theo, gọi {{domxref("XRSession.requestHitTestSource()")}} với các tham chiếu mong muốn. (Lấy điều này bằng cách gọi {{domxref("XRSession.requestReferenceSpace()")}}.) Hàm này trả về một {{domxref("XRHitTestSource")}}, cái bạn sẽ sử dụng trong vòng lặp khung để lấy các đối tượng `XRHitTestResult`.

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

### Lấy tư thế của kết quả kiểm tra va chạm

Sử dụng {{domxref("XRHitTestResult.getPose", "getPose()")}} để truy vấn tư thế của kết quả.

```js
let hitTestResults = xrFrame.getHitTestResults(hitTestSource);

if (hitTestResults.length > 0) {
  let pose = hitTestResults[0].getPose(referenceSpace);
}
```

### Tạo một anchor từ kết quả kiểm tra va chạm

Khi bạn tìm thấy các giao điểm trên bề mặt thực tế bằng kiểm tra va chạm, bạn có thể tạo một {{domxref("XRAnchor")}} để đính kèm một đối tượng ảo vào vị trí đó.

```js
hitTestResult.createAnchor().then(
  (anchor) => {
    // add anchored objects to the scene
  },
  (error) => {
    console.error(`Could not create anchor: ${error}`);
  },
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRTransientInputHitTestResult")}}
- {{domxref("XRPose")}}
- {{domxref("XRAnchor")}}
