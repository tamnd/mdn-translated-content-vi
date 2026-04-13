---
title: "XRTransientInputHitTestResult: thuộc tính results"
short-title: results
slug: Web/API/XRTransientInputHitTestResult/results
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRTransientInputHitTestResult.results
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính _chỉ đọc_ **`results`** của giao diện {{DOMxRef("XRTransientInputHitTestResult")}} đại diện cho một mảng các đối tượng {{domxref("XRHitTestResult")}} chứa kết quả kiểm tra va chạm cho nguồn đầu vào, được sắp xếp theo khoảng cách dọc theo tia được sử dụng để thực hiện kiểm tra va chạm, với kết quả gần nhất ở vị trí 0.

## Giá trị

Một mảng các đối tượng {{domxref("XRHitTestResult")}}.

## Ví dụ

### Truy cập kết quả kiểm tra va chạm đầu vào tạm thời

Hai mảng được sử dụng để truy cập kết quả kiểm tra va chạm đầu vào tạm thời. Đầu tiên, bạn lấy một mảng các đối tượng `XRTransientInputHitTestResult` bằng cách gọi {{domxref("XRFrame.getHitTestResultsForTransientInput()")}}. Thứ hai, để truy cập các đối tượng {{domxref("XRHitTestResult")}} thực sự cho một nguồn đầu vào, bạn tham chiếu thuộc tính `results` trên một trong các đối tượng `XRTransientInputHitTestResult`.

```js
// frame loop
function onXRFrame(time, xrFrame) {
  let hitTestResults = xrFrame.getHitTestResultsForTransientInput(
    transientHitTestSource,
  );

  hitTestResults.forEach((resultsPerInputSource) => {
    resultsPerInputSource.results.forEach((hitTest) => {
      // do something with the hit test
      hitTest.getPose(referenceSpace);
    });
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRHitTestResult")}}
