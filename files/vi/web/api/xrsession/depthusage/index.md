---
title: "XRSession: thuộc tính depthUsage"
short-title: depthUsage
slug: Web/API/XRSession/depthUsage
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRSession.depthUsage
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`depthUsage`** của một {{DOMxRef("XRSession")}} `immersive-ar` mô tả cách sử dụng cảm biến độ sâu nào được dùng.

## Giá trị

Thuộc tính này có thể trả về các giá trị sau:

- `cpu-optimized`
  - : Dữ liệu độ sâu được thiết kế để sử dụng trên CPU; xem giao diện {{domxref("XRCPUDepthInformation")}}.
- `gpu-optimized`
  - : Dữ liệu độ sâu được thiết kế để sử dụng trên GPU; xem giao diện {{domxref("XRWebGLDepthInformation")}}.

## Ví dụ

Để yêu cầu phương thức sử dụng mong muốn, bạn cần chỉ định `usagePreference` khi yêu cầu một phiên bằng {{domxref("XRSystem.requestSession()")}}. Ở đây, người gọi có thể xử lý cả cách sử dụng tối ưu CPU và GPU. Thứ tự thể hiện ưu tiên cho CPU:

```js
navigator.xr.requestSession("immersive-ar", {
  requiredFeatures: ["depth-sensing"],
  depthSensing: {
    usagePreference: ["cpu-optimized", "gpu-optimized"],
    formatPreference: ["luminance-alpha", "float32"],
  },
});
```

Để kiểm tra cách sử dụng nào đã được chọn bởi tác nhân người dùng, bạn có thể gọi thuộc tính `depthUsage`:

```js
console.log(session.depthUsage); // either "cpu-optimized" or "gpu-optimized"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
