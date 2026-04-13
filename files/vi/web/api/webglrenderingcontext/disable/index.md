---
title: "WebGLRenderingContext: disable() method"
short-title: disable()
slug: Web/API/WebGLRenderingContext/disable
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.disable
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.disable()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) vô hiệu hóa các khả năng cụ thể của WebGL cho bối cảnh này.

## Cú pháp

```js-nolint
disable(capability)
```

### Thông số

- `capability`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định khả năng WebGL nào sẽ bị vô hiệu hóa. Khả thi
giá trị:

    | Constant                      | Description                                                                                                                                         |
    | ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `gl.BLEND`                    | Deactivates blending of the computed fragment color values. See {{domxref("WebGLRenderingContext.blendFunc()")}}.                                   |
    | `gl.CULL_FACE`                | Deactivates culling of polygons. See {{domxref("WebGLRenderingContext.cullFace()")}}.                                                               |
    | `gl.DEPTH_TEST`               | Deactivates depth comparisons and updates to the depth buffer. See {{domxref("WebGLRenderingContext.depthFunc()")}}.                                |
    | `gl.DITHER`                   | Deactivates dithering of color components before they get written to the color buffer.                                                              |
    | `gl.POLYGON_OFFSET_FILL`      | Deactivates adding an offset to depth values of polygon's fragments. See {{domxref("WebGLRenderingContext.polygonOffset()")}}.                      |
    | `gl.SAMPLE_ALPHA_TO_COVERAGE` | Deactivates the computation of a temporary coverage value determined by the alpha value.                                                            |
    | `gl.SAMPLE_COVERAGE`          | Deactivates ANDing the fragment's coverage with the temporary coverage value. See {{domxref("WebGLRenderingContext.sampleCoverage()")}}.            |
    | `gl.SCISSOR_TEST`             | Deactivates the scissor test that discards fragments that are outside of the scissor rectangle. See {{domxref("WebGLRenderingContext.scissor()")}}. |
    | `gl.STENCIL_TEST`             | Deactivates stencil testing and updates to the stencil buffer. See {{domxref("WebGLRenderingContext.stencilFunc()")}}.                              |

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:

    | Constant                | Description                                                                                                                                                               |
    | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `gl.RASTERIZER_DISCARD` | Deactivates that primitives are discarded immediately before the rasterization stage, but after the optional transform feedback stage. `gl.clear()` commands are ignored. |

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.disable(gl.DITHER);
```

Để kiểm tra xem một khả năng có bị vô hiệu hóa hay không, hãy sử dụng phương thức {{domxref("WebGLRenderingContext.isEnabled()")}}:

```js
gl.isEnabled(gl.DITHER);
// false
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.enable()")}}
- {{domxref("WebGLRenderingContext.isEnabled()")}}
