---
title: "WebGLRenderingContext: isEnabled() method"
short-title: isEnabled()
slug: Web/API/WebGLRenderingContext/isEnabled
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.isEnabled
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.isEnabled()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) kiểm tra xem một khả năng WebGL cụ thể có được kích hoạt hay không cho bối cảnh này.

Theo mặc định, tất cả các khả năng ngoại trừ `gl.DITHER` đều bị **tắt**.

## Cú pháp

```js-nolint
isEnabled(cap)
```

### Thông số

- `cap`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định khả năng WebGL nào cần kiểm tra. Các giá trị có thể:

    | Constant                      | Description                                                                                                                         |
    | ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
    | `gl.BLEND`                    | Blending of the computed fragment color values. See {{domxref("WebGLRenderingContext.blendFunc()")}}.                               |
    | `gl.CULL_FACE`                | Culling of polygons. See {{domxref("WebGLRenderingContext.cullFace()")}}.                                                           |
    | `gl.DEPTH_TEST`               | Depth comparisons and updates to the depth buffer. See {{domxref("WebGLRenderingContext.depthFunc()")}}.                            |
    | `gl.DITHER`                   | Dithering of color components before they get written to the color buffer.                                                          |
    | `gl.POLYGON_OFFSET_FILL`      | Adding an offset to depth values of polygon's fragments. See {{domxref("WebGLRenderingContext.polygonOffset()")}}.                  |
    | `gl.SAMPLE_ALPHA_TO_COVERAGE` | Computation of a temporary coverage value determined by the alpha value.                                                            |
    | `gl.SAMPLE_COVERAGE`          | ANDing the fragment's coverage with the temporary coverage value. See {{domxref("WebGLRenderingContext.sampleCoverage()")}}.        |
    | `gl.SCISSOR_TEST`             | Scissor test that discards fragments that are outside of the scissor rectangle. See {{domxref("WebGLRenderingContext.scissor()")}}. |
    | `gl.STENCIL_TEST`             | Stencil testing and updates to the stencil buffer. See {{domxref("WebGLRenderingContext.stencilFunc()")}}.                          |

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:

    | Constant                | Description                                                                                                                                              |
    | ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `gl.RASTERIZER_DISCARD` | Primitives are discarded immediately before the rasterization stage, but after the optional transform feedback stage. `gl.clear()` commands are ignored. |

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết khả năng _cap_ có được bật hay không (`true`), hay không (`false`).

## Ví dụ

```js
gl.isEnabled(gl.STENCIL_TEST);
// false
```

Để kích hoạt hoặc hủy kích hoạt một khả năng cụ thể, hãy sử dụng các phương thức {{domxref("WebGLRenderingContext.enable()")}} và {{domxref("WebGLRenderingContext.disable()")}}:

```js
gl.enable(gl.STENCIL_TEST);
gl.disable(gl.STENCIL_TEST);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.enable()")}}
- {{domxref("WebGLRenderingContext.disable()")}}
