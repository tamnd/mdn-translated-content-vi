---
title: "XRWebGLLayer: framebufferWidth property"
short-title: framebufferWidth
slug: Web/API/XRWebGLLayer/framebufferWidth
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRWebGLLayer.framebufferWidth
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`framebufferWidth`** của {{domxref("XRWebGLLayer")}} chỉ định chiều rộng của framebuffer, tính bằng pixel.

Bạn có thể lấy chiều cao của framebuffer bằng thuộc tính {{domxref("XRWebGLLayer.framebufferHeight", "framebufferHeight")}}.

## Giá trị

Chiều rộng tính bằng pixel của framebuffer của thiết bị XR. Mỗi attachment của framebuffer (pixel, bộ đệm độ sâu, màu và/hoặc bộ đệm stencil, ví dụ) đều rộng bằng số pixel này.

## Ví dụ

Đoạn mã này lấy chiều rộng và chiều cao của framebuffer để sử dụng sau.

```js
let glLayer = xrSession.renderState.baseLayer;
gl.bindFramebuffer(gl.FRAMEBUFFER, glLayer.framebuffer);

frameWidth = glLayer.framebufferWidth;
frameHeight = glLayer.framebufferHeight;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
