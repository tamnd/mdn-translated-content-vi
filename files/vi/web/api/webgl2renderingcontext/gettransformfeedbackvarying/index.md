---
title: "WebGL2RenderingContext: phương thức getTransformFeedbackVarying()"
short-title: getTransformFeedbackVarying()
slug: Web/API/WebGL2RenderingContext/getTransformFeedbackVarying
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getTransformFeedbackVarying
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getTransformFeedbackVarying()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về thông tin về các biến varying từ các bộ đệm {{domxref("WebGLTransformFeedback")}}.

## Cú pháp

```js-nolint
getTransformFeedbackVarying(program, index)
```

### Tham số

- `program`
  - : Một {{domxref("WebGLProgram")}}.
- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của biến varying mà thông tin sẽ được truy xuất.

### Giá trị trả về

Một đối tượng {{domxref("WebGLActiveInfo")}}.

## Ví dụ

```js
activeInfo = gl.getTransformFeedbackVarying(program, 0);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLTransformFeedback")}}