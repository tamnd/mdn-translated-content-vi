---
title: "WebGL2RenderingContext: phương thức deleteTransformFeedback()"
short-title: deleteTransformFeedback()
slug: Web/API/WebGL2RenderingContext/deleteTransformFeedback
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.deleteTransformFeedback
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.deleteTransformFeedback()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) xóa một đối tượng {{domxref("WebGLTransformFeedback")}} đã cho.

## Cú pháp

```js-nolint
deleteTransformFeedback(transformFeedback)
```

### Tham số

- `transformFeedback`
  - : Một đối tượng {{domxref("WebGLTransformFeedback")}} để xóa.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}.
Đối tượng `WebGLTransformFeedback` không có sẵn trong WebGL 1.

```js
const transformFeedback = gl.createTransformFeedback();

// …

gl.deleteTransformFeedback(transformFeedback);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLTransformFeedback")}}