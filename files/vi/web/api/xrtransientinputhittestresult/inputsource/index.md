---
title: "XRTransientInputHitTestResult: thuộc tính inputSource"
short-title: inputSource
slug: Web/API/XRTransientInputHitTestResult/inputSource
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRTransientInputHitTestResult.inputSource
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính _chỉ đọc_ **`inputSource`** của giao diện {{DOMxRef("XRTransientInputHitTestResult")}} đại diện cho một đối tượng {{domxref("XRInputSource")}} đã được sử dụng để tính toán mảng {{domxref("XRTransientInputHitTestResult.results", "results")}}.

## Giá trị

Một đối tượng {{domxref("XRInputSource")}}.

## Ví dụ

### Lọc nguồn đầu vào

Thuộc tính `inputSource` cho phép bạn lọc kết quả kiểm tra va chạm theo nguồn đầu vào.

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

- {{domxref("XRInputSource")}}
