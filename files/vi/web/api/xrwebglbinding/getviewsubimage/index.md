---
title: "XRWebGLBinding: phương thức getViewSubImage()"
short-title: getViewSubImage()
slug: Web/API/XRWebGLBinding/getViewSubImage
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRWebGLBinding.getViewSubImage
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`getViewSubImage()`** của giao diện {{domxref("XRWebGLBinding")}} trả về đối tượng {{domxref("XRWebGLSubImage")}} đại diện cho kết cấu WebGL cần kết xuất cho một khung nhìn.

## Cú pháp

```js-nolint
getViewSubImage(layer, view)
```

### Tham số

- `layer`
  - : {{domxref("XRProjectionLayer")}} để sử dụng cho kết xuất (để kết xuất các loại lớp khác, xem {{domxref("XRWebGLBinding.getSubImage()")}}).
- `view`
  - : {{domxref("XRView")}} để sử dụng cho kết xuất.

### Giá trị trả về

Đối tượng {{domxref("XRWebGLSubImage")}}.

### Ngoại lệ

{{jsxref("TypeError")}} được ném ra,

- nếu `layer` không có trong [mảng `layer` của phiên](/en-US/docs/Web/API/XRSession/updateRenderState#setting_the_layers_array).

## Ví dụ

### Kết xuất một `XRProjectionLayer`

Ví dụ sau kết xuất một {{domxref("XRProjectionLayer")}} cho một khung nhìn.

```js
const xrGlBinding = new XRWebGLBinding(xrSession, gl);
const layer = xrGlBinding.createProjectionLayer({});
const framebuffer = gl.createFramebuffer();

xrSession.updateRenderState({ layers: [layer] });
xrSession.requestAnimationFrame(onXRFrame);

function onXRFrame(time, xrFrame) {
  xrSession.requestAnimationFrame(onXRFrame);

  gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);

  for (const view in xrViewerPose.views) {
    const subImage = xrGlBinding.getViewSubImage(layer, view);
    gl.framebufferTexture2D(
      gl.FRAMEBUFFER,
      gl.COLOR_ATTACHMENT0,
      gl.TEXTURE_2D,
      subImage.colorTexture,
      0,
    );
    gl.framebufferTexture2D(
      gl.FRAMEBUFFER,
      gl.DEPTH_ATTACHMENT,
      gl.TEXTURE_2D,
      subImage.depthStencilTexture,
      0,
    );
    const viewport = subImage.viewport;
    gl.viewport(viewport.x, viewport.y, viewport.width, viewport.height);

    // Kết xuất từ góc nhìn của xrView
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRWebGLSubImage")}}
