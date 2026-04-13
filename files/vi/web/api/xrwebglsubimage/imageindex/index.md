---
title: "XRWebGLSubImage: imageIndex property"
short-title: imageIndex
slug: Web/API/XRWebGLSubImage/imageIndex
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRWebGLSubImage.imageIndex
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`imageIndex`** của giao diện {{domxref("XRWebGLSubImage")}} là một số đại diện cho vị trí offset vào mảng texture nếu lớp được yêu cầu với `texture-array`; [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) trong trường hợp khác.

## Giá trị

Một số hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu lớp không được yêu cầu với `texture-array`.

### Sử dụng `imageIndex`

Thuộc tính `imageIndex` có thể được truyền vào {{domxref("WebGL2RenderingContext.framebufferTextureLayer()")}} để gắn các texture độ sâu và màu sắc vào một framebuffer với chỉ mục lớp đúng.

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
