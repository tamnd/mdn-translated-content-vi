---
title: "XRLightEstimate: thuộc tính sphericalHarmonicsCoefficients"
short-title: sphericalHarmonicsCoefficients
slug: Web/API/XRLightEstimate/sphericalHarmonicsCoefficients
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRLightEstimate.sphericalHarmonicsCoefficients
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`sphericalHarmonicsCoefficients`** của giao diện {{DOMxRef("XRLightEstimate")}} trả về một {{jsxref("Float32Array")}} chứa 9 hệ số hài cầu.

Ánh sáng hài cầu là kỹ thuật sử dụng các hàm hình cầu thay vì các phương trình ánh sáng tiêu chuẩn. Xem [Wikipedia](https://en.wikipedia.org/wiki/Spherical_harmonic_lighting) để biết thêm thông tin.

## Giá trị

Một {{jsxref("Float32Array")}} chứa 9 hệ số hài cầu. Mảng chứa tổng cộng 27 phần tử, với mỗi 3 phần tử định nghĩa các thành phần đỏ, xanh lục và xanh lam cho mỗi hệ số.

Ba phần tử đầu tiên phải là thành phần ước tính ánh sáng hợp lệ; phần còn lại có thể là 0 do cài đặt quyền riêng tư hoặc giới hạn của thiết bị để cung cấp thêm dữ liệu.

## Ví dụ

Trong vòng lặp {{domxref("XRFrame")}}, bạn có thể sử dụng thuộc tính `sphericalHarmonicsCoefficients` để chiếu sáng cảnh.

```js
const lightProbe = await xrSession.requestLightProbe();

// frame loop
function onXRFrame(time, xrFrame) {
  let lightEstimate = xrFrame.getLightEstimate(lightProbe);

  // Render lights using lightEstimate.sphericalHarmonicsCoefficients
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRFrame.getLightEstimate()")}}
