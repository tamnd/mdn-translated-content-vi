---
title: XRTransientInputHitTestResult
slug: Web/API/XRTransientInputHitTestResult
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRTransientInputHitTestResult
---

{{APIRef("WebXR Device API")}} {{secureContext_header}}{{SeeCompatTable}}

Giao diện **`XRTransientInputHitTestResult`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) chứa một mảng kết quả kiểm tra va chạm (hit test) cho đầu vào tạm thời, được nhóm theo nguồn đầu vào.

Bạn có thể lấy một mảng các đối tượng `XRHitTestResult` cho một khung bằng cách gọi {{domxref("XRFrame.getHitTestResultsForTransientInput()")}}.

## Thuộc tính phiên bản

- {{domxref("XRTransientInputHitTestResult.inputSource")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Đại diện cho {{domxref("XRInputSource")}} đã được sử dụng để tính toán mảng `results`.
- {{domxref("XRTransientInputHitTestResult.results")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Đại diện cho một mảng các đối tượng {{domxref("XRHitTestResult")}} chứa kết quả kiểm tra va chạm cho nguồn đầu vào, được sắp xếp theo khoảng cách dọc theo tia được sử dụng để thực hiện kiểm tra va chạm, với kết quả gần nhất ở vị trí 0.

## Phương thức phiên bản

Không có.

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

### Lọc nguồn đầu vào

Thuộc tính {{domxref("XRTransientInputHitTestResult.inputSource", "inputSource")}} cho phép bạn lọc kết quả kiểm tra va chạm theo nguồn đầu vào.

```js
// frame loop
function onXRFrame(time, xrFrame) {
  let hitTestResults = xrFrame.getHitTestResultsForTransientInput(
    transientHitTestSource,
  );

  hitTestResults.forEach((resultsPerInputSource) => {
    if (resultsPerInputSource.inputSource === myPreferredInputSource) {
      // act on hit test results from the preferred input source
    }
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRHitTestResult")}}
- {{domxref("XRInputSource")}}
