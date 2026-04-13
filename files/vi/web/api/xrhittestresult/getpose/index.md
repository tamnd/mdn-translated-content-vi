---
title: "XRHitTestResult: phương thức getPose()"
short-title: getPose()
slug: Web/API/XRHitTestResult/getPose
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRHitTestResult.getPose
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`getPose()`** của giao diện {{domxref("XRHitTestResult")}} trả về {{domxref("XRPose")}} của kết quả kiểm tra va chạm tương đối với không gian cơ sở cho trước.

## Cú pháp

```js-nolint
getPose(baseSpace)
```

### Tham số

- `baseSpace`
  - : Một {{domxref("XRSpace")}} để sử dụng làm cơ sở hoặc gốc tọa độ cho việc tính toán vị trí và hướng tương đối của kết quả kiểm tra va chạm.

### Giá trị trả về

Trả về một đối tượng {{domxref("XRPose")}}.

## Ví dụ

### Lấy tư thế của kết quả kiểm tra va chạm

Ví dụ sau sử dụng `getPose()` để truy vấn tư thế của một kết quả kiểm tra va chạm duy nhất.

```js
let hitTestResults = xrFrame.getHitTestResults(hitTestSource);

if (hitTestResults.length > 0) {
  let pose = hitTestResults[0].getPose(referenceSpace);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRFrame.getPose()")}}
