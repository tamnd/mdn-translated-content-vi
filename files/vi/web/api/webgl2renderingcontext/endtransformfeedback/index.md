---
title: "WebGL2RenderingContext: phương thức endTransformFeedback()"
short-title: endTransformFeedback()
slug: Web/API/WebGL2RenderingContext/endTransformFeedback
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.endTransformFeedback
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.endTransformFeedback()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) kết thúc một hoạt động transform feedback.

## Cú pháp

```js-nolint
endTransformFeedback()
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
gl.drawArrays(gl.TRIANGLES, 0, 3);
gl.endTransformFeedback();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLTransformFeedback")}}