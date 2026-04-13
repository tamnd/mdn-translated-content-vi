---
title: "XRWebGLSubImage: colorTexture property"
short-title: colorTexture
slug: Web/API/XRWebGLSubImage/colorTexture
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRWebGLSubImage.colorTexture
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`colorTexture`** của giao diện {{domxref("XRWebGLSubImage")}} đại diện cho đối tượng {{domxref("WebGLTexture")}} màu sắc cho {{domxref("XRCompositionLayer")}} để kết xuất.

## Giá trị

Một {{domxref("WebGLTexture")}} mờ đục. Xem [WebXR opaque textures](/en-US/docs/Web/API/WebGLTexture#webxr_opaque_textures) để biết chi tiết.

## Ví dụ

### Sử dụng `colorTexture`

Thuộc tính `colorTexture` có thể được truyền vào {{domxref("WebGL2RenderingContext.framebufferTextureLayer()")}} để gắn texture màu sắc vào một framebuffer.

```js
const xrGlBinding = new XRWebGLBinding(xrSession, gl);
const layer = xrGlBinding.createProjectionLayer({
  textureType: "texture-array",
});
const framebuffer = gl.createFramebuffer();

xrSession.updateRenderState({ layers: [layer] });
xrSession.requestAnimationFrame(onXRFrame);

function onXRFrame(time, xrFrame) {
  xrSession.requestAnimationFrame(onXRFrame);

  gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
  const viewport = xrGlBinding.getSubImage(layer, xrFrame).viewport;
  gl.viewport(viewport.x, viewport.y, viewport.width, viewport.height);

  for (const view in xrViewerPose.views) {
    const subImage = xrGlBinding.getViewSubImage(layer, view);
    gl.framebufferTextureLayer(
      gl.FRAMEBUFFER,
      gl.COLOR_ATTACHMENT0,
      subImage.colorTexture,
      0,
      subImage.imageIndex,
    );
    gl.framebufferTextureLayer(
      gl.FRAMEBUFFER,
      gl.DEPTH_ATTACHMENT,
      subImage.depthStencilTexture,
      0,
      subImage.imageIndex,
    );

    // Render from the viewpoint of xrView
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.framebufferTextureLayer()")}}
