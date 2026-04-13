---
title: "XRWebGLDepthInformation: thuộc tính texture"
short-title: texture
slug: Web/API/XRWebGLDepthInformation/texture
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRWebGLDepthInformation.texture
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`texture`** của giao diện {{DOMxRef("XRWebGLDepthInformation")}} là một {{domxref("WebGLTexture")}} chứa thông tin bộ đệm độ sâu dưới dạng texture mờ đục.

## Giá trị

Một {{domxref("WebGLTexture")}}.

## Ví dụ

Sử dụng {{domxref("XRWebGLBinding.getDepthInformation()")}} để lấy thông tin độ sâu GPU. Đối tượng `XRWebGLDepthInformation` trả về sẽ chứa bộ đệm `texture` có thể được liên kết với texture và thông tin bộ đệm độ sâu có thể được cung cấp cho fragment shader WebGL.

```js
const depthInfo = glBinding.getDepthInformation(view);
const uvTransform = depthInfo.normDepthBufferFromNormView.matrix;

const uDepthTextureLocation = gl.getUniformLocation(program, "u_DepthTexture");
const uUVTransformLocation = gl.getUniformLocation(program, "u_UVTransform");
const uRawValueToMeters = gl.getUniformLocation(program, "u_RawValueToMeters");

gl.bindTexture(gl.TEXTURE_2D, depthInfo.texture);
gl.activeTexture(gl.TEXTURE0);
gl.uniform1i(uDepthTextureLocation, 0);

// Phép biến đổi UV để lập chỉ mục đúng vào bản đồ độ sâu
gl.uniformMatrix4fv(uUVTransformLocation, false, uvTransform);

// Hệ số tỷ lệ để chuyển đổi từ số thô sang mét
gl.uniform1f(uRawValueToMeters, depthInfo.rawValueToMeters);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRWebGLBinding.getDepthInformation()")}}
- {{domxref("WebGLRenderingContext.bindTexture()")}}
