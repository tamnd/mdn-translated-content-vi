---
title: "WebGL2RenderingContext: phương thức pauseTransformFeedback()"
short-title: pauseTransformFeedback()
slug: Web/API/WebGL2RenderingContext/pauseTransformFeedback
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.pauseTransformFeedback
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.pauseTransformFeedback()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) tạm dừng một hoạt động transform feedback.

## Cú pháp

```js-nolint
pauseTransformFeedback()
```

### Tham số

Không có.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const transformFeedback = gl.createTransformFeedback();
gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
gl.beginTransformFeedback(gl.TRIANGLES);
gl.pauseTransformFeedback();
// …
gl.resumeTransformFeedback();
gl.drawArrays(gl.TRIANGLES, 0, 3);
gl.endTransformFeedback();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLTransformFeedback")}}