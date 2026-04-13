---
title: "WebGL2RenderingContext: phương thức transformFeedbackVaryings()"
short-title: transformFeedbackVaryings()
slug: Web/API/WebGL2RenderingContext/transformFeedbackVaryings
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.transformFeedbackVaryings
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.transformFeedbackVaryings()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) chỉ định các giá trị sẽ ghi trong các bộ đệm {{domxref("WebGLTransformFeedback")}}.

## Cú pháp

```js-nolint
transformFeedbackVaryings(program, varyings, bufferMode)
```

### Tham số

- `program`
  - : Một {{domxref("WebGLProgram")}}.
- `varyings`
  - : Một {{jsxref("Array")}} chuỗi chỉ định tên của các biến varying sẽ sử dụng.
- `bufferMode`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định chế độ sử dụng khi ghi lại các biến varying. Hoặc `gl.INTERLEAVED_ATTRIBS` hoặc `gl.SEPARATE_ATTRIBS`.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const transformFeedback = gl.createTransformFeedback();
gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
const transformFeedbackOutputs = ["gl_Position", "anotherOutput"];

gl.transformFeedbackVaryings(
  shaderProg,
  transformFeedbackOutputs,
  gl.INTERLEAVED_ATTRIBS,
);
gl.linkProgram(shaderProg);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLTransformFeedback")}}