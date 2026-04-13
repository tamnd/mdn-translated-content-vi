---
title: "WebGL2RenderingContext: phương thức bindTransformFeedback()"
short-title: bindTransformFeedback()
slug: Web/API/WebGL2RenderingContext/bindTransformFeedback
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.bindTransformFeedback
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.bindTransformFeedback()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) liên kết một đối tượng {{domxref("WebGLTransformFeedback")}} đã cho với trạng thái GL hiện tại.

## Cú pháp

```js-nolint
bindTransformFeedback(target, transformFeedback)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định target (điểm liên kết). Phải là `gl.TRANSFORM_FEEDBACK`.
- `transformFeedback`
  - : Một đối tượng {{domxref("WebGLTransformFeedback")}} để liên kết.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const transformFeedback = gl.createTransformFeedback();
gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLTransformFeedback")}}
