---
title: Tiện ích mở rộng OVR_multiview2
short-title: OVR_multiview2
slug: Web/API/OVR_multiview2
page-type: webgl-extension
browser-compat: api.OVR_multiview2
---

{{APIRef("WebGL")}}

Tiện ích mở rộng `OVR_multiview2` là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và thêm hỗ trợ kết xuất đồng thời vào nhiều view. Điều này đặc biệt hữu ích cho thực tế ảo (VR) và WebXR.

Để biết thêm thông tin, xem:

- [Multiview on WebXR](https://error.ghost.org/)
- [Multiview in babylon.js](https://doc.babylonjs.com/features/featuresDeepDive/cameras/multiViewsPart1)
- [Optimizing Virtual Reality: Understanding Multiview](https://developer.arm.com/community/arm-community-blogs/b/mobile-graphics-and-gaming-blog/posts/optimizing-virtual-reality-understanding-multiview)
- [Multiview WebGL Rendering for Meta Quest](https://developers.meta.com/horizon/documentation/web/web-multiview/)

Các tiện ích mở rộng WebGL có sẵn thông qua phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Sử dụng tiện ích mở rộng](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Hỗ trợ phụ thuộc vào trình điều khiển đồ họa của hệ thống (Windows+ANGLE và Android được hỗ trợ; Windows+GL, Mac, Linux không được hỗ trợ).
>
> Tiện ích mở rộng này chỉ có sẵn cho các ngữ cảnh {{domxref("WebGL2RenderingContext", "WebGL 2", "", 1)}} vì nó cần GLSL 3.00 và mảng texture.
>
> Hiện tại, không có cách nào sử dụng multiview để kết xuất vào backbuffer đa mẫu, vì vậy bạn nên tạo ngữ cảnh với `antialias: false`. Tuy nhiên, trình duyệt Oculus (6+) cũng hỗ trợ đa mẫu bằng tiện ích mở rộng [`OCULUS_multiview`](https://developers.meta.com/horizon/documentation/web/web-multiview/#using-oculus_multiview-in-webgl-20).

## Hằng số

Tiện ích mở rộng này cung cấp 4 hằng số có thể được sử dụng trong [`getParameter()`](/en-US/docs/Web/API/WebGLRenderingContext/getParameter) hoặc [`getFramebufferAttachmentParameter()`](/en-US/docs/Web/API/WebGLRenderingContext/getFramebufferAttachmentParameter).

- `FRAMEBUFFER_ATTACHMENT_TEXTURE_NUM_VIEWS_OVR`
  - : Số lượng view của attachment đối tượng framebuffer.
- `FRAMEBUFFER_ATTACHMENT_TEXTURE_BASE_VIEW_INDEX_OVR`
  - : Chỉ số view cơ sở của attachment đối tượng framebuffer.
- `MAX_VIEWS_OVR`
  - : Số lượng view tối đa. Hầu hết tai nghe VR có hai view, nhưng có các nguyên mẫu tai nghe với FOV siêu rộng sử dụng 4 view là số lượng view tối đa được hỗ trợ bởi multiview.
- `FRAMEBUFFER_INCOMPLETE_VIEW_TARGETS_OVR`
  - : Nếu baseViewIndex không giống nhau cho tất cả các điểm gắn kết framebuffer khi giá trị `FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE` không phải `NONE`, framebuffer được coi là không hoàn chỉnh.

## Phương thức phiên bản

- [`framebufferTextureMultiviewOVR()`](/en-US/docs/Web/API/OVR_multiview2/framebufferTextureMultiviewOVR)
  - : Kết xuất đồng thời vào nhiều phần tử của mảng texture 2D.

## Ví dụ

Ví dụ này được lấy từ [thông số kỹ thuật](https://registry.khronos.org/webgl/extensions/OVR_multiview2/).

```js
const gl = document
  .createElement("canvas")
  .getContext("webgl2", { antialias: false });
const ext = gl.getExtension("OVR_multiview2");
const fb = gl.createFramebuffer();
gl.bindFramebuffer(gl.DRAW_FRAMEBUFFER, fb);

const colorTex = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D_ARRAY, colorTex);
gl.texStorage3D(gl.TEXTURE_2D_ARRAY, 1, gl.RGBA8, 512, 512, 2);
ext.framebufferTextureMultiviewOVR(
  gl.DRAW_FRAMEBUFFER,
  gl.COLOR_ATTACHMENT0,
  colorTex,
  0,
  0,
  2,
);

const depthStencilTex = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D_ARRAY, depthStencilTex);
gl.texStorage3D(gl.TEXTURE_2D_ARRAY, 1, gl.DEPTH32F_STENCIL8, 512, 512, 2);

ext.framebufferTextureMultiviewOVR(
  gl.DRAW_FRAMEBUFFER,
  gl.DEPTH_STENCIL_ATTACHMENT,
  depthStencilTex,
  0,
  0,
  2,
);
gl.drawElements(/* … */); // draw will be broadcasted to the layers of colorTex and depthStencilTex.
```

Mã shader

```glsl
#version 300 es
#extension GL_OVR_multiview2 : require
precision mediump float;
layout (num_views = 2) in;
in vec4 inPos;
uniform mat4 u_viewMatrices[2];
void main() {
  gl_Position = u_viewMatrices[gl_ViewID_OVR] * inPos;
}
```

Ngoài ra, xem bản demo [three.js](https://threejs.org/examples/?q=mult#webgl_multiple_views) để có ví dụ multiview trực tiếp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.getParameter()")}}
- [WebXR](/en-US/docs/Web/API/WebXR_Device_API)
