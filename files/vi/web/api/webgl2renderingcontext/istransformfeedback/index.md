---
title: "WebGL2RenderingContext: phương thức isTransformFeedback()"
short-title: isTransformFeedback()
slug: Web/API/WebGL2RenderingContext/isTransformFeedback
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.isTransformFeedback
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.isTransformFeedback()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu đối tượng được truyền là một đối tượng {{domxref("WebGLTransformFeedback")}} hợp lệ.

## Cú pháp

```js-nolint
isTransformFeedback(transformFeedback)
```

### Tham số

- `transformFeedback`
  - : Một đối tượng {{domxref("WebGLTransformFeedback")}} để kiểm tra.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết đối tượng đã cho có phải là một đối tượng {{domxref("WebGLTransformFeedback")}} hợp lệ (`true`) hay không (`false`).

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}.
Đối tượng `WebGLTransformFeedback` không có sẵn trong WebGL 1.

```js
const transformFeedback = gl.createTransformFeedback();

// …

gl.isTransformFeedback(transformFeedback);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLTransformFeedback")}}