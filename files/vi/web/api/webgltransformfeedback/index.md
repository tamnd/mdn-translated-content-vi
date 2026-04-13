---
title: WebGLTransformFeedback
slug: Web/API/WebGLTransformFeedback
page-type: web-api-interface
browser-compat: api.WebGLTransformFeedback
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **`WebGLTransformFeedback`** là một phần của [WebGL 2](/en-US/docs/Web/API/WebGL_API) API và cho phép transform feedback, là quá trình bắt các primitives được tạo ra bởi quá trình xử lý vertex. Nó cho phép bảo tồn trạng thái rendering sau khi transform của một đối tượng và gửi lại dữ liệu này nhiều lần.

{{InheritanceDiagram}}

Khi làm việc với các đối tượng `WebGLTransformFeedback`, các phương thức sau của {{domxref("WebGL2RenderingContext")}} hữu ích:

- {{domxref("WebGL2RenderingContext.createTransformFeedback()")}}
- {{domxref("WebGL2RenderingContext.deleteTransformFeedback()")}}
- {{domxref("WebGL2RenderingContext.isTransformFeedback()")}}
- {{domxref("WebGL2RenderingContext.bindTransformFeedback()")}}
- {{domxref("WebGL2RenderingContext.beginTransformFeedback()")}}
- {{domxref("WebGL2RenderingContext.endTransformFeedback()")}}
- {{domxref("WebGL2RenderingContext.pauseTransformFeedback()")}}
- {{domxref("WebGL2RenderingContext.resumeTransformFeedback()")}}
- {{domxref("WebGL2RenderingContext.transformFeedbackVaryings()")}}
- {{domxref("WebGL2RenderingContext.getTransformFeedbackVarying()")}}

## Ví dụ

### Tạo đối tượng `WebGLTransformFeedback`

Trong ví dụ này, `gl` phải là một {{domxref("WebGL2RenderingContext")}}. Các đối tượng `WebGLTransformFeedback` không có sẵn trong WebGL 1.

```js
const transformFeedback = gl.createTransformFeedback();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
