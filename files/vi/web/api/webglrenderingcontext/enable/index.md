---
title: "WebGLRenderingContext: enable() method"
short-title: enable()
slug: Web/API/WebGLRenderingContext/enable
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.enable
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.enable()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) cho phép các khả năng WebGL cụ thể cho bối cảnh này.

## Cú pháp

```js-nolint
enable(cap)
```

### Thông số

- `cap`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định khả năng WebGL nào sẽ được kích hoạt. Khả thi
giá trị:

    | Constant                      | Description                                                                                                                                       |
    | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `gl.BLEND`                    | Activates blending of the computed fragment color values. See {{domxref("WebGLRenderingContext.blendFunc()")}}.                                   |
    | `gl.CULL_FACE`                | Activates culling of polygons. See {{domxref("WebGLRenderingContext.cullFace()")}}.                                                               |
    | `gl.DEPTH_TEST`               | Activates depth comparisons and updates to the depth buffer. See {{domxref("WebGLRenderingContext.depthFunc()")}}.                                |
    | `gl.DITHER`                   | Activates dithering of color components before they get written to the color buffer.                                                              |
    | `gl.POLYGON_OFFSET_FILL`      | Activates adding an offset to depth values of polygon's fragments. See {{domxref("WebGLRenderingContext.polygonOffset()")}}.                      |
    | `gl.SAMPLE_ALPHA_TO_COVERAGE` | Activates the computation of a temporary coverage value determined by the alpha value.                                                            |
    | `gl.SAMPLE_COVERAGE`          | Activates ANDing the fragment's coverage with the temporary coverage value. See {{domxref("WebGLRenderingContext.sampleCoverage()")}}.            |
    | `gl.SCISSOR_TEST`             | Activates the scissor test that discards fragments that are outside of the scissor rectangle. See {{domxref("WebGLRenderingContext.scissor()")}}. |
    | `gl.STENCIL_TEST`             | Activates stencil testing and updates to the stencil buffer. See {{domxref("WebGLRenderingContext.stencilFunc()")}}.                              |

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:

    | Constant                | Description                                                                                                                                              |
    | ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `gl.RASTERIZER_DISCARD` | Primitives are discarded immediately before the rasterization stage, but after the optional transform feedback stage. `gl.clear()` commands are ignored. |

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.enable(gl.DITHER);
```

Để kiểm tra xem một khả năng có được bật hay không, hãy sử dụng phương thức {{domxref("WebGLRenderingContext.isEnabled()")}}:

```js
gl.isEnabled(gl.DITHER);
// true
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.disable()")}}
- {{domxref("WebGLRenderingContext.isEnabled()")}}
