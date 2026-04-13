---
title: "XRSession: thuộc tính preferredReflectionFormat"
short-title: preferredReflectionFormat
slug: Web/API/XRSession/preferredReflectionFormat
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRSession.preferredReflectionFormat
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`preferredReflectionFormat`** của giao diện {{DOMxRef("XRSession")}} trả về định dạng phản chiếu ưa thích của phiên này được sử dụng cho dữ liệu texture ước tính ánh sáng.

## Giá trị

Một chuỗi biểu diễn định dạng phản chiếu. Các giá trị có thể:

| XRReflectionFormat | WebGL Format | WebGL Internal Format | WebGPU Format     | HDR |
| ------------------ | ------------ | --------------------- | ----------------- | --- |
| "srgba8"           | RGBA         | SRGB8_ALPHA8          | "rgba8unorm-srgb" |     |
| "rgba16f"          | RGBA         | RGBA16F               | "rgba16float"     | ✓   |

## Ví dụ

### Yêu cầu một light probe với định dạng ưa thích của hệ thống

Bạn có thể yêu cầu một light probe bằng {{domxref("XRSession.requestLightProbe()")}} và chỉ định định dạng ưa thích của hệ thống bằng cách đặt tùy chọn `reflectionFormat` bằng `XRSession.preferredReflectionFormat`.

```js
const lightProbe = await xrSession.requestLightProbe({
  reflectionFormat: xrSession.preferredReflectionFormat,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSession.requestLightProbe()")}}
