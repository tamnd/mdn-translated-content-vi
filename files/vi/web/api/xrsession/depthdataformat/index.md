---
title: "XRSession: thuộc tính depthDataFormat"
short-title: depthDataFormat
slug: Web/API/XRSession/depthDataFormat
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRSession.depthDataFormat
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`depthDataFormat`** của một {{DOMxRef("XRSession")}} `immersive-ar` mô tả định dạng dữ liệu cảm biến độ sâu nào được sử dụng.

## Giá trị

Thuộc tính này có thể trả về các giá trị sau:

- `luminance-alpha`
  - : Bộ đệm dữ liệu số nguyên không dấu 2 byte (`LUMINANCE_ALPHA` `GLEnum`).
    Sử dụng CPU: diễn giải {{domxref("XRCPUDepthInformation.data")}} là {{jsxref("Uint8Array")}}.
    Sử dụng GPU: kiểm tra các kênh Luminance và Alpha để lắp ráp lại giá trị đơn.
- `float32`
  - : Bộ đệm dữ liệu dấu phẩy động 4 byte (`R32F` `GLEnum`).
    Sử dụng CPU: diễn giải {{domxref("XRCPUDepthInformation.data")}} là {{jsxref("Float32Array")}}.
    Sử dụng GPU: kiểm tra kênh Red và sử dụng giá trị.

## Ví dụ

Để yêu cầu định dạng dữ liệu mong muốn, bạn cần chỉ định `dataFormatPreference` khi yêu cầu một phiên bằng {{domxref("XRSystem.requestSession()")}}. Ở đây, người gọi có thể xử lý cả định dạng "luminance-alpha" và "float32". Thứ tự thể hiện ưu tiên cho "luminance-alpha":

```js
navigator.xr.requestSession("immersive-ar", {
  requiredFeatures: ["depth-sensing"],
  depthSensing: {
    usagePreference: ["cpu-optimized", "gpu-optimized"],
    formatPreference: ["luminance-alpha", "float32"],
  },
});
```

Để kiểm tra định dạng dữ liệu nào đã được chọn bởi tác nhân người dùng, bạn có thể gọi thuộc tính `depthDataFormat`:

```js
console.log(session.depthDataFormat); // either "luminance-alpha" or "float32"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
