---
title: "XRWebGLLayer: framebufferHeight property"
short-title: framebufferHeight
slug: Web/API/XRWebGLLayer/framebufferHeight
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRWebGLLayer.framebufferHeight
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`framebufferHeight`** của {{domxref("XRWebGLLayer")}} cho biết chiều cao của framebuffer, tính bằng pixel.

Bạn có thể lấy chiều rộng của framebuffer bằng thuộc tính {{domxref("XRWebGLLayer.framebufferWidth", "framebufferWidth")}}.

## Giá trị

Chiều cao tính bằng pixel của framebuffer của thiết bị XR. Mỗi attachment của framebuffer (pixel, bộ đệm độ sâu, màu và/hoặc bộ đệm stencil, ví dụ) đều cao bằng số pixel này.

## Ví dụ

Đoạn mã này lấy chiều rộng và chiều cao của framebuffer để sử dụng sau.

```js
let glLayer = xrSession.renderState.baseLayer;
gl.bindFramebuffer(gl.FRAMEBUFFER, glLayer.framebuffer);

frameWidth = glLayer.framebufferHeight;
frameHeight = glLayer.framebufferHeight;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
